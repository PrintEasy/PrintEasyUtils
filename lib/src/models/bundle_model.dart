import 'dart:convert';

class BundleModel {
  BundleModel({
    this.unit = 0,
    this.shipmentPrice = 0,
  });

  factory BundleModel.fromMap(Map<String, dynamic> map) => BundleModel(
        unit: map['unit'] as int? ?? 0,
        shipmentPrice: map['shipmentPrice'] as double? ?? 0,
      );

  factory BundleModel.fromJson(String source) => BundleModel.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  final int unit;
  final double shipmentPrice;

  BundleModel copyWith({
    int? unit,
    double? shipmentPrice,
  }) =>
      BundleModel(
        unit: unit ?? this.unit,
        shipmentPrice: shipmentPrice ?? this.shipmentPrice,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'unit': unit,
        'shipmentPrice': shipmentPrice,
      };

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'BundleModel(unit: $unit, shipmentPrice: $shipmentPrice)';

  @override
  bool operator ==(covariant BundleModel other) {
    if (identical(this, other)) return true;

    return other.unit == unit && other.shipmentPrice == shipmentPrice;
  }

  @override
  int get hashCode => unit.hashCode ^ shipmentPrice.hashCode;
}
