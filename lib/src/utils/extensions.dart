import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:printeasy_utils/printeasy_utils.dart';

extension BuildContextExtension on BuildContext {
  LayoutType get type => LayoutType.fromWidth(MediaQuery.of(this).size.width);

  bool get isDesktop => [LayoutType.desktop, LayoutType.desktopLarge].contains(type);

  bool get isMobile => [LayoutType.mobile, LayoutType.mobileSmall].contains(type);

  bool get isSmallMobile => type == LayoutType.mobileSmall;

  double? get leadingWidth => switch (type) {
        LayoutType.mobileSmall || LayoutType.mobile || LayoutType.tablet => null,
        // LayoutType.mobile || LayoutType.tablet => 150,
        LayoutType.desktop || LayoutType.desktopLarge => 200,
      };

  double get _scaleFactor => switch (type) {
        LayoutType.mobileSmall => 0.7,
        LayoutType.mobile => 0.8,
        LayoutType.tablet => 0.9,
        LayoutType.desktop => 1,
        LayoutType.desktopLarge => 1,
      };

  TextStyle? get displayLarge => textTheme.displayLarge?.copyWith(
        fontSize: 57 * _scaleFactor,
      );

  TextStyle? get displayMedium => textTheme.displayMedium?.copyWith(
        fontSize: 45 * _scaleFactor,
      );

  TextStyle? get displaySmall => textTheme.displaySmall?.copyWith(
        fontSize: 36 * _scaleFactor,
      );

  TextStyle? get headlineLarge => textTheme.headlineLarge?.copyWith(
        fontSize: 32 * _scaleFactor,
      );

  TextStyle? get headlineMedium => textTheme.headlineMedium?.copyWith(
        fontSize: 28 * _scaleFactor,
      );

  TextStyle? get headlineSmall => textTheme.headlineSmall?.copyWith(
        fontSize: 24 * _scaleFactor,
      );

  TextStyle? get titleLarge => textTheme.titleLarge?.copyWith(
        fontSize: 22 * _scaleFactor,
      );

  TextStyle? get titleMedium => textTheme.titleMedium?.copyWith(
        fontSize: 16 * _scaleFactor,
      );

  TextStyle? get titleSmall => textTheme.titleSmall?.copyWith(
        fontSize: 14 * _scaleFactor,
      );

  TextStyle? get bodyLarge => textTheme.bodyLarge?.copyWith(
        fontSize: 16 * _scaleFactor,
      );

  TextStyle? get bodyMedium => textTheme.bodyMedium?.copyWith(
        fontSize: 14 * _scaleFactor,
      );

  TextStyle? get bodySmall => textTheme.bodySmall?.copyWith(
        fontSize: 12 * _scaleFactor,
      );

  TextStyle? get labelLarge => textTheme.labelLarge?.copyWith(
        fontSize: 14 * _scaleFactor,
      );

  TextStyle? get labelMedium => textTheme.labelMedium?.copyWith(
        fontSize: 12 * _scaleFactor,
      );

  TextStyle? get labelSmall => textTheme.labelSmall?.copyWith(
        fontSize: 11 * _scaleFactor,
      );
}

extension OrderStatusExtension on OrderStatus {
  String get description {
    switch (this) {
      case OrderStatus.paymentPending:
        return 'Order has been processed but payment is pending';
      case OrderStatus.confirmed:
        return 'Order has been confirmed';
      case OrderStatus.preparing:
        return 'Order is being processed';
      case OrderStatus.ready:
        return 'Order is ready, waiting for delivery partner';
      case OrderStatus.shipped:
        return 'Order has been shipped';
      case OrderStatus.outForDelivery:
        return 'Order is out for delivery';
      case OrderStatus.delivered:
        return 'Order has been delivered';
      case OrderStatus.cancelled:
        return 'Order has been canceled';
      case OrderStatus.returned:
        return 'Order has been returned';
      case OrderStatus.refunded:
        return 'Order has been refunded';
    }
  }

  String get actionLabel {
    switch (this) {
      case OrderStatus.paymentPending:
        return 'Pay';
      case OrderStatus.confirmed:
        return 'Start Preparing';
      case OrderStatus.preparing:
        return 'Ready';
      case OrderStatus.ready:
        return 'Ship Order';
      case OrderStatus.shipped:
      case OrderStatus.outForDelivery:
      case OrderStatus.delivered:
      case OrderStatus.cancelled:
      case OrderStatus.returned:
      case OrderStatus.refunded:
        return label;
    }
  }

  OrderStatus get nextStatus => switch (this) {
        OrderStatus.paymentPending => OrderStatus.confirmed,
        OrderStatus.confirmed => OrderStatus.preparing,
        OrderStatus.preparing => OrderStatus.ready,
        OrderStatus.ready => OrderStatus.shipped,
        OrderStatus.shipped => OrderStatus.outForDelivery,
        OrderStatus.outForDelivery => OrderStatus.delivered,
        _ => this,
      };
}

extension DateTimeExtension on DateTime {
  String get formatDateTime => DateFormat('yyyy-MM-dd HH:mm').format(this);

  String get formatDate => DateFormat('dd MMM yy').format(this);
}

extension FirestoreReferenceExtension<T> on DocumentReference<T> {
  Future<T?> data() async {
    try {
      final data = await get();
      return data.data();
    } catch (_) {
      return null;
    }
  }
}

extension RepoResponseExtension on RepoResponse<String> {
  Map<String, dynamic> get body => jsonDecode(data!)['data'];

  List<dynamic> get bodyList => statusCode == 204 ? [] : jsonDecode(data!)['data'] ?? [];
}

extension MapExtension on Map<String, dynamic> {
  Map<String, dynamic> removeNullValues({
    bool removeEmptyStrings = false,
    bool removeEmptyLists = false,
  }) {
    var result = <String, dynamic>{};
    for (var entry in entries) {
      var k = entry.key;
      var v = entry.value;
      if (v != null) {
        if (v.runtimeType.toString().startsWith('String')) {
          if (!removeEmptyStrings || (v as String).trim().isNotEmpty) {
            result[k] = v;
          }
        } else if (v.runtimeType.toString().contains('List') || v.runtimeType.toString().contains('Array')) {
          if (!removeEmptyLists || (v as List).isNotEmpty) {
            result[k] = v.map((e) {
              if (e.runtimeType.toString().contains('Map')) {
                return (e as Map<String, dynamic>).removeNullValues(
                  removeEmptyStrings: removeEmptyStrings,
                  removeEmptyLists: removeEmptyLists,
                );
              }
              return e;
            }).toList();
          }
        } else if (v.runtimeType.toString().contains('Map')) {
          result[k] = MapExtension(v as Map<String, dynamic>).removeNullValues(
            removeEmptyStrings: removeEmptyStrings,
            removeEmptyLists: removeEmptyLists,
          );
        } else {
          result[k] = v;
        }
      }
    }
    return result;
  }

  String makeQuery() {
    var res = [];
    for (var entry in removeNullValues().entries) {
      var key = entry.key;
      var value = entry.value;
      res.add('$key=$value');
    }
    return res.join('&');
  }
}
