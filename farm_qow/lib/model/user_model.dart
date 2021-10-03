import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  String id;
  String username;
  String password;
  bool isManager = false;

  UserModel({
    required this.id,
    required this.username,
    required this.password,
    required this.isManager,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
