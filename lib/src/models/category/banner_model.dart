import 'dart:convert';

class BannerModel {
  BannerModel({
    required this.id,
    required this.imageUrl,
    required this.categoryId,
    required this.order,
  });

  factory BannerModel.fromMap(Map<String, dynamic> map) => BannerModel(
        id: map['id'] as String,
        imageUrl: map['imageUrl'] as String,
        categoryId: map['categoryId'] as String,
        order: map['order'] as int,
      );

  factory BannerModel.fromJson(String source) => BannerModel.fromMap(json.decode(source) as Map<String, dynamic>);

  final String id;
  final String imageUrl;
  final String categoryId;
  final int order;

  BannerModel copyWith({
    String? id,
    String? imageUrl,
    String? categoryId,
    int? order,
  }) =>
      BannerModel(
        id: id ?? this.id,
        imageUrl: imageUrl ?? this.imageUrl,
        categoryId: categoryId ?? this.categoryId,
        order: order ?? this.order,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'imageUrl': imageUrl,
        'categoryId': categoryId,
        'order': order,
      };

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'BannerModel(id: $id, imageUrl: $imageUrl, categoryId: $categoryId, order: $order)';

  @override
  bool operator ==(covariant BannerModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.imageUrl == imageUrl && other.categoryId == categoryId && other.order == order;
  }

  @override
  int get hashCode => id.hashCode ^ imageUrl.hashCode ^ categoryId.hashCode ^ order.hashCode;
}
