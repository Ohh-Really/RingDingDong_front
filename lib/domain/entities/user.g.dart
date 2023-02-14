// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['id'] as String,
      email: json['email'] as String,
      name: json['name'] as String,
      picture: json['picture'] as String,
      locale: json['locale'] as String,
      verifiedEmail: json['verified_email'] as bool,
      givenName: json['given_name'] as String,
      familyName: json['family_name'] as String,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'picture': instance.picture,
      'locale': instance.locale,
      'verified_email': instance.verifiedEmail,
      'given_name': instance.givenName,
      'family_name': instance.familyName,
    };
