import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:printeasy_utils/printeasy_utils.dart';

class PropertiesModel {
  const PropertiesModel({
    required this.type,
    required this.options,
  });

  factory PropertiesModel.fromMap(Map<String, dynamic> map) => PropertiesModel(
        type: PropertyType.fromName(map['type'] as String? ?? ''),
        options: List<OptionsModel>.from(
          (map['options'] as List? ?? []).map<OptionsModel>(
            (x) => OptionsModel.fromMap(x as Map<String, dynamic>),
          ),
        ),
      );

  factory PropertiesModel.fromJson(
    String source,
  ) =>
      PropertiesModel.fromMap(json.decode(source) as Map<String, dynamic>);

  final PropertyType type;
  final List<OptionsModel> options;

  PropertiesModel copyWith({
    PropertyType? type,
    List<OptionsModel>? options,
  }) =>
      PropertiesModel(
        type: type ?? this.type,
        options: options ?? this.options,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'type': type.name,
        'options': options.map((x) => x.toMap()).toList(),
      };

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'PropertiesModel(type: $type, options: $options)';

  @override
  bool operator ==(covariant PropertiesModel other) {
    if (identical(this, other)) return true;

    return other.type == type && listEquals(other.options, options);
  }

  @override
  int get hashCode => type.hashCode ^ options.hashCode;
}
