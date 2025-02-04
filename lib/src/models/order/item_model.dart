import 'dart:convert';

import 'package:printeasy_utils/printeasy_utils.dart';

class ItemModel {
  const ItemModel({
    required this.subcategory,
    required this.size,
    this.dimensions = const DimensionModel(),
    required this.pageCount,
    required this.bundle,
    required this.price,
    required this.sku,
    this.imageUrl = '',
  });

  factory ItemModel.fromMap(Map<String, dynamic> map) => ItemModel(
        subcategory: BookType.fromName(map['subcategory'] as String? ?? ''),
        size: map['size'] as String? ?? '',
        dimensions: DimensionModel.fromMap(
          map['dimensions'] as Map<String, dynamic>? ?? {},
        ),
        pageCount: map['pageCount'] as int? ?? 0,
        bundle: map['bundle'] as int? ?? 0,
        sku: map['sku'] as String? ?? '',
        imageUrl: map['imageUrl'] as String? ?? map['productImageUrl'] as String? ?? map['customImageUrl'] as String? ?? '',
        price: map['price'] as double? ?? 0,
      );

  factory ItemModel.fromJson(String source) => ItemModel.fromMap(json.decode(source) as Map<String, dynamic>);

  final BookType subcategory;
  final String size;
  final DimensionModel dimensions;
  final int pageCount;
  final int bundle;
  final String sku;
  final String imageUrl;
  final double price;

  double get singleItemPrice => price / bundle;

  String get name => [size, subcategory.label].join(' ').trim();

  ItemModel copyWith({
    BookType? subcategory,
    String? size,
    DimensionModel? dimensions,
    int? pageCount,
    int? bundle,
    String? sku,
    String? imageUrl,
    double? price,
  }) =>
      ItemModel(
        subcategory: subcategory ?? this.subcategory,
        size: size ?? this.size,
        dimensions: dimensions ?? this.dimensions,
        pageCount: pageCount ?? this.pageCount,
        bundle: bundle ?? this.bundle,
        sku: sku ?? this.sku,
        imageUrl: imageUrl ?? this.imageUrl,
        price: price ?? this.price,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'subcategory': subcategory.name,
        'size': size,
        'dimensions': dimensions.toMap(),
        'pageCount': pageCount,
        'bundle': bundle,
        'sku': sku,
        'imageUrl': imageUrl,
        'price': price,
      };

  String toJson() => json.encode(toMap());

  @override
  String toString() =>
      'ItemModel(subcategory: $subcategory, size: $size, dimensions: $dimensions, pageCount: $pageCount, bundle: $bundle, sku: $sku, imageUrl: $imageUrl, price: $price)';

  @override
  bool operator ==(covariant ItemModel other) {
    if (identical(this, other)) return true;

    return other.subcategory == subcategory &&
        other.size == size &&
        other.dimensions == dimensions &&
        other.pageCount == pageCount &&
        other.bundle == bundle &&
        other.sku == sku &&
        other.imageUrl == imageUrl &&
        other.price == price;
  }

  @override
  int get hashCode =>
      subcategory.hashCode ^
      size.hashCode ^
      dimensions.hashCode ^
      pageCount.hashCode ^
      bundle.hashCode ^
      sku.hashCode ^
      imageUrl.hashCode ^
      price.hashCode;
}
