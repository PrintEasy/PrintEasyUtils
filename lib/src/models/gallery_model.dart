import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:printeasy_utils/printeasy_utils.dart';

class GalleryModel {
  const GalleryModel({
    this.id = '',
    required this.original,
    required this.thumbnail,
    this.tags = const [],
    required this.subcategory,
    this.createdAt,
    this.updatedAt,
  });

  factory GalleryModel.fromMap(Map<String, dynamic> map) => GalleryModel(
        id: map['id'] as String,
        original: map['original'] as String,
        thumbnail: map['thumbnail'] as String,
        tags: List<String>.from(map['tags'] as List? ?? []),
        subcategory: BookType.fromName(map['subcategory'] as String? ?? ''),
        createdAt: map['createdAt'] != null ? (map['createdAt'] as Timestamp).toDate() : null,
        updatedAt: map['updatedAt'] != null ? (map['updatedAt'] as Timestamp).toDate() : null,
      );

  factory GalleryModel.fromJson(String source) => GalleryModel.fromMap(json.decode(source) as Map<String, dynamic>);
  final String id;
  final String original;
  final String thumbnail;
  final List<String> tags;
  final BookType subcategory;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  GalleryModel copyWith({
    String? id,
    String? original,
    String? thumbnail,
    List<String>? tags,
    BookType? subcategory,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      GalleryModel(
        id: id ?? this.id,
        original: original ?? this.original,
        thumbnail: thumbnail ?? this.thumbnail,
        tags: tags ?? this.tags,
        subcategory: subcategory ?? this.subcategory,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'original': original,
        'thumbnail': thumbnail,
        'tags': tags,
        'subcategory': subcategory.name,
        'createdAt': createdAt != null ? Timestamp.fromDate(createdAt!) : FieldValue.serverTimestamp(),
        'updatedAt': updatedAt != null ? Timestamp.fromDate(updatedAt!) : FieldValue.serverTimestamp(),
      };

  String toJson() => json.encode(toMap());

  @override
  String toString() =>
      'GalleryModel(id: $id, original: $original, thumbnail: $thumbnail, tags: $tags, subcategory: $subcategory, createdAt: $createdAt, updatedAt: $updatedAt)';

  @override
  bool operator ==(covariant GalleryModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.original == original &&
        other.thumbnail == thumbnail &&
        listEquals(other.tags, tags) &&
        other.subcategory == subcategory &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode =>
      id.hashCode ^ original.hashCode ^ thumbnail.hashCode ^ tags.hashCode ^ subcategory.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode;
}
