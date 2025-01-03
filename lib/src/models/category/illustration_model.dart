import 'dart:convert';

class IllustrationModel {
  IllustrationModel({
    required this.id,
    required this.categoryId,
    required this.image,
  });

  factory IllustrationModel.fromMap(Map<String, dynamic> map) => IllustrationModel(
        id: map['id'] as String,
        categoryId: map['categoryId'] as String,
        image: map['image'] as String,
      );

  factory IllustrationModel.fromJson(String source) => IllustrationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  final String id;
  final String categoryId;
  final String image;

  IllustrationModel copyWith({
    String? id,
    String? categoryId,
    String? image,
  }) =>
      IllustrationModel(
        id: id ?? this.id,
        categoryId: categoryId ?? this.categoryId,
        image: image ?? this.image,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'categoryId': categoryId,
        'image': image,
      };

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'IllustrationModel(id: $id, categoryId: $categoryId, image: $image)';

  @override
  bool operator ==(covariant IllustrationModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.categoryId == categoryId && other.image == image;
  }

  @override
  int get hashCode => id.hashCode ^ categoryId.hashCode ^ image.hashCode;
}
