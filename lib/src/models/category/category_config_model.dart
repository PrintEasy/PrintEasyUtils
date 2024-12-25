import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:printeasy_utils/printeasy_utils.dart';

class CategoryConfigModel {
  const CategoryConfigModel({
    this.id = '',
    this.name = '',
    this.properties = const [],
  });

  factory CategoryConfigModel.fromMap(Map<String, dynamic> map) => CategoryConfigModel(
        id: map['id'] as String? ?? '',
        name: map['name'] as String? ?? '',
        properties: List<PropertyConfigModel>.from(
          (map['properties'] as List? ?? []).map<PropertyConfigModel>(
            (x) => PropertyConfigModel.fromMap(x as Map<String, dynamic>),
          ),
        ),
      );

  factory CategoryConfigModel.fromJson(
    String source,
  ) =>
      CategoryConfigModel.fromMap(json.decode(source) as Map<String, dynamic>);

  final String id;
  final String name;

  final List<PropertyConfigModel> properties;

  CategoryConfigModel copyWith({
    String? id,
    String? name,
    List<PropertyConfigModel>? properties,
  }) =>
      CategoryConfigModel(
        id: id ?? this.id,
        name: name ?? this.name,
        properties: properties ?? this.properties,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'name': name,
        'properties': properties.map((x) => x.toMap()).toList(),
      };

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'CategoryConfigModel(id: $id, name: $name, properties: $properties)';

  @override
  bool operator ==(covariant CategoryConfigModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && listEquals(other.properties, properties);
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ properties.hashCode;
}
