import 'dart:convert';

import 'package:printeasy_utils/printeasy_utils.dart';

class OrderModel {
  OrderModel({
    this.orderId,
    this.shipmentId,
    this.razorpay,
    this.shiprocket,
    this.bookType,
    this.categoryId = '',
    this.subcategoryId = '',
    this.userId,
    this.user,
    this.totalAmount = 0,
    this.orderDate,
    this.status = OrderStatus.paymentPending,
    this.items = const [],
    this.shippingAddressId,
    this.billingAddressId,
    this.shippingAddress,
    this.billingAddress,
    this.couponCode = '',
    this.franchiseId = '',
  });

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    var model = OrderModel(
      orderId: map['orderId'] as String?,
      shipmentId: map['shipmentId'] as String?,
      razorpay: map['razorpay'] != null ? RazorpayPaymentModel.fromMap(map['razorpay']) : null,
      shiprocket: map['shiprocket'] != null ? ShiprocketModel.fromMap(map['shiprocket'] as Map<String, dynamic>) : null,
      bookType: map['bookType'] != null ? BookType.fromName(map['bookType'] as String) : null,
      categoryId: map['categoryId'] as String? ?? '',
      subcategoryId: map['subcategoryId'] as String? ?? '',
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
      couponCode: map['couponCode'] as String? ?? '',
      franchiseId: map['franchiseId'] as String? ?? '',
    );

    model = model.copyWith(
      bookType: model.items.first.bookType,
    );

    return model;
  }

  factory OrderModel.fromJson(String source) => OrderModel.fromMap(json.decode(source) as Map<String, dynamic>);

  final String? orderId;
  final String? shipmentId;
  final BookType? bookType;
  final String categoryId;
  final String subcategoryId;
  final RazorpayPaymentModel? razorpay;
  final ShiprocketModel? shiprocket;
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
  final String couponCode;
  final String franchiseId;

  String get mobile => user?.phone ?? '';

  OrderModel copyWith({
    String? orderId,
    String? shipmentId,
    RazorpayPaymentModel? razorpay,
    ShiprocketModel? shiprocket,
    BookType? bookType,
    String? categoryId,
    String? subcategoryId,
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
    String? couponCode,
    String? franchiseId,
  }) =>
      OrderModel(
        orderId: orderId ?? this.orderId,
        shipmentId: shipmentId ?? this.shipmentId,
        razorpay: razorpay ?? this.razorpay,
        shiprocket: shiprocket ?? this.shiprocket,
        bookType: bookType ?? this.bookType,
        categoryId: categoryId ?? this.categoryId,
        subcategoryId: subcategoryId ?? this.subcategoryId,
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
        couponCode: couponCode ?? this.couponCode,
        franchiseId: franchiseId ?? this.franchiseId,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'orderId': orderId,
        'shipmentId': shipmentId,
        'razorpay': razorpay?.toMap(),
        'shiprocket': shiprocket?.toMap(),
        'bookType': bookType?.name,
        'categoryId': categoryId,
        'subcategoryId': subcategoryId,
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
        'couponCode': couponCode,
        'franchiseId': franchiseId,
      };

  String toJson() => json.encode(toMap());

  @override
  String toString() =>
      'OrderModel(orderId: $orderId, shipmentId: $shipmentId, razorpay: $razorpay, shiprocket: $shiprocket, userId: $userId, user: $user, bookType: $bookType, categoryId: $categoryId, subcategoryId: $subcategoryId, totalAmount: $totalAmount, orderDate: $orderDate, status: $status, items: $items, shipmentAddressId: $shippingAddressId, billingAddressId: $billingAddressId, shippingAddress: $shippingAddress, billingAddress: $billingAddress, couponCode: $couponCode, franchiseId: $franchiseId)';

  @override
  bool operator ==(covariant OrderModel other) {
    if (identical(this, other)) return true;

    return other.orderId == orderId && other.status == status && other.razorpay == razorpay;
  }

  @override
  int get hashCode => orderId.hashCode;
}
