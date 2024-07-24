import 'dart:convert';

class AboutUsModel {
  AboutUsModel({
    this.aboutUs = '',
  });

  factory AboutUsModel.fromMap(Map<String, dynamic> map) => AboutUsModel(
        aboutUs: map['aboutUs'] as String,
      );

  factory AboutUsModel.fromJson(
    String source,
  ) =>
      AboutUsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  final String aboutUs;

  AboutUsModel copyWith({
    String? aboutUs,
  }) =>
      AboutUsModel(
        aboutUs: aboutUs ?? this.aboutUs,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'aboutUs': aboutUs,
      };

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'AboutUsModel(aboutUs: $aboutUs)';

  @override
  bool operator ==(covariant AboutUsModel other) {
    if (identical(this, other)) return true;

    return other.aboutUs == aboutUs;
  }

  @override
  int get hashCode => aboutUs.hashCode;
}
