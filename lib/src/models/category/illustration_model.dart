import 'dart:convert';

class IllustrationModel {
  IllustrationModel({
    required this.id,
    required this.categoryId,
    required this.imageUrl,
  });

  factory IllustrationModel.fromMap(Map<String, dynamic> map) => IllustrationModel(
        id: map['id'] as String,
        categoryId: map['categoryId'] as String,
        imageUrl: map['imageUrl'] as String,
      );

  factory IllustrationModel.fromJson(String source) => IllustrationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  final String id;
  final String categoryId;
  final String imageUrl;

  IllustrationModel copyWith({
    String? id,
    String? categoryId,
    String? imageUrl,
  }) =>
      IllustrationModel(
        id: id ?? this.id,
        categoryId: categoryId ?? this.categoryId,
        imageUrl: imageUrl ?? this.imageUrl,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'categoryId': categoryId,
        'imageUrl': imageUrl,
      };

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'IllustrationModel(id: $id, categoryId: $categoryId, imageUrl: $imageUrl)';

  @override
  bool operator ==(covariant IllustrationModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.categoryId == categoryId && other.imageUrl == imageUrl;
  }

  @override
  int get hashCode => id.hashCode ^ categoryId.hashCode ^ imageUrl.hashCode;
}
