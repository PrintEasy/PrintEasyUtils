import 'dart:convert';

class PromoHeadlineModel {

  PromoHeadlineModel({
    required this.id,
    required this.headline,
    required this.createdAt,
    required this.isActive,
  });

  /// Factory: From Map (API)
  factory PromoHeadlineModel.fromMap(Map<String, dynamic> map) => PromoHeadlineModel(
      id: map['id'] ?? '',
      headline: map['headline'] ?? '',
      createdAt: DateTime.tryParse(map['createdAt'] ?? '') ?? DateTime.now(),
      isActive: map['isActive'] ?? true,
    );

  /// Factory: From JSON string
  factory PromoHeadlineModel.fromJson(String source) =>
      PromoHeadlineModel.fromMap(json.decode(source));
  final String id;
  final String headline;
  final DateTime createdAt;
  final bool isActive;

  /// Convert model to Map
  Map<String, dynamic> toMap() => {
      'id': id,
      'headline': headline,
      'createdAt': createdAt.toIso8601String(),
      'isActive': isActive,
    };

  /// Convert model to JSON string
  String toJson() => json.encode(toMap());

  /// copyWith for immutability
  PromoHeadlineModel copyWith({
    String? id,
    String? headline,
    DateTime? createdAt,
    bool? isActive,
  }) => PromoHeadlineModel(
      id: id ?? this.id,
      headline: headline ?? this.headline,
      createdAt: createdAt ?? this.createdAt,
      isActive: isActive ?? this.isActive,
    );

  /// Override ==
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PromoHeadlineModel &&
        other.id == id &&
        other.headline == headline &&
        other.createdAt == createdAt &&
        other.isActive == isActive;
  }

  /// Override hashCode
  @override
  int get hashCode =>
      id.hashCode ^
      headline.hashCode ^
      createdAt.hashCode ^
      isActive.hashCode;

  /// toString override for debugging
  @override
  String toString() => 'PromoHeadlineModel(id: $id, headline: $headline, createdAt: $createdAt, isActive: $isActive)';

  /// Utilities for list conversion
  static List<PromoHeadlineModel> listFromJson(String jsonStr) {
    final List decoded = json.decode(jsonStr);
    return decoded.map((e) => PromoHeadlineModel.fromMap(e)).toList();
  }

  static String listToJson(List<PromoHeadlineModel> list) => json.encode(list.map((e) => e.toMap()).toList());
}
