import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:printeasy_utils/printeasy_utils.dart';

class CustomizationModel {
  const CustomizationModel({
    this.title = '',
    this.label,
    this.options = const [],
    this.type = PropertyType.pageSize,
  });

  factory CustomizationModel.fromMap(Map<String, dynamic> map) => CustomizationModel(
        title: map['title'] as String? ?? '',
        label: map['label'] as String?,
        options: (map['options'] as List? ?? [])
            .map<OptionsModel>(
              (x) => OptionsModel.fromMap(x as Map<String, dynamic>),
            )
            .toList(),
        type: PropertyType.fromName(map['type'] as String? ?? ''),
      );

  factory CustomizationModel.fromJson(
    String source,
  ) =>
      CustomizationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  final String title;
  final String? label;
  final List<OptionsModel> options;
  final PropertyType type;

  CustomizationModel copyWith({
    String? title,
    String? label,
    List<OptionsModel>? options,
    PropertyType? type,
  }) =>
      CustomizationModel(
        title: title ?? this.title,
        label: label ?? this.label,
        options: options ?? this.options,
        type: type ?? this.type,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'title': title,
        'label': label,
        'options': options.map((x) => x.toMap()).toList(),
        'type': type.name,
      };

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'CustomizationModel(title: $title, label: $label, options: $options, type: $type)';

  @override
  bool operator ==(covariant CustomizationModel other) {
    if (identical(this, other)) return true;

    return other.title == title && other.label == label && listEquals(other.options, options) && other.type == type;
  }

  @override
  int get hashCode => title.hashCode ^ label.hashCode ^ options.hashCode ^ type.hashCode;
}
