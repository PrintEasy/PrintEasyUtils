import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:printeasy_utils/printeasy_utils.dart';

class SupportModel {
  SupportModel({
    required this.email,
    required this.mobile,
    required this.whatsapp,
    required this.terms,
  });

  factory SupportModel.fromMap(
    Map<String, dynamic> map,
  ) =>
      SupportModel(
        email: map['email'] as String,
        mobile: map['mobile'] as String,
        whatsapp: map['whatsapp'] as String,
        terms: (map['terms'] as List? ?? [])
            .map<TermsModel>(
              (e) => TermsModel.fromMap(e as Map<String, dynamic>),
            )
            .toList(),
      );

  factory SupportModel.fromJson(
    String source,
  ) =>
      SupportModel.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  final String email;
  final String mobile;
  final String whatsapp;
  final List<TermsModel> terms;

  SupportModel copyWith({
    String? email,
    String? mobile,
    String? whatsapp,
    List<TermsModel>? terms,
  }) =>
      SupportModel(
        email: email ?? this.email,
        mobile: mobile ?? this.mobile,
        whatsapp: whatsapp ?? this.whatsapp,
        terms: terms ?? this.terms,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'email': email,
        'mobile': mobile,
        'whatsapp': whatsapp,
        'terms': terms.map((e) => e.toMap()).toList(),
      };

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'SupportModel(email: $email, mobile: $mobile, whatsapp: $whatsapp, terms: $terms)';

  @override
  bool operator ==(covariant SupportModel other) {
    if (identical(this, other)) return true;

    return other.email == email && other.mobile == mobile && other.whatsapp == whatsapp && listEquals(other.terms, terms);
  }

  @override
  int get hashCode => email.hashCode ^ mobile.hashCode ^ whatsapp.hashCode ^ terms.hashCode;
}
