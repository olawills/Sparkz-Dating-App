import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  const User({
    // this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.profilePicture,
    required this.token,
    required this.verified,
  });
  // final String? id;
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String profilePicture;
  final String token;
  final bool verified;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
