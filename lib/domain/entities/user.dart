// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  factory User({
    required String id,
    required String email,
    required String name,
    required String picture,
    required String locale,
    @JsonKey(name: "verified_email") required bool verifiedEmail,
    @JsonKey(name: "given_name") required String givenName,
    @JsonKey(name: "family_name") required String familyName,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
