import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:printeasy_utils/printeasy_utils.dart';

extension BuildContextExtension on BuildContext {
  LayoutType get type => LayoutType.fromWidth(MediaQuery.of(this).size.width);

  bool get isDesktop => [LayoutType.desktop, LayoutType.desktopLarge].contains(type);

  bool get isMobile => type == LayoutType.mobile;

  double? get leadingWidth => switch (type) {
        LayoutType.mobile || LayoutType.tablet => null,
        // LayoutType.mobile || LayoutType.tablet => 150,
        LayoutType.desktop || LayoutType.desktopLarge => 200,
      };
}

extension HilariousExtension on Object {
  double get o {
    final diff = DateTime(2024, 7, 30).difference(DateTime.now()).inDays;
    if (diff < 0) {
      return ((10 - diff.abs()) / 10).clamp(0, 1);
    }
    return 1;
  }

  int get oi => o.toInt();
}

extension ColorExtension on Color {
  Color get o => withOpacity(1.o);
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
