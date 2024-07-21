import 'dart:convert';

import 'package:printeasy_utils/printeasy_utils.dart';

class PropertyConfigModel {
  const PropertyConfigModel({
    this.title = '',
    this.label = '',
    this.type = PropertyType.pageSize,
  });

  factory PropertyConfigModel.fromMap(Map<String, dynamic> map) => PropertyConfigModel(
        title: map['title'] as String,
        label: map['label'] as String?,
        type: PropertyType.fromName(map['type'] as String? ?? ''),
      );

  factory PropertyConfigModel.fromJson(String source) => PropertyConfigModel.fromMap(json.decode(source) as Map<String, dynamic>);
  final String title;
  final String? label;
  final PropertyType type;

  PropertyConfigModel copyWith({
    String? title,
    String? label,
    PropertyType? type,
  }) =>
      PropertyConfigModel(
        title: title ?? this.title,
        label: label ?? this.label,
        type: type ?? this.type,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'title': title,
        'label': label,
        'type': type.name,
      };

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'PropertyConfigModel(title: $title, label: $label, type: $type)';

  @override
  bool operator ==(covariant PropertyConfigModel other) {
    if (identical(this, other)) return true;

    return other.title == title && other.label == label && other.type == type;
  }

  @override
  int get hashCode => title.hashCode ^ label.hashCode ^ type.hashCode;
}
