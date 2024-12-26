import 'dart:convert';

import 'package:flutter/foundation.dart';

class OptionsModel {
  const OptionsModel({
    this.id = '',
    this.title,
    this.label,
    this.value = '',
    this.options = const [],
  });

  factory OptionsModel.fromMap(Map<String, dynamic> map) => OptionsModel(
        id: map['id'] as String? ?? '',
        title: map['title'] as String?,
        label: map['label'] as String?,
        value: map['value'] as String,
        options: (map['options'] as List? ?? [])
            .map<OptionsModel>(
              (x) => OptionsModel.fromMap(x as Map<String, dynamic>),
            )
            .toList(),
      );

  factory OptionsModel.fromJson(
    String source,
  ) =>
      OptionsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  final String id;
  final String? title;
  final String? label;
  final String value;
  final List<OptionsModel> options;

  String get text => title ?? label ?? '';

  String get content => title ?? label ?? value;

  bool get hasTitle => title != null && title!.trim().isNotEmpty;

  bool get hasLabel => label != null && label!.trim().isNotEmpty;

  OptionsModel copyWith({
    String? id,
    String? title,
    String? label,
    String? value,
    List<OptionsModel>? options,
  }) =>
      OptionsModel(
        id: id ?? this.id,
        title: title ?? this.title,
        label: label ?? this.label,
        value: value ?? this.value,
        options: options ?? this.options,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'title': title,
        'label': label,
        'value': value,
        'options': options.map((e) => e.toMap()).toList(),
      };

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'OptionsModel(id: $id, title: $title, label: $label, value: $value, options: $options)';

  @override
  bool operator ==(covariant OptionsModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.title == title && other.label == label && other.value == value && listEquals(other.options, options);
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ label.hashCode ^ value.hashCode ^ options.hashCode;
}
