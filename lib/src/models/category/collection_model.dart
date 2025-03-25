import 'dart:convert';

import 'package:flutter/foundation.dart';

class CollectionModel {
  const CollectionModel({
    this.name = '',
    this.description = '',
    this.image = '',
    this.slug = '',
    this.products = const [],
  });

  factory CollectionModel.fromMap(Map<String, dynamic> map) => CollectionModel(
        name: map['name'] as String,
        description: map['description'] as String,
        image: map['image'] as String,
        slug: map['slug'] as String,
        products: (map['products'] as List? ?? []).cast<String>(),
      );

  factory CollectionModel.fromJson(
    String source,
  ) =>
      CollectionModel.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  final String name;
  final String description;
  final String image;
  final String slug;
  final List<String> products;

  CollectionModel copyWith({
    String? name,
    String? description,
    String? image,
    String? slug,
    List<String>? products,
  }) =>
      CollectionModel(
        name: name ?? this.name,
        description: description ?? this.description,
        image: image ?? this.image,
        slug: slug ?? this.slug,
        products: products ?? this.products,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'name': name,
        'description': description,
        'image': image,
        'slug': slug,
        'products': products,
      };

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'CollectionModel(name: $name, description: $description, image: $image, slug: $slug, products: $products)';

  @override
  bool operator ==(covariant CollectionModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.description == description &&
        other.image == image &&
        other.slug == slug &&
        listEquals(other.products, products);
  }

  @override
  int get hashCode => name.hashCode ^ description.hashCode ^ image.hashCode ^ slug.hashCode ^ products.hashCode;
}
