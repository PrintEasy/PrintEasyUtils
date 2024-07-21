import 'dart:convert';

import 'package:printeasy_utils/printeasy_utils.dart';

class TermsModel {
  const TermsModel({
    required this.label,
    required this.termType,
    required this.content,
  });

  factory TermsModel.fromMap(
    Map<String, dynamic> map,
  ) =>
      TermsModel(
        label: map['label'] as String? ?? '',
        termType: TermType.fromName(map['type'] as String? ?? ''),
        content: map['content'] as String? ?? '',
      );

  factory TermsModel.fromJson(
    String source,
  ) =>
      TermsModel.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  final String label;
  final TermType termType;
  final String content;

  TermsModel copyWith({
    String? label,
    TermType? termType,
    String? content,
  }) =>
      TermsModel(
        label: label ?? this.label,
        termType: termType ?? this.termType,
        content: content ?? this.content,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'label': label,
        'termType': termType.name,
        'content': content,
      };

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'TermsModel(label: $label, termType: $termType, content: $content)';

  @override
  bool operator ==(covariant TermsModel other) {
    if (identical(this, other)) return true;

    return other.label == label && other.termType == termType && other.content == content;
  }

  @override
  int get hashCode => label.hashCode ^ termType.hashCode ^ content.hashCode;
}
