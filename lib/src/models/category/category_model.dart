import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:printeasy_utils/printeasy_utils.dart';

class CategoryModel {
  const CategoryModel({
    this.id = '',
    this.name = '',
    this.subcategories = const [],
  });

  factory CategoryModel.fromMap(Map<String, dynamic> map) => CategoryModel(
        id: map['id'] as String? ?? '',
        name: map['name'] as String? ?? '',
        subcategories: List<SubcategoryModel>.from(
          (map['subcategories'] as List? ?? []).map<SubcategoryModel>(
            (x) => SubcategoryModel.fromMap(x as Map<String, dynamic>),
          ),
        ),
      );

  factory CategoryModel.fromJson(
    String source,
  ) =>
      CategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  final String id;
  final String name;

  final List<SubcategoryModel> subcategories;

  CategoryModel copyWith({
    String? id,
    String? name,
    List<SubcategoryModel>? subcategories,
  }) =>
      CategoryModel(
        id: id ?? this.id,
        name: name ?? this.name,
        subcategories: subcategories ?? this.subcategories,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'name': name,
        'subcategories': subcategories.map((x) => x.toMap()).toList(),
      };

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'CategoryModel(id: $id, name: $name, subcategories: $subcategories)';

  @override
  bool operator ==(covariant CategoryModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && listEquals(other.subcategories, subcategories);
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ subcategories.hashCode;
}
