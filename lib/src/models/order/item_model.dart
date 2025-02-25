import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:printeasy_utils/printeasy_utils.dart';

class ItemModel {
  const ItemModel({
    required this.productId,
    required this.bookType,
    this.name = '',
    required this.size,
    this.dimensions = const DimensionModel(),
    required this.pageCount,
    required this.quantity,
    required this.price,
    required this.sku,
    this.imageUrl = '',
    this.productImageUrl = '',
    this.options = const [],
  });

  factory ItemModel.fromMap(Map<String, dynamic> map) => ItemModel(
        productId: map['productId'] as String? ?? '',
        bookType: map['bookType'] != null ? BookType.fromName(map['bookType'] as String) : null,
        name: map['name'] as String? ?? '',
        size: map['size'] as String? ?? '',
        dimensions: DimensionModel.fromMap(
          map['dimensions'] as Map<String, dynamic>? ?? {},
        ),
        pageCount: map['pageCount'] as int? ?? 0,
        quantity: map['quantity'] as int? ?? map['bundle'] as int? ?? 0,
        sku: map['sku'] as String? ?? '',
        imageUrl: map['imageUrl'] as String? ?? map['customImageUrl'] as String? ?? '',
        productImageUrl: map['productImageUrl'] as String? ?? '',
        price: map['price'] as double? ?? 0,
        options: (map['options'] as List? ?? [])
            .map<OptionsModel>(
              (x) => OptionsModel.fromMap(x as Map<String, dynamic>? ?? {}),
            )
            .toList(),
      );

  factory ItemModel.fromJson(String source) => ItemModel.fromMap(json.decode(source) as Map<String, dynamic>);

  final String productId;
  final BookType? bookType;
  final String name;
  final String size;
  final DimensionModel dimensions;
  final int pageCount;
  final int quantity;
  final String sku;
  final String imageUrl;
  final String productImageUrl;
  final double price;
  final List<OptionsModel> options;

  double get singleItemPrice => price / quantity;

  String get label => name.trim().isEmpty ? [size, bookType?.label ?? ''].join(' ').trim() : name.trim();

  ItemModel copyWith({
    String? productId,
    BookType? bookType,
    String? name,
    String? size,
    DimensionModel? dimensions,
    int? pageCount,
    int? quantity,
    String? sku,
    String? imageUrl,
    String? productImageUrl,
    double? price,
    List<OptionsModel>? options,
  }) =>
      ItemModel(
        productId: productId ?? this.productId,
        bookType: bookType ?? this.bookType,
        name: name ?? this.name,
        size: size ?? this.size,
        dimensions: dimensions ?? this.dimensions,
        pageCount: pageCount ?? this.pageCount,
        quantity: quantity ?? this.quantity,
        sku: sku ?? this.sku,
        imageUrl: imageUrl ?? this.imageUrl,
        price: price ?? this.price,
        productImageUrl: productImageUrl ?? this.productImageUrl,
        options: options ?? this.options,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'productId': productId,
        'bookType': bookType?.name,
        'name': name,
        'size': size,
        'dimensions': dimensions.toMap(),
        'pageCount': pageCount,
        'quantity': quantity,
        'sku': sku,
        'imageUrl': imageUrl,
        'productImageUrl': productImageUrl,
        'price': price,
        'options': options.map((x) => x.toMap()).toList(),
      };

  String toJson() => json.encode(toMap());

  @override
  String toString() =>
      'ItemModel(productId: $productId, bookType: $bookType, name: $name, size: $size, dimensions: $dimensions, pageCount: $pageCount, quantity: $quantity, sku: $sku, imageUrl: $imageUrl, productImageUrl: $productImageUrl, price: $price, options: $options)';

  @override
  bool operator ==(covariant ItemModel other) {
    if (identical(this, other)) return true;

    return other.productId == productId &&
        other.bookType == bookType &&
        other.name == name &&
        other.size == size &&
        other.dimensions == dimensions &&
        other.pageCount == pageCount &&
        other.quantity == quantity &&
        other.sku == sku &&
        other.imageUrl == imageUrl &&
        other.productImageUrl == productImageUrl &&
        other.price == price &&
        listEquals(other.options, options);
  }

  @override
  int get hashCode =>
      productId.hashCode ^
      bookType.hashCode ^
      name.hashCode ^
      size.hashCode ^
      dimensions.hashCode ^
      pageCount.hashCode ^
      quantity.hashCode ^
      sku.hashCode ^
      imageUrl.hashCode ^
      productImageUrl.hashCode ^
      price.hashCode ^
      options.hashCode;
}
