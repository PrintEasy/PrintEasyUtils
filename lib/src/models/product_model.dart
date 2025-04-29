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
    required this.subtitle,
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
    this.illustrationSize = IllustrationSize.large,
    this.fontFamily = PrintEasyFonts.beachBikini,
    this.fontColor = PrintEasyColors.white,
    this.fontSize = 30,
    this.isActive = true,
    this.isFeatured = false,
    this.isNewArrival = false,
    this.isBestSeller = false,
    this.isTopChoice = false,
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
        subtitle: map['subtitle'] as String? ?? '',
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
        illustrationOption: CustomizationOption.fromName(
          map['illustrationOption'] as String? ?? CustomizationOption.withIllustration.name,
        ),
        presetText: map['presetText'] as String? ?? '',
        basePrice: map['basePrice'] as double,
        discountedPrice: map['discountedPrice'] as double,
        isInWishlist: map['isInWishlist'] as bool? ?? false,
        sizeChart: map['sizeChart'] as String? ?? '',
        illustrationSize: IllustrationSize.fromName(
          map['illustrationSize'] as String? ?? IllustrationSize.large.name,
        ),
        fontFamily: PrintEasyFonts.fromName(map['fontFamily'] as String? ?? ''),
        fontColor: PrintEasyColors.fromName(map['fontColor'] as String? ?? ''),
        fontSize: map['fontSize'] as double? ?? 30,
        isActive: map['isActive'] as bool? ?? true,
        isFeatured: map['isFeatured'] as bool? ?? false,
        isNewArrival: map['isNewArrival'] as bool? ?? false,
        isBestSeller: map['isBestSeller'] as bool? ?? false,
        isTopChoice: map['isTopChoice'] as bool? ?? false,
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
  final String subtitle;
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
  final IllustrationSize illustrationSize;
  final PrintEasyFonts fontFamily;
  final PrintEasyColors fontColor;
  final double fontSize;
  final bool isActive;
  final bool isFeatured;
  final bool isNewArrival;
  final bool isBestSeller;
  final bool isTopChoice;

  double get totalPrice => discountedPrice > 0 ? discountedPrice : basePrice;

  String get identifier => slug.isEmpty ? id : slug.trim();

  ProductModel copyWith({
    String? id,
    String? categoryId,
    String? subcategoryId,
    List<String>? productImages,
    String? canvasImage,
    String? illustrationImage,
    bool? isCustomizable,
    String? name,
    String? subtitle,
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
    IllustrationSize? illustrationSize,
    PrintEasyFonts? fontFamily,
    PrintEasyColors? fontColor,
    double? fontSize,
    bool? isActive,
    bool? isFeatured,
    bool? isNewArrival,
    bool? isBestSeller,
    bool? isTopChoice,
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
        subtitle: subtitle ?? this.subtitle,
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
        illustrationSize: illustrationSize ?? this.illustrationSize,
        fontFamily: fontFamily ?? this.fontFamily,
        fontColor: fontColor ?? this.fontColor,
        fontSize: fontSize ?? this.fontSize,
        isActive: isActive ?? this.isActive,
        isFeatured: isFeatured ?? this.isFeatured,
        isNewArrival: isNewArrival ?? this.isNewArrival,
        isBestSeller: isBestSeller ?? this.isBestSeller,
        isTopChoice: isTopChoice ?? this.isTopChoice,
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
        'subtitle': subtitle,
        'description': description,
        'care': care,
        'sku': sku,
        'slug': slug,
        'tags': tags,
        'dimension': dimension.toMap(),
        'configuration': configuration.map((x) => x.toMap()).toList(),
        'illustrationOption': illustrationOption.name,
        'presetText': presetText,
        'basePrice': basePrice,
        'discountedPrice': discountedPrice,
        'sizeChart': sizeChart,
        'illustrationSize': illustrationSize.name,
        'fontFamily': fontFamily.name,
        'fontColor': fontColor.name,
        'fontSize': fontSize,
        'isActive': isActive,
        'isFeatured': isFeatured,
        'isNewArrival': isNewArrival,
        'isBestSeller': isBestSeller,
        'isTopChoice': isTopChoice,
      };

  String toJson() => json.encode(toMap());

  @override
  String toString() =>
      'ProductModel(id: $id, categoryId: $categoryId, subcategoryId: $subcategoryId, productImages: $productImages, canvasImage: $canvasImage, illustrationImage: $illustrationImage, isCustomizable: $isCustomizable, name: $name, subtitle: $subtitle, description: $description, care: $care, sku: $sku, slug: $slug, tags: $tags, dimension: $dimension, configuration: $configuration, illustrationOption: $illustrationOption, presetText: $presetText, basePrice: $basePrice, discountedPrice: $discountedPrice, isInWishlist: $isInWishlist, sizeChart: $sizeChart, illustrationSize: $illustrationSize, fontFamily: $fontFamily, fontColor: $fontColor, fontSize: $fontSize, isActive: $isActive, isFeatured: $isFeatured, isNewArrival: $isNewArrival, isBestSeller: $isBestSeller, isTopChoice: $isTopChoice)';

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
        other.subtitle == subtitle &&
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
        other.sizeChart == sizeChart &&
        other.illustrationSize == illustrationSize &&
        other.fontFamily == fontFamily &&
        other.fontColor == fontColor &&
        other.fontSize == fontSize &&
        other.isActive == isActive &&
        other.isFeatured == isFeatured &&
        other.isNewArrival == isNewArrival &&
        other.isBestSeller == isBestSeller &&
        other.isTopChoice == isTopChoice;
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
      subtitle.hashCode ^
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
      sizeChart.hashCode ^
      illustrationSize.hashCode ^
      fontFamily.hashCode ^
      fontColor.hashCode ^
      fontSize.hashCode ^
      isActive.hashCode ^
      isFeatured.hashCode ^
      isNewArrival.hashCode ^
      isBestSeller.hashCode ^
      isTopChoice.hashCode;
}
