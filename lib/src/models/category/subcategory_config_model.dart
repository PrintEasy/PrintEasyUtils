import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:printeasy_utils/printeasy_utils.dart';

class SubcategoryConfigModel {
  const SubcategoryConfigModel({
    this.id = '',
    this.categoryId = '',
    this.name = '',
    this.subtitle,
    this.sku = '',
    this.subcategory = Subcategory.notebook,
    this.properties = const [],
    this.variants = const [],
    this.catalog = const [],
  });

  factory SubcategoryConfigModel.fromMap(Map<String, dynamic> map) => SubcategoryConfigModel(
        id: map['id'] as String? ?? '',
        categoryId: map['categoryId'] as String? ?? '',
        name: map['name'] as String? ?? '',
        subtitle: map['subtitle'] as String?,
        sku: map['sku'] as String? ?? '',
        subcategory: Subcategory.fromName(map['subcategory'] as String? ?? ''),
        properties: (map['properties'] as List? ?? [])
            .map<PropertiesModel>(
              (x) => PropertiesModel.fromMap(x as Map<String, dynamic>),
            )
            .toList(),
        variants: (map['variants'] as List? ?? [])
            .map<VariantModel>(
              (x) => VariantModel.fromMap(x as Map<String, dynamic>),
            )
            .toList(),
        catalog: (map['catalog'] as List? ?? []).cast<String>(),
      );

  factory SubcategoryConfigModel.fromJson(
    String source,
  ) =>
      SubcategoryConfigModel.fromMap(json.decode(source) as Map<String, dynamic>);

  final String id;
  final String categoryId;
  final String name;
  final String? subtitle;
  final String sku;
  final Subcategory subcategory;
  final List<PropertiesModel> properties;
  final List<VariantModel> variants;
  final List<String> catalog;

  SubcategoryConfigModel copyWith({
    String? id,
    String? categoryId,
    String? name,
    String? subtitle,
    String? sku,
    Subcategory? subcategory,
    List<PropertiesModel>? properties,
    List<VariantModel>? variants,
    List<String>? catalog,
  }) =>
      SubcategoryConfigModel(
        id: id ?? this.id,
        categoryId: categoryId ?? this.categoryId,
        name: name ?? this.name,
        subtitle: subtitle ?? this.subtitle,
        sku: sku ?? this.sku,
        subcategory: subcategory ?? this.subcategory,
        properties: properties ?? this.properties,
        variants: variants ?? this.variants,
        catalog: catalog ?? this.catalog,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'categoryId': categoryId,
        'name': name,
        'subtitle': subtitle,
        'sku': sku,
        'subcategory': subcategory.name,
        'properties': properties.map((x) => x.toMap()).toList(),
        'variants': variants.map((x) => x.toMap()).toList(),
        'catalog': catalog,
      };

  String toJson() => json.encode(toMap());

  @override
  String toString() =>
      'SubcategoryConfigModel(id: $id, categoryId: $categoryId, name: $name, subtitle: $subtitle, sku: $sku, subcategory: $subcategory, properties: $properties, variants: $variants, catalog: $catalog)';

  @override
  bool operator ==(covariant SubcategoryConfigModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.categoryId == categoryId &&
        other.name == name &&
        other.subtitle == subtitle &&
        other.sku == sku &&
        other.subcategory == subcategory &&
        listEquals(other.properties, properties) &&
        listEquals(other.variants, variants) &&
        listEquals(other.catalog, catalog);
  }

  @override
  int get hashCode =>
      id.hashCode ^
      categoryId.hashCode ^
      name.hashCode ^
      subtitle.hashCode ^
      sku.hashCode ^
      subcategory.hashCode ^
      properties.hashCode ^
      variants.hashCode ^
      catalog.hashCode;
}
