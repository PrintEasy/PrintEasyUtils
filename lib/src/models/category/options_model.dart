import 'dart:convert';

class OptionsModel {
  const OptionsModel({
    this.title,
    this.label,
    this.value = '',
  });

  factory OptionsModel.fromMap(Map<String, dynamic> map) => OptionsModel(
        title: map['title'] as String?,
        label: map['label'] as String?,
        value: map['value'] as String,
      );

  factory OptionsModel.fromJson(
    String source,
  ) =>
      OptionsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  final String? title;
  final String? label;
  final String value;

  String get text => title ?? label ?? '';

  bool get hasTitle => title != null && title!.trim().isNotEmpty;

  bool get hasLabel => label != null && label!.trim().isNotEmpty;

  OptionsModel copyWith({
    String? title,
    String? label,
    String? value,
  }) =>
      OptionsModel(
        title: title ?? this.title,
        label: label ?? this.label,
        value: value ?? this.value,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'title': title,
        'label': label,
        'value': value,
      };

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'OptionsModel(title: $title, label: $label, value: $value)';

  @override
  bool operator ==(covariant OptionsModel other) {
    if (identical(this, other)) return true;

    return other.title == title && other.label == label && other.value == value;
  }

  @override
  int get hashCode => title.hashCode ^ label.hashCode ^ value.hashCode;
}
