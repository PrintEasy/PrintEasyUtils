import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:printeasy_utils/printeasy_utils.dart';

class ProductModel {
  ProductModel({
    required this.id,
    required this.categoryId,
    required this.subcategoryId,
    required this.productImages,
    required this.canvasImage,
    required this.illustrationImage,
    required this.isCustomizable,
    required this.name,
    required this.description,
    required this.care,
    required this.sku,
    required this.slug,
    required this.tags,
    required this.dimension,
    required this.configuration,
    required this.illustrationOption,
    required this.presetText,
    required this.basePrice,
    required this.discountedPrice,
    this.isInWishlist = false,
    this.sizeChart = '',
  });

  factory ProductModel.fromMap(Map<String, dynamic> map) => ProductModel(
        id: map['id'] as String,
        categoryId: map['categoryId'] as String,
        subcategoryId: map['subcategoryId'] as String,
        productImages: (map['productImages'] as List? ?? []).cast<String>(),
        canvasImage: map['canvasImage'] as String,
        illustrationImage: map['illustrationImage'] as String,
        isCustomizable: map['isCustomizable'] as bool,
        name: map['name'] as String,
        description: map['description'] as String,
        care: map['care'] as String,
        sku: map['sku'] as String,
        slug: map['slug'] as String,
        tags: (map['tags'] as List? ?? []).cast<String>(),
        dimension: DimensionModel.fromMap(map['dimension'] as Map<String, dynamic>),
        configuration: List<OptionsModel>.from(
          (map['configuration'] as List? ?? []).map<OptionsModel>(
            (x) => OptionsModel.fromMap(x as Map<String, dynamic>),
          ),
        ),
        illustrationOption: CustomizationOption.fromName(map['illustrationOption'] as String? ?? ''),
        presetText: map['presetText'] as String? ?? '',
        basePrice: map['basePrice'] as double,
        discountedPrice: map['discountedPrice'] as double,
        isInWishlist: map['isInWishlist'] as bool? ?? false,
        sizeChart: map['sizeChart'] as String? ?? '',
      );

  factory ProductModel.fromJson(String source) => ProductModel.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  final String id;
  final String categoryId;
  final String subcategoryId;
  final List<String> productImages;
  final String canvasImage;
  final String illustrationImage;
  final bool isCustomizable;
  final String name;
  final String description;
  final String care;
  final String sku;
  final String slug;
  final List<String> tags;
  final DimensionModel dimension;
  final List<OptionsModel> configuration;
  final CustomizationOption illustrationOption;
  final String presetText;
  final double basePrice;
  final double discountedPrice;
  final bool isInWishlist;
  final String sizeChart;

  double get totalPrice => discountedPrice > 0 ? discountedPrice : basePrice;

  ProductModel copyWith({
    String? id,
    String? categoryId,
    String? subcategoryId,
    List<String>? productImages,
    String? canvasImage,
    String? illustrationImage,
    bool? isCustomizable,
    String? name,
    String? description,
    String? care,
    String? sku,
    String? slug,
    List<String>? tags,
    DimensionModel? dimension,
    List<OptionsModel>? configuration,
    CustomizationOption? illustrationOption,
    String? presetText,
    double? basePrice,
    double? discountedPrice,
    String? sizeChart,
  }) =>
      ProductModel(
        id: id ?? this.id,
        categoryId: categoryId ?? this.categoryId,
        subcategoryId: subcategoryId ?? this.subcategoryId,
        productImages: productImages ?? this.productImages,
        canvasImage: canvasImage ?? this.canvasImage,
        illustrationImage: illustrationImage ?? this.illustrationImage,
        isCustomizable: isCustomizable ?? this.isCustomizable,
        name: name ?? this.name,
        description: description ?? this.description,
        care: care ?? this.care,
        sku: sku ?? this.sku,
        slug: slug ?? this.slug,
        tags: tags ?? this.tags,
        dimension: dimension ?? this.dimension,
        configuration: configuration ?? this.configuration,
        illustrationOption: illustrationOption ?? this.illustrationOption,
        presetText: presetText ?? this.presetText,
        basePrice: basePrice ?? this.basePrice,
        discountedPrice: discountedPrice ?? this.discountedPrice,
        sizeChart: sizeChart ?? this.sizeChart,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'categoryId': categoryId,
        'subcategoryId': subcategoryId,
        'productImages': productImages,
        'canvasImage': canvasImage,
        'illustrationImage': illustrationImage,
        'isCustomizable': isCustomizable,
        'name': name,
        'description': description,
        'care': care,
        'sku': sku,
        'slug': slug,
        'tags': tags,
        'dimension': dimension.toMap(),
        'configuration': configuration.map((x) => x.toMap()).toList(),
        'illustrationOptions': illustrationOption.name,
        'presetText': presetText,
        'basePrice': basePrice,
        'discountedPrice': discountedPrice,
        'sizeChart': sizeChart,
      };

  String toJson() => json.encode(toMap());

  @override
  String toString() =>
      'ProductModel(id: $id, categoryId: $categoryId, subcategoryId: $subcategoryId, productImages: $productImages, canvasImage: $canvasImage, illustrationImage: $illustrationImage, isCustomizable: $isCustomizable, name: $name, description: $description, care: $care, sku: $sku, slug: $slug, tags: $tags, dimension: $dimension, configuration: $configuration, illustrationOptions: $illustrationOption, presetText: $presetText, basePrice: $basePrice, discountedPrice: $discountedPrice, isInWishlist: $isInWishlist, sizeChart: $sizeChart)';

  @override
  bool operator ==(covariant ProductModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.categoryId == categoryId &&
        other.subcategoryId == subcategoryId &&
        listEquals(other.productImages, productImages) &&
        other.canvasImage == canvasImage &&
        other.illustrationImage == illustrationImage &&
        other.isCustomizable == isCustomizable &&
        other.name == name &&
        other.description == description &&
        other.care == care &&
        other.sku == sku &&
        other.slug == slug &&
        listEquals(other.tags, tags) &&
        other.dimension == dimension &&
        listEquals(other.configuration, configuration) &&
        other.illustrationOption == illustrationOption &&
        other.presetText == presetText &&
        other.basePrice == basePrice &&
        other.discountedPrice == discountedPrice &&
        other.sizeChart == sizeChart;
  }

  @override
  int get hashCode =>
      id.hashCode ^
      categoryId.hashCode ^
      subcategoryId.hashCode ^
      productImages.hashCode ^
      canvasImage.hashCode ^
      illustrationImage.hashCode ^
      isCustomizable.hashCode ^
      name.hashCode ^
      description.hashCode ^
      care.hashCode ^
      sku.hashCode ^
      slug.hashCode ^
      tags.hashCode ^
      dimension.hashCode ^
      configuration.hashCode ^
      illustrationOption.hashCode ^
      presetText.hashCode ^
      basePrice.hashCode ^
      discountedPrice.hashCode ^
      sizeChart.hashCode;
}
