import 'dart:convert';

class UserModel {
  const UserModel({
    required this.id,
    required this.email,
    required this.name,
    required this.phone,
  });

  factory UserModel.fromMap(
    Map<String, dynamic> map,
  ) =>
      UserModel(
        id: map['id'] as String? ?? '',
        email: map['email'] as String? ?? '',
        name: map['name'] as String? ?? '',
        phone: map['phone'] as String? ?? '',
      );

  factory UserModel.fromJson(
    String source,
  ) =>
      UserModel.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  final String id;
  final String email;
  final String name;
  final String phone;

  UserModel copyWith({
    String? id,
    String? email,
    String? name,
    String? phone,
  }) =>
      UserModel(
        id: id ?? this.id,
        email: email ?? this.email,
        name: name ?? this.name,
        phone: phone ?? this.phone,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'email': email,
        'name': name,
        'phone': phone,
      };

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'UserModel(id: $id, email: $email, name: $name, phone: $phone)';

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.email == email && other.name == name && other.phone == phone;
  }

  @override
  int get hashCode => id.hashCode ^ email.hashCode ^ name.hashCode ^ phone.hashCode;
}
