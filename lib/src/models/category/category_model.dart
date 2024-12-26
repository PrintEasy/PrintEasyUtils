import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:printeasy_utils/printeasy_utils.dart';

class CategoryModel {
  const CategoryModel({
    this.id = '',
    this.name = '',
    this.subCategories = const [],
    this.configurations = const [],
  });

  factory CategoryModel.fromMap(Map<String, dynamic> map) => CategoryModel(
        id: map['id'] as String? ?? '',
        name: map['name'] as String? ?? '',
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
      );

  factory CategoryModel.fromJson(
    String source,
  ) =>
      CategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  final String id;
  final String name;
  final List<SubcategoryModel> subCategories;
  final List<OptionsModel> configurations;

  CategoryModel copyWith({
    String? id,
    String? name,
    List<SubcategoryModel>? subCategories,
    List<OptionsModel>? configurations,
  }) =>
      CategoryModel(
        id: id ?? this.id,
        name: name ?? this.name,
        subCategories: subCategories ?? this.subCategories,
        configurations: configurations ?? this.configurations,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'name': name,
        'subCategories': subCategories.map((x) => x.toMap()).toList(),
        'configurations': configurations.map((x) => x.toMap()).toList(),
      };

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'CategoryModel(id: $id, name: $name, subCategories: $subCategories, configurations: $configurations)';

  @override
  bool operator ==(covariant CategoryModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && listEquals(other.subCategories, subCategories) && listEquals(other.configurations, configurations);
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ subCategories.hashCode ^ configurations.hashCode;
}
