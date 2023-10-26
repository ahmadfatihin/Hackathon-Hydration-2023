import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';
part 'user_entity.g.dart';

@freezed
abstract class UserData with _$UserData {
  const factory UserData({
    required String name,
    required double height,
    required double weight,
    required int age,
  }) = _UserData;

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}

extension UserDataExtensions on UserData {
  static UserData fromString(String jsonString) =>
      UserData.fromJson(json.decode(jsonString));

  String toJsonString() => json.encode(toJson());
}
