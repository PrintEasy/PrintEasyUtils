import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  const UserModel({
    required this.id,
    required this.email,
    required this.name,
    required this.phone,
    this.createdAt,
    this.updatedAt,
  });

  factory UserModel.fromMap(
    Map<String, dynamic> map,
  ) =>
      UserModel(
        id: map['id'] as String? ?? '',
        email: map['email'] as String? ?? '',
        name: map['name'] as String? ?? '',
        phone: map['phone'] as String? ?? '',
        createdAt: map['createdAt'] != null ? (map['createdAt'] as Timestamp).toDate() : null,
        updatedAt: map['updatedAt'] != null ? (map['updatedAt'] as Timestamp).toDate() : null,
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
  final DateTime? createdAt;
  final DateTime? updatedAt;

  UserModel copyWith({
    String? id,
    String? email,
    String? name,
    String? phone,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      UserModel(
        id: id ?? this.id,
        email: email ?? this.email,
        name: name ?? this.name,
        phone: phone ?? this.phone,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'email': email,
        'name': name,
        'phone': phone,
        'createdAt': createdAt != null ? Timestamp.fromDate(createdAt!) : FieldValue.serverTimestamp(),
        'updatedAt': updatedAt != null ? Timestamp.fromDate(updatedAt!) : FieldValue.serverTimestamp(),
      };

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'UserModel(id: $id, email: $email, name: $name, phone: $phone, createdAt: $createdAt, updatedAt: $updatedAt)';

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.email == email &&
        other.name == name &&
        other.phone == phone &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode => id.hashCode ^ email.hashCode ^ name.hashCode ^ phone.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode;
}
