import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:printeasy_utils/printeasy_utils.dart';

class OrderModel {
  OrderModel({
    this.orderId,
    this.shipmentId,
    this.razorpay,
    required this.userRef,
    this.user,
    this.phone,
    required this.totalAmount,
    this.orderDate,
    this.status = OrderStatus.paymentPending,
    required this.items,
    required this.shippingAddressRef,
    required this.billingAddressRef,
    this.shippingAddress,
    this.billingAddress,
  });

  factory OrderModel.fromMap(Map<String, dynamic> map) => OrderModel(
        orderId: map['orderId'] as String?,
        shipmentId: map['shipmentId'] as String?,
        razorpay: map['razorpay'] != null ? RazorpayPaymentModel.fromMap(map['razorpay']) : null,
        userRef: (map['userRef'] as DocumentReference).withConverter<UserModel>(
          fromFirestore: (snapshot, _) => UserModel.fromMap(snapshot.data()!),
          toFirestore: (data, _) => data.toMap(),
        ),
        user: map['user'] != null ? UserModel.fromMap(map['user'] as Map<String, dynamic>) : null,
        phone: map['phone'] != null ? map['phone'] as String : null,
        totalAmount: map['totalAmount'] as double,
        orderDate: map['orderDate'] != null ? (map['orderDate'] as Timestamp).toDate() : null,
        status: OrderStatus.fromName(map['status'] as String? ?? ''),
        items: (map['items'] as List? ?? [])
            .map<ItemModel>(
              (x) => ItemModel.fromMap(x as Map<String, dynamic>),
            )
            .toList(),
        shippingAddressRef: (map['shippingAddressRef'] as DocumentReference).withConverter<AddressModel>(
          fromFirestore: (snapshot, _) => AddressModel.fromMap(snapshot.data()!),
          toFirestore: (data, _) => data.toMap(),
        ),
        billingAddressRef: (map['billingAddressRef'] as DocumentReference).withConverter<AddressModel>(
          fromFirestore: (snapshot, _) => AddressModel.fromMap(snapshot.data()!),
          toFirestore: (data, _) => data.toMap(),
        ),
        shippingAddress: map['shippingAddress'] != null ? AddressModel.fromMap(map['shippingAddress'] as Map<String, dynamic>) : null,
        billingAddress: map['billingAddress'] != null ? AddressModel.fromMap(map['shippingAddress'] as Map<String, dynamic>) : null,
      );

  factory OrderModel.fromJson(String source) => OrderModel.fromMap(json.decode(source) as Map<String, dynamic>);

  final String? orderId;
  final String? shipmentId;
  final RazorpayPaymentModel? razorpay;
  final DocumentReference<UserModel> userRef;
  final UserModel? user;
  final String? phone;
  final double totalAmount;
  final DateTime? orderDate;
  final OrderStatus status;
  final List<ItemModel> items;
  final DocumentReference<AddressModel> shippingAddressRef;
  final AddressModel? shippingAddress;
  final DocumentReference<AddressModel> billingAddressRef;
  final AddressModel? billingAddress;

  String get mobile => phone ?? user?.phone ?? '';

  OrderModel copyWith({
    String? orderId,
    String? shipmentId,
    RazorpayPaymentModel? razorpay,
    DocumentReference<UserModel>? userRef,
    UserModel? user,
    String? phone,
    double? totalAmount,
    DateTime? orderDate,
    OrderStatus? status,
    List<ItemModel>? items,
    DocumentReference<AddressModel>? shippingAddressRef,
    DocumentReference<AddressModel>? billingAddressRef,
    AddressModel? shippingAddress,
    AddressModel? billingAddress,
  }) =>
      OrderModel(
        orderId: orderId ?? this.orderId,
        shipmentId: shipmentId ?? this.shipmentId,
        razorpay: razorpay ?? this.razorpay,
        userRef: userRef ?? this.userRef,
        user: user ?? this.user,
        phone: phone ?? this.phone,
        totalAmount: totalAmount ?? this.totalAmount,
        orderDate: orderDate ?? this.orderDate,
        status: status ?? this.status,
        items: items ?? this.items,
        shippingAddressRef: shippingAddressRef ?? this.shippingAddressRef,
        billingAddressRef: billingAddressRef ?? this.billingAddressRef,
        shippingAddress: shippingAddress ?? this.shippingAddress,
        billingAddress: billingAddress ?? this.billingAddress,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'orderId': orderId,
        'shipmentId': shipmentId,
        'razorpay': razorpay?.toMap(),
        'userRef': userRef,
        'user': user?.toMap(),
        'phone': phone,
        'totalAmount': totalAmount,
        'orderDate': orderDate != null ? Timestamp.fromDate(orderDate!) : FieldValue.serverTimestamp(),
        'status': status.name,
        'items': items.map((x) => x.toMap()).toList(),
        'shippingAddressRef': shippingAddressRef,
        'billingAddressRef': billingAddressRef,
        'shippingAddress': shippingAddress?.toMap(),
        'billingAddress': billingAddress?.toMap(),
      };

  String toJson() => json.encode(toMap());

  @override
  String toString() =>
      'OrderModel(orderId: $orderId, shipmentId: $shipmentId, razorpay: $razorpay, userRef: $userRef, user: $user, phone: $phone, totalAmount: $totalAmount, orderDate: $orderDate, status: $status, items: $items, shippingAddressRef: $shippingAddressRef, billingAddressRef: $billingAddressRef, shippingAddress: $shippingAddress, billingAddress: $billingAddress)';

  @override
  bool operator ==(covariant OrderModel other) {
    if (identical(this, other)) return true;

    return other.orderId == orderId;
  }

  @override
  int get hashCode => orderId.hashCode;
}
