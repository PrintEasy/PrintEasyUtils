import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:printeasy_utils/printeasy_utils.dart';

class VariantModel {
  const VariantModel({
    this.combination = const [],
    this.price = 0,
    this.totalPrice = 0,
    this.shipmentPrice = 0,
    this.dimensions = const DimensionModel(),
  });

  factory VariantModel.fromMap(Map<String, dynamic> map) => VariantModel(
        combination: List<CombinationModel>.from(
          (map['combination'] as List? ?? []).map<CombinationModel>(
            (x) => CombinationModel.fromMap(x as Map<String, dynamic>),
          ),
        ),
        price: map['price'] as double? ?? 0,
        totalPrice: map['totalPrice'] as double? ?? 0,
        shipmentPrice: map['shipmentPrice'] as double? ?? 0,
        dimensions: DimensionModel.fromMap(
          map['dimensions'] as Map<String, dynamic>? ?? {},
        ),
      );

  factory VariantModel.fromJson(
    String source,
  ) =>
      VariantModel.fromMap(json.decode(source) as Map<String, dynamic>);

  final List<CombinationModel> combination;
  final double price;
  final double totalPrice;
  final double shipmentPrice;
  final DimensionModel dimensions;

  VariantModel copyWith({
    List<CombinationModel>? combination,
    double? price,
    double? totalPrice,
    double? shipmentPrice,
    DimensionModel? dimensions,
  }) =>
      VariantModel(
        combination: combination ?? this.combination,
        price: price ?? this.price,
        totalPrice: totalPrice ?? this.totalPrice,
        shipmentPrice: shipmentPrice ?? this.shipmentPrice,
        dimensions: dimensions ?? this.dimensions,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'combination': combination.map((x) => x.toMap()).toList(),
        'price': price,
        'totalPrice': totalPrice,
        'shipmentPrice': shipmentPrice,
        'dimensions': dimensions.toMap(),
      };

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'VariantModel(combination: $combination, price: $price, totalPrice: $totalPrice, shipmentPrice: $shipmentPrice, dimensions)';

  @override
  bool operator ==(covariant VariantModel other) {
    if (identical(this, other)) return true;

    return listEquals(other.combination, combination) &&
        other.price == price &&
        other.totalPrice == totalPrice &&
        other.shipmentPrice == shipmentPrice &&
        other.dimensions == dimensions;
  }

  @override
  int get hashCode => combination.hashCode ^ price.hashCode ^ totalPrice.hashCode ^ shipmentPrice.hashCode ^ dimensions.hashCode;
}
