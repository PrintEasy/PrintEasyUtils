import 'dart:convert';

class BannerModel {
  BannerModel({
    required this.id,
    required this.imageUrl,
    required this.categoryId,
    required this.order,
    this.isActive = true,
  });

  factory BannerModel.fromMap(Map<String, dynamic> map) => BannerModel(
        id: map['id'] as String,
        imageUrl: map['imageUrl'] as String,
        categoryId: map['categoryId'] as String,
        order: map['order'] as int,
        isActive: map['isActive'] as bool? ?? true,
      );

  factory BannerModel.fromJson(String source) => BannerModel.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  final String id;
  final String imageUrl;
  final String categoryId;
  final int order;
  final bool isActive;

  BannerModel copyWith({
    String? id,
    String? imageUrl,
    String? categoryId,
    int? order,
    bool? isActive,
  }) =>
      BannerModel(
        id: id ?? this.id,
        imageUrl: imageUrl ?? this.imageUrl,
        categoryId: categoryId ?? this.categoryId,
        order: order ?? this.order,
        isActive: isActive ?? this.isActive,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'imageUrl': imageUrl,
        'categoryId': categoryId,
        'order': order,
        'isActive': isActive,
      };

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'BannerModel(id: $id, imageUrl: $imageUrl, categoryId: $categoryId, order: $order, isActive: $isActive)';

  @override
  bool operator ==(covariant BannerModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.imageUrl == imageUrl && other.categoryId == categoryId && other.order == order && other.isActive == isActive;
  }

  @override
  int get hashCode => id.hashCode ^ imageUrl.hashCode ^ categoryId.hashCode ^ order.hashCode ^ isActive.hashCode;
}
