import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:printeasy_utils/printeasy_utils.dart';

class CategoryModel {
  const CategoryModel({
    this.id = '',
    this.name = '',
    this.value = '',
    this.subCategories = const [],
    this.configurations = const [],
    this.illustrations = const [],
    this.banners = const [],
  });

  factory CategoryModel.fromMap(Map<String, dynamic> map) => CategoryModel(
        id: map['id'] as String? ?? '',
        name: map['name'] as String? ?? '',
        value: map['value'] as String? ?? '',
        subCategories: List<SubcategoryModel>.from(
          (map['subCategories'] as List? ?? []).map<SubcategoryModel>(
            (x) => SubcategoryModel.fromMap(x as Map<String, dynamic>),
          ),
        ),
        configurations: List<OptionsModel>.from(
          (map['configurations'] as List? ?? []).map<OptionsModel>(
            (x) => OptionsModel.fromMap(x as Map<String, dynamic>),
          ),
        ),
        illustrations: List<IllustrationModel>.from(
          (map['illustrations'] as List? ?? []).map<IllustrationModel>(
            (x) => IllustrationModel.fromMap(x as Map<String, dynamic>),
          ),
        ),
        banners: List<BannerModel>.from(
          (map['banners'] as List? ?? []).map<BannerModel>(
            (x) => BannerModel.fromMap(x as Map<String, dynamic>),
          ),
        ),
      );

  factory CategoryModel.fromJson(
    String source,
  ) =>
      CategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  final String id;
  final String name;
  final String value;
  final List<SubcategoryModel> subCategories;
  final List<OptionsModel> configurations;
  final List<IllustrationModel> illustrations;
  final List<BannerModel> banners;

  CategoryModel copyWith({
    String? id,
    String? name,
    String? value,
    List<SubcategoryModel>? subCategories,
    List<OptionsModel>? configurations,
    List<IllustrationModel>? illustrations,
    List<BannerModel>? banners,
  }) =>
      CategoryModel(
        id: id ?? this.id,
        name: name ?? this.name,
        value: value ?? this.value,
        subCategories: subCategories ?? this.subCategories,
        configurations: configurations ?? this.configurations,
        illustrations: illustrations ?? this.illustrations,
        banners: banners ?? this.banners,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'name': name,
        'value': value,
        'subCategories': subCategories.map((x) => x.toMap()).toList(),
        'configurations': configurations.map((x) => x.toMap()).toList(),
        'illustrations': illustrations.map((x) => x.toMap()).toList(),
        'banners': banners.map((x) => x.toMap()).toList(),
      };

  String toJson() => json.encode(toMap());

  @override
  String toString() =>
      'CategoryModel(id: $id, name: $name, value: $value, subCategories: $subCategories, configurations: $configurations, illustrations: $illustrations)';

  @override
  bool operator ==(covariant CategoryModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.value == value &&
        listEquals(other.subCategories, subCategories) &&
        listEquals(other.configurations, configurations) &&
        listEquals(other.illustrations, illustrations) &&
        listEquals(other.banners, banners);
  }

  @override
  int get hashCode =>
      id.hashCode ^ name.hashCode ^ value.hashCode ^ subCategories.hashCode ^ configurations.hashCode ^ illustrations.hashCode ^ banners.hashCode;
}
