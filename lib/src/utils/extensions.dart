import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:printeasy_utils/printeasy_utils.dart';
import 'package:printeasy_utils/src/models/gift_reward_model.dart';
import 'package:shimmer/shimmer.dart';

extension BuildContextExtension on BuildContext {
  LayoutType get type => LayoutType.fromWidth(MediaQuery.of(this).size.width);

  bool get isDesktopLarge => type == LayoutType.desktopLarge;

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
        if (v is String) {
          if (!removeEmptyStrings || v.trim().isNotEmpty) {
            result[k] = v;
          }
        } else if (v is List) {
          if (!removeEmptyLists || v.isNotEmpty) {
            result[k] = v.map((e) {
              if (e is Map) {
                return Map<String, dynamic>.from(e).removeNullValues(
                  removeEmptyStrings: removeEmptyStrings,
                  removeEmptyLists: removeEmptyLists,
                );
              }
              return e;
            }).toList();
          }
        } else if (v is Map) {
          result[k] = Map<String, dynamic>.from(v).removeNullValues(
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

extension WidgetExtension on Widget {
  Widget get shimmer => Shimmer.fromColors(
        baseColor: AppColors.onPrimary,
        highlightColor: AppColors.imageBackground,
        child: this,
      );
}

/// ─────────────────────────────────────────────────────────────
/// 🎁 Extension on GiftType (Icon, Color, Emoji, JSON, etc.)
/// ─────────────────────────────────────────────────────────────
extension GiftTypeExtension on GiftType {
  /// Icon representing each GiftType
  IconData get icon {
    switch (this) {
      case GiftType.discount:
        return Icons.percent;
      case GiftType.product:
        return Icons.shopping_bag;
      case GiftType.freeDelivery:
        return Icons.local_shipping;
      case GiftType.other:
        return Icons.card_giftcard;
    }
  }

  /// Label for UI display
  String get label {
    switch (this) {
      case GiftType.discount:
        return 'Discount';
      case GiftType.product:
        return 'Free Product';
      case GiftType.freeDelivery:
        return 'Free Delivery';
      case GiftType.other:
        return 'Special Reward';
    }
  }

  /// Emoji representation (for fun or quick visual cues)
  String get emoji {
    switch (this) {
      case GiftType.discount:
        return '💸';
      case GiftType.product:
        return '🎁';
      case GiftType.freeDelivery:
        return '🚚';
      case GiftType.other:
        return '✨';
    }
  }

  /// Primary color for chip/icon/text
  Color get color {
    switch (this) {
      case GiftType.discount:
        return Colors.orange;
      case GiftType.product:
        return Colors.purple;
      case GiftType.freeDelivery:
        return Colors.blue;
      case GiftType.other:
        return Colors.teal;
    }
  }

  /// Background color for tags/badges (10% opacity)
  Color get backgroundColor => color.withValues(alpha: .1);

  /// To JSON-safe string
  String get value => name;

  /// Capitalized version of the label
  String get capitalized => label;

  /// Safely convert string to enum
  static GiftType fromName(String? name) {
    if (name == null) return GiftType.other;
    return GiftType.values.firstWhere(
      (e) => e.name == name,
      orElse: () => GiftType.other,
    );
  }
}


extension GiftRewardListExtension on List<GiftRewardModel> {
  /// Returns all active and eligible rewards for the given [cartTotal].
  List<GiftRewardModel> availableRewards(double cartTotal) => where((r) => r.isActive && r.minOrderAmount <= cartTotal)
        .toList()
      ..sort((a, b) => a.minOrderAmount.compareTo(b.minOrderAmount));

  /// Returns the highest-value reward currently unlocked.
  GiftRewardModel? currentUnlockedReward(double cartTotal) {
    final unlocked = availableRewards(cartTotal);
    return unlocked.isNotEmpty ? unlocked.last : null;
  }

  /// Returns the next reward to be unlocked above current [cartTotal].
  GiftRewardModel? nextUnlockableReward(double cartTotal) {
    final future = where((r) => r.isActive && r.minOrderAmount > cartTotal)
        .toList();
    if (future.isEmpty) return null;
    return future.reduce((a, b) =>
        a.minOrderAmount < b.minOrderAmount ? a : b);
  }

  /// Returns `true` if a reward with [id] is unlocked for [cartTotal].
  bool isRewardUnlocked(String id, double cartTotal) {
    final match = where((r) => r.id == id);
    if (match.isEmpty) return false;
    final reward = match.first;
    return reward.isActive && cartTotal >= reward.minOrderAmount;
  }

  /// Returns only the rewards of a specific [GiftType].
  List<GiftRewardModel> ofType(GiftType type, {bool onlyActive = true}) => where((r) =>
        r.giftType == type && (onlyActive ? r.isActive : true)).toList();

  /// Returns the total discount amount from all applicable unlocked rewards.
  double totalDiscountAmount(double cartTotal) => availableRewards(cartTotal)
        .map((r) => r.discountAmount ?? 0)
        .fold(0.0, (a, b) => a + b);
}
