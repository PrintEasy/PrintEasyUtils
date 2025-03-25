import 'dart:convert';

import 'package:flutter/foundation.dart';

class CollectionModel {
  const CollectionModel({
    this.id = '',
    this.categoryId = '',
    this.name = '',
    this.description = '',
    this.image = '',
    this.slug = '',
    this.products = const [],
  });

  factory CollectionModel.fromMap(Map<String, dynamic> map) => CollectionModel(
        id: map['id'] as String? ?? '',
        categoryId: map['categoryId'] as String? ?? '',
        name: map['name'] as String? ?? '',
        description: map['description'] as String? ?? '',
        image: map['image'] as String? ?? '',
        slug: map['slug'] as String? ?? '',
        products: (map['products'] as List? ?? []).cast<String>(),
      );

  factory CollectionModel.fromJson(
    String source,
  ) =>
      CollectionModel.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  final String id;
  final String categoryId;
  final String name;
  final String description;
  final String image;
  final String slug;
  final List<String> products;

  CollectionModel copyWith({
    String? id,
    String? categoryId,
    String? name,
    String? description,
    String? image,
    String? slug,
    List<String>? products,
  }) =>
      CollectionModel(
        id: id ?? this.id,
        categoryId: categoryId ?? this.categoryId,
        name: name ?? this.name,
        description: description ?? this.description,
        image: image ?? this.image,
        slug: slug ?? this.slug,
        products: products ?? this.products,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'categoryId': categoryId,
        'name': name,
        'description': description,
        'image': image,
        'slug': slug,
        'products': products,
      };

  String toJson() => json.encode(toMap());

  @override
  String toString() =>
      'CollectionModel(id: $id, categoryId: $categoryId, name: $name, description: $description, image: $image, slug: $slug, products: $products)';

  @override
  bool operator ==(covariant CollectionModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.categoryId == categoryId &&
        other.name == name &&
        other.description == description &&
        other.image == image &&
        other.slug == slug &&
        listEquals(other.products, products);
  }

  @override
  int get hashCode => id.hashCode ^ categoryId.hashCode ^ name.hashCode ^ description.hashCode ^ image.hashCode ^ slug.hashCode ^ products.hashCode;
}
