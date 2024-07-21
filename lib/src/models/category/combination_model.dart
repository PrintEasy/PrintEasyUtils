import 'dart:convert';

import 'package:printeasy_utils/printeasy_utils.dart';

class CombinationModel {
  const CombinationModel({
    this.key = PropertyType.pageSize,
    this.value = '',
  });

  factory CombinationModel.fromMap(Map<String, dynamic> map) => CombinationModel(
        key: PropertyType.fromName(map['key'] as String? ?? ''),
        value: map['value'] as String? ?? '',
      );

  factory CombinationModel.fromJson(
    String source,
  ) =>
      CombinationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  final PropertyType key;
  final String value;

  CombinationModel copyWith({
    PropertyType? key,
    String? value,
  }) =>
      CombinationModel(
        key: key ?? this.key,
        value: value ?? this.value,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'key': key.name,
        'value': value,
      };

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'CombinationModel(key: $key, value: $value)';

  @override
  bool operator ==(covariant CombinationModel other) {
    if (identical(this, other)) return true;

    return other.key == key && other.value == value;
  }

  @override
  int get hashCode => key.hashCode ^ value.hashCode;
}
