import 'dart:convert';

import 'package:flutter/foundation.dart';

class SubcategoryModel {
  SubcategoryModel({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.value,
    required this.fields,
  });

  factory SubcategoryModel.fromMap(Map<String, dynamic> map) => SubcategoryModel(
        id: map['id'] as String? ?? '',
        categoryId: map['categoryId'] as String? ?? '',
        name: map['name'] as String? ?? '',
        value: map['value'] as String? ?? '',
        fields: (map['fields'] as List? ?? []).cast<String>(),
      );

  factory SubcategoryModel.fromJson(String source) => SubcategoryModel.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  final String id;
  final String categoryId;
  final String name;
  final String value;
  final List<String> fields;

  SubcategoryModel copyWith({
    String? id,
    String? categoryId,
    String? name,
    String? value,
    List<String>? fields,
  }) =>
      SubcategoryModel(
        id: id ?? this.id,
        categoryId: categoryId ?? this.categoryId,
        name: name ?? this.name,
        value: value ?? this.value,
        fields: fields ?? this.fields,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'categoryId': categoryId,
        'name': name,
        'value': value,
        'fields': fields,
      };

  Map<String, dynamic> toAPIMap() => <String, dynamic>{
        'categoryId': categoryId,
        'name': name,
        'value': value,
        'fields': fields,
      };

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'SubcategoryModel(id: $id, categoryId: $categoryId, name: $name, value: $value, fields: $fields)';

  @override
  bool operator ==(covariant SubcategoryModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.categoryId == categoryId && other.name == name && other.value == value && listEquals(other.fields, fields);
  }

  @override
  int get hashCode => id.hashCode ^ categoryId.hashCode ^ name.hashCode ^ value.hashCode ^ fields.hashCode;
}
