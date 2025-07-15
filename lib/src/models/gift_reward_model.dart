import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:printeasy_utils/printeasy_utils.dart';

class GiftRewardModel {

  /// JSON to Model
  factory GiftRewardModel.fromMap(Map<String, dynamic> json) => GiftRewardModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      minOrderAmount: (json['minOrderAmount'] ?? 0).toDouble(),
      giftType: GiftType.values.byName(json['giftType'] ?? 'other'),
      discountPercentage: (json['discountPercentage'] as num?)?.toDouble(),
      discountAmount: (json['discountAmount'] as num?)?.toDouble(),
      productId: json['productId'],
      createdAt: DateTime.tryParse(json['createdAt'] ?? '') ?? DateTime.now(),
      isActive: json['isActive'] ?? true,
    );

  GiftRewardModel({
    required this.id,
    required this.title,
    required this.minOrderAmount,
    required this.giftType,
    this.discountPercentage,
    this.discountAmount,
    this.productId,
    required this.createdAt,
    required this.isActive,
  });

  factory GiftRewardModel.fromJson(String source) =>
      GiftRewardModel.fromMap(json.decode(source));
  final String id;
  final String title;
  final double minOrderAmount;
  final GiftType giftType;
  final double? discountPercentage;
  final double? discountAmount;
  final String? productId;
  final DateTime createdAt;
  final bool isActive;

  /// Model to JSON
  Map<String, dynamic> toMap() => {
      'id': id,
      'title': title,
      'minOrderAmount': minOrderAmount,
      'giftType': giftType.name,
      'discountPercentage': discountPercentage,
      'discountAmount': discountAmount,
      'productId': productId,
      'createdAt': createdAt.toIso8601String(),
      'isActive': isActive,
    };

  String toJson() => json.encode(toMap());

  // 🔁 Clone
  GiftRewardModel copyWith({
    String? id,
    String? title,
    double? minOrderAmount,
    GiftType? giftType,
    double? discountPercentage,
    double? discountAmount,
    String? productId,
    DateTime? createdAt,
    bool? isActive,
  }) => GiftRewardModel(
      id: id ?? this.id,
      title: title ?? this.title,
      minOrderAmount: minOrderAmount ?? this.minOrderAmount,
      giftType: giftType ?? this.giftType,
      discountPercentage: discountPercentage ?? this.discountPercentage,
      discountAmount: discountAmount ?? this.discountAmount,
      productId: productId ?? this.productId,
      createdAt: createdAt ?? this.createdAt,
      isActive: isActive ?? this.isActive,
    );

  // 🧠 Computed Getters
  bool get isDiscount => giftType == GiftType.discount;
  bool get isProductGift => giftType == GiftType.product;
  bool get isFreeDelivery => giftType == GiftType.freeDelivery;

  IconData get icon {
    switch (giftType) {
      case GiftType.freeDelivery:
        return Icons.local_shipping;
      case GiftType.discount:
        return Icons.discount_outlined;
      case GiftType.product:
        return Icons.shopping_bag;
      case GiftType.other:
        return Icons.card_giftcard;
    }
  }

  // 📦 List Utilities
  static List<GiftRewardModel> listFromJson(String source) {
    final List decoded = json.decode(source);
    return decoded.map((e) => GiftRewardModel.fromMap(e)).toList();
  }

  static String listToJson(List<GiftRewardModel> list) => json.encode(list.map((e) => e.toMap()).toList());


  // 🧩 Equality
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GiftRewardModel &&
        other.id == id &&
        other.title == title &&
        other.minOrderAmount == minOrderAmount &&
        other.giftType == giftType &&
        other.discountPercentage == discountPercentage &&
        other.discountAmount == discountAmount &&
        other.productId == productId &&
        other.createdAt == createdAt &&
        other.isActive == isActive;
  }

  @override
  int get hashCode => id.hashCode ^
        title.hashCode ^
        minOrderAmount.hashCode ^
        giftType.hashCode ^
        discountPercentage.hashCode ^
        discountAmount.hashCode ^
        productId.hashCode ^
        createdAt.hashCode ^
        isActive.hashCode;

  @override
  String toString() => 'GiftRewardModel(id: $id, title: $title, minOrderAmount: $minOrderAmount, giftType: $giftType, discountPercentage: $discountPercentage, discountAmount: $discountAmount, productId: $productId, createdAt: $createdAt, isActive: $isActive)';
}
