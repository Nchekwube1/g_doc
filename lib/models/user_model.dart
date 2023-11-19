// ignore_for_file: public_member_api_docs, sort_constructors_first, empty_constructor_bodies
import 'dart:convert';

class UserModel {
  final String email;
  final String name;
  final String profilePicture;
  final String token;
  final String uid;

  UserModel({
    required this.email,
    required this.name,
    required this.profilePicture,
    required this.uid,
    required this.token,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'name': name,
      'profilePicture': profilePicture,
      'token': token,
      'uid': uid,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'] as String,
      name: map['name'] as String,
      profilePicture: map['profilePicture'] as String,
      token: map['token'] as String,
      uid: map['id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  UserModel copyWith({
    String? email,
    String? name,
    String? profilePicture,
    String? token,
    String? uid,
  }) {
    return UserModel(
      email: email ?? this.email,
      name: name ?? this.name,
      profilePicture: profilePicture ?? this.profilePicture,
      token: token ?? this.token,
      uid: uid ?? this.uid,
    );
  }
}
