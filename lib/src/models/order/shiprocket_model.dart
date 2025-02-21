import 'dart:convert';

class ShiprocketModel {
  ShiprocketModel({
    required this.orderId,
    required this.orderNumber,
    required this.shipmentId,
  });

  factory ShiprocketModel.fromMap(Map<String, dynamic> map) => ShiprocketModel(
        orderId: map['orderId'] as String,
        orderNumber: map['orderNumber'] as String,
        shipmentId: map['shipmentId'] as String,
      );

  factory ShiprocketModel.fromJson(
    String source,
  ) =>
      ShiprocketModel.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  final String orderId;
  final String orderNumber;
  final String shipmentId;

  ShiprocketModel copyWith({
    String? orderId,
    String? orderNumber,
    String? shipmentId,
  }) =>
      ShiprocketModel(
        orderId: orderId ?? this.orderId,
        orderNumber: orderNumber ?? this.orderNumber,
        shipmentId: shipmentId ?? this.shipmentId,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'orderId': orderId,
        'orderNumber': orderNumber,
        'shipmentId': shipmentId,
      };

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'ShiprocketModel(orderId: $orderId, orderNumber: $orderNumber, shipmentId: $shipmentId)';

  @override
  bool operator ==(covariant ShiprocketModel other) {
    if (identical(this, other)) return true;

    return other.orderId == orderId && other.orderNumber == orderNumber && other.shipmentId == shipmentId;
  }

  @override
  int get hashCode => orderId.hashCode ^ orderNumber.hashCode ^ shipmentId.hashCode;
}
