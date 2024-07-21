import 'dart:convert';

class DimensionModel {
  const DimensionModel({
    this.length = 0,
    this.width = 0,
    this.height = 0,
    this.weight = 0,
  });

  factory DimensionModel.fromMap(Map<String, dynamic> map) => DimensionModel(
        length: map['length'] as double? ?? 0,
        width: map['width'] as double? ?? 0,
        height: map['height'] as double? ?? 0,
        weight: map['weight'] as double? ?? 0,
      );

  factory DimensionModel.fromJson(
    String source,
  ) =>
      DimensionModel.fromMap(json.decode(source) as Map<String, dynamic>);

  final double length;
  final double width;
  final double height;
  final double weight;

  DimensionModel copyWith({
    double? length,
    double? width,
    double? height,
    double? weight,
  }) =>
      DimensionModel(
        length: length ?? this.length,
        width: width ?? this.width,
        height: height ?? this.height,
        weight: weight ?? this.weight,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'length': length,
        'width': width,
        'height': height,
        'weight': weight,
      };

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'DimensionModel(length: $length, width: $width, height: $height, weight: $weight)';

  @override
  bool operator ==(covariant DimensionModel other) {
    if (identical(this, other)) return true;

    return other.length == length && other.width == width && other.height == height && other.weight == weight;
  }

  @override
  int get hashCode => length.hashCode ^ width.hashCode ^ height.hashCode ^ weight.hashCode;
}
