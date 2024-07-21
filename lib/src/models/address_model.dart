import 'dart:convert';

class AddressModel {
  const AddressModel({
    this.id,
    required this.name,
    required this.mobile,
    required this.email,
    required this.line1,
    this.line2,
    required this.city,
    required this.state,
    required this.country,
    required this.pinCode,
    this.isDefault = false,
  });

  factory AddressModel.fromMap(Map<String, dynamic> map) => AddressModel(
        id: map['id'] as String?,
        name: map['name'] as String? ?? map['firstName'] as String? ?? '',
        mobile: map['mobile'] as String? ?? '',
        email: map['email'] as String? ?? '',
        line1: map['line1'] as String? ?? '',
        line2: map['line2'] as String?,
        city: map['city'] as String? ?? map['district'] as String? ?? '',
        state: map['state'] as String? ?? '',
        country: map['country'] as String? ?? '',
        pinCode: map['pinCode'] as String? ?? '',
        isDefault: map['isDefault'] as bool? ?? false,
      );

  factory AddressModel.fromJson(String source) => AddressModel.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  String get address => [
        line1,
        line2,
        city,
      ].where((e) => e != null).join(', ');

  String get region => [state, country].join(', ');

  final String? id;
  final String name;
  final String mobile;
  final String email;
  final String line1;
  final String? line2;
  final String city;
  final String state;
  final String country;
  final String pinCode;
  final bool isDefault;

  AddressModel copyWith({
    String? id,
    String? name,
    String? mobile,
    String? email,
    String? line1,
    String? line2,
    String? city,
    String? state,
    String? country,
    String? pinCode,
    bool? isDefault,
  }) =>
      AddressModel(
        id: id ?? this.id,
        name: name ?? this.name,
        mobile: mobile ?? this.mobile,
        email: email ?? this.email,
        line1: line1 ?? this.line1,
        line2: line2 ?? this.line2,
        city: city ?? this.city,
        state: state ?? this.state,
        country: country ?? this.country,
        pinCode: pinCode ?? this.pinCode,
        isDefault: isDefault ?? this.isDefault,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'name': name,
        'mobile': mobile,
        'email': email,
        'line1': line1,
        'line2': line2,
        'city': city,
        'state': state,
        'country': country,
        'pinCode': pinCode,
        'isDefault': isDefault,
      };

  String toJson() => json.encode(toMap());

  @override
  String toString() =>
      'AddressModel(id: $id, name: $name, mobile: $mobile, email: $email, line1: $line1, line2: $line2, city: $city, state: $state, country: $country, pinCode: $pinCode, isDefault: $isDefault)';

  @override
  bool operator ==(covariant AddressModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.mobile == mobile &&
        other.email == email &&
        other.line1 == line1 &&
        other.line2 == line2 &&
        other.city == city &&
        other.state == state &&
        other.country == country &&
        other.pinCode == pinCode &&
        other.isDefault == isDefault;
  }

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      mobile.hashCode ^
      email.hashCode ^
      line1.hashCode ^
      line2.hashCode ^
      city.hashCode ^
      state.hashCode ^
      country.hashCode ^
      pinCode.hashCode ^
      isDefault.hashCode;
}
