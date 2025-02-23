import 'dart:convert';

class PredictionModel {
  const PredictionModel({
    required this.description,
    required this.placeId,
    required this.mainText,
    required this.secondaryText,
  });

  factory PredictionModel.fromMap(Map<String, dynamic> map) => PredictionModel(
        description: map['description'] as String,
        placeId: map['place_id'] as String,
        mainText: map['structured_formatting']['main_text'] as String,
        secondaryText: map['structured_formatting']['secondary_text'] as String,
      );

  factory PredictionModel.fromJson(
    String source,
  ) =>
      PredictionModel.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  final String description;
  final String placeId;
  final String mainText;
  final String secondaryText;

  PredictionModel copyWith({
    String? description,
    String? placeId,
    String? mainText,
    String? secondaryText,
  }) =>
      PredictionModel(
        description: description ?? this.description,
        placeId: placeId ?? this.placeId,
        mainText: mainText ?? this.mainText,
        secondaryText: secondaryText ?? this.secondaryText,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'description': description,
        'place_id': placeId,
        'main_text': mainText,
        'secondary_text': secondaryText,
      };

  String toJson() => json.encode(toMap());

  @override
  String toString() =>
      'PredictionModel(description: $description, place_id: $placeId, main_text: $mainText, secondary_text: $secondaryText)';

  @override
  bool operator ==(covariant PredictionModel other) {
    if (identical(this, other)) return true;

    return other.description == description &&
        other.placeId == placeId &&
        other.mainText == mainText &&
        other.secondaryText == secondaryText;
  }

  @override
  int get hashCode =>
      description.hashCode ^
      placeId.hashCode ^
      mainText.hashCode ^
      secondaryText.hashCode;
}
