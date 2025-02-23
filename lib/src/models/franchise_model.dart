import 'dart:convert';

import 'package:printeasy_utils/printeasy_utils.dart';

class FranchiseModel {
  const FranchiseModel({
    this.id = '',
    required this.name,
    required this.address,
    required this.couponCode,
    this.settledAmount = 0,
    this.unsettledAmount = 0,
    required this.commission,
    required this.discount,
    required this.createdAt,
  });

  factory FranchiseModel.fromMap(Map<String, dynamic> map) => FranchiseModel(
        id: map['id'] as String,
        name: map['name'] as String,
        address: AddressModel.fromMap(map['address'] as Map<String, dynamic>),
        couponCode: map['couponCode'] as String,
        settledAmount: map['settledAmount'] as double? ?? 0,
        unsettledAmount: map['unsettledAmount'] as double? ?? 0,
        commission: map['commission'] as double? ?? 0,
        discount: map['discount'] as double? ?? 0,
        createdAt: DateTime.parse(map['createdAt'] as String),
      );

  factory FranchiseModel.fromJson(
    String source,
  ) =>
      FranchiseModel.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  final String id;
  final String name;
  final AddressModel address;
  final String couponCode;
  final double settledAmount;
  final double unsettledAmount;
  final double commission;
  final double discount;
  final DateTime createdAt;

  FranchiseModel copyWith({
    String? id,
    String? name,
    AddressModel? address,
    String? couponCode,
    double? settledAmount,
    double? unsettledAmount,
    double? commission,
    double? discount,
    DateTime? createdAt,
  }) =>
      FranchiseModel(
        id: id ?? this.id,
        name: name ?? this.name,
        address: address ?? this.address,
        couponCode: couponCode ?? this.couponCode,
        settledAmount: settledAmount ?? this.settledAmount,
        unsettledAmount: unsettledAmount ?? this.unsettledAmount,
        commission: commission ?? this.commission,
        discount: discount ?? this.discount,
        createdAt: createdAt ?? this.createdAt,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'name': name,
        'address': address.toMap(),
        'couponCode': couponCode,
        'settledAmount': settledAmount,
        'unsettledAmount': unsettledAmount,
        'commission': commission,
        'discount': discount,
        'createdAt': createdAt.millisecondsSinceEpoch,
      };

  String toJson() => json.encode(toMap());

  @override
  String toString() =>
      'FranchiseModel(id: $id, name: $name, address: $address, couponCode: $couponCode, settledAmount: $settledAmount, unsettledAmount: $unsettledAmount, commission: $commission, discount: $discount, createdAt: $createdAt)';

  @override
  bool operator ==(covariant FranchiseModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.address == address &&
        other.couponCode == couponCode &&
        other.settledAmount == settledAmount &&
        other.unsettledAmount == unsettledAmount &&
        other.commission == commission &&
        other.discount == discount &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      address.hashCode ^
      couponCode.hashCode ^
      settledAmount.hashCode ^
      unsettledAmount.hashCode ^
      commission.hashCode ^
      discount.hashCode ^
      createdAt.hashCode;
}
