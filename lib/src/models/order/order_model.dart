import 'dart:convert';

import 'package:printeasy_utils/printeasy_utils.dart';

class OrderModel {
  OrderModel({
    this.orderId,
    this.shipmentId,
    this.razorpay,
    required this.subcategory,
    this.userId,
    this.user,
    required this.totalAmount,
    this.orderDate,
    this.status = OrderStatus.paymentPending,
    required this.items,
    this.shippingAddressId,
    this.billingAddressId,
    this.shippingAddress,
    this.billingAddress,
  });

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    var model = OrderModel(
      orderId: map['orderId'] as String?,
      shipmentId: map['shipmentId'] as String?,
      razorpay: map['razorpay'] != null ? RazorpayPaymentModel.fromMap(map['razorpay']) : null,
      subcategory: Subcategory.fromName(map['subcategory'] as String? ?? ''),
      userId: map['userId'] as String?,
      user: map['user'] != null ? UserModel.fromMap(map['user'] as Map<String, dynamic>) : null,
      totalAmount: map['totalAmount'] as double,
      orderDate: map['orderDate'] != null ? DateTime.parse(map['orderDate'] as String) : null,
      status: OrderStatus.fromName(map['status'] as String? ?? ''),
      items: (map['items'] as List? ?? [])
          .map<ItemModel>(
            (x) => ItemModel.fromMap(x as Map<String, dynamic>),
          )
          .toList(),
      shippingAddressId: map['shippingAddressId'] as String?,
      billingAddressId: map['billingAddressId'] as String?,
      shippingAddress: map['shippingAddress'] != null ? AddressModel.fromMap(map['shippingAddress'] as Map<String, dynamic>) : null,
      billingAddress: map['billingAddress'] != null ? AddressModel.fromMap(map['shippingAddress'] as Map<String, dynamic>) : null,
    );

    model = model.copyWith(
      subcategory: model.items.first.subcategory,
    );

    return model;
  }

  factory OrderModel.fromJson(String source) => OrderModel.fromMap(json.decode(source) as Map<String, dynamic>);

  final String? orderId;
  final String? shipmentId;
  final Subcategory subcategory;
  final RazorpayPaymentModel? razorpay;
  final String? userId;
  final UserModel? user;
  final double totalAmount;
  final DateTime? orderDate;
  final OrderStatus status;
  final List<ItemModel> items;
  final String? shippingAddressId;
  final AddressModel? shippingAddress;
  final String? billingAddressId;
  final AddressModel? billingAddress;

  String get mobile => user?.phone ?? '';

  OrderModel copyWith({
    String? orderId,
    String? shipmentId,
    RazorpayPaymentModel? razorpay,
    Subcategory? subcategory,
    String? userId,
    UserModel? user,
    double? totalAmount,
    DateTime? orderDate,
    OrderStatus? status,
    List<ItemModel>? items,
    String? shippingAddressId,
    String? billingAddressId,
    AddressModel? shippingAddress,
    AddressModel? billingAddress,
  }) =>
      OrderModel(
        orderId: orderId ?? this.orderId,
        shipmentId: shipmentId ?? this.shipmentId,
        razorpay: razorpay ?? this.razorpay,
        subcategory: subcategory ?? this.subcategory,
        userId: userId ?? this.userId,
        user: user ?? this.user,
        totalAmount: totalAmount ?? this.totalAmount,
        orderDate: orderDate ?? this.orderDate,
        status: status ?? this.status,
        items: items ?? this.items,
        shippingAddressId: shippingAddressId ?? this.shippingAddressId,
        billingAddressId: billingAddressId ?? this.billingAddressId,
        shippingAddress: shippingAddress ?? this.shippingAddress,
        billingAddress: billingAddress ?? this.billingAddress,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'orderId': orderId,
        'shipmentId': shipmentId,
        'razorpay': razorpay?.toMap(),
        'subcategory': subcategory.name,
        'userId': userId,
        'user': user?.toMap(),
        'totalAmount': totalAmount,
        'orderDate': orderDate?.toIso8601String(),
        'status': status.name,
        'items': items.map((x) => x.toMap()).toList(),
        'shippingAddressId': shippingAddressId,
        'billingAddressId': billingAddressId,
        'shippingAddress': shippingAddress?.toMap(),
        'billingAddress': billingAddress?.toMap(),
      };

  String toJson() => json.encode(toMap());

  @override
  String toString() =>
      'OrderModel(orderId: $orderId, shipmentId: $shipmentId, razorpay: $razorpay, userId: $userId, user: $user, subcategory: $subcategory, totalAmount: $totalAmount, orderDate: $orderDate, status: $status, items: $items, shipmentAddressId: $shippingAddressId, billingAddressId: $billingAddressId, shippingAddress: $shippingAddress, billingAddress: $billingAddress)';

  @override
  bool operator ==(covariant OrderModel other) {
    if (identical(this, other)) return true;

    return other.orderId == orderId && other.status == status && other.razorpay == razorpay;
  }

  @override
  int get hashCode => orderId.hashCode;
}
