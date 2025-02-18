import 'dart:convert';

class CommissionModel {
  const CommissionModel({
    required this.id,
    required this.userId,
    required this.franchiseId,
    required this.orderId,
    required this.coupon,
    required this.isSettled,
    required this.amount,
    required this.createdAt,
  });

  factory CommissionModel.fromMap(Map<String, dynamic> map) => CommissionModel(
        id: map['id'] as String,
        userId: map['userId'] as String,
        franchiseId: map['franchiseId'] as String,
        orderId: map['orderId'] as String,
        coupon: map['coupon'] as String,
        isSettled: map['isSettled'] as bool,
        amount: map['amount'] as double,
        createdAt: DateTime.parse(map['createdAt'] as String),
      );

  factory CommissionModel.fromJson(
    String source,
  ) =>
      CommissionModel.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  final String id;
  final String userId;
  final String franchiseId;
  final String orderId;
  final String coupon;
  final bool isSettled;
  final double amount;
  final DateTime createdAt;

  CommissionModel copyWith({
    String? id,
    String? userId,
    String? franchiseId,
    String? orderId,
    String? coupon,
    bool? isSettled,
    double? amount,
    DateTime? createdAt,
  }) =>
      CommissionModel(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        franchiseId: franchiseId ?? this.franchiseId,
        orderId: orderId ?? this.orderId,
        coupon: coupon ?? this.coupon,
        isSettled: isSettled ?? this.isSettled,
        amount: amount ?? this.amount,
        createdAt: createdAt ?? this.createdAt,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'userId': userId,
        'franchiseId': franchiseId,
        'orderId': orderId,
        'coupon': coupon,
        'isSettled': isSettled,
        'amount': amount,
        'createdAt': createdAt.millisecondsSinceEpoch,
      };

  String toJson() => json.encode(toMap());

  @override
  String toString() =>
      'CommissionModel(id: $id, userId: $userId, franchiseId: $franchiseId, orderId: $orderId, coupon: $coupon, isSettled: $isSettled, amount: $amount, createdAt: $createdAt)';

  @override
  bool operator ==(covariant CommissionModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.userId == userId &&
        other.franchiseId == franchiseId &&
        other.orderId == orderId &&
        other.coupon == coupon &&
        other.isSettled == isSettled &&
        other.amount == amount &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode =>
      id.hashCode ^
      userId.hashCode ^
      franchiseId.hashCode ^
      orderId.hashCode ^
      coupon.hashCode ^
      isSettled.hashCode ^
      amount.hashCode ^
      createdAt.hashCode;
}
