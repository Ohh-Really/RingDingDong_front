import 'dart:io';

import 'package:ringdingdong/data/providers/network/api_endpoint.dart';
import 'package:ringdingdong/data/providers/network/api_provider.dart';
import 'package:ringdingdong/data/providers/network/api_request_representable.dart';
import 'package:ringdingdong/domain/entities/user.dart';

enum AuthType { login, policyAgree }

class AuthAPI implements APIRequestRepresentable {
  final AuthType type;
  User? user;
  String? token;

  AuthAPI._({required this.type, this.user, this.token});
  AuthAPI.login(User user) : this._(type: AuthType.login, user: user);
  AuthAPI.policyAgree(String token) : this._(type: AuthType.policyAgree, token: token);

  @override
  Map<String, dynamic>? get body {
    switch (type) {
      case AuthType.login:
        return user!.toJson();
      default:
        return null;
    }
  }

  @override
  String get endpoint => APIEndpoint.apiUrl;

  @override
  Map<String, String> get headers {
    switch (type) {
      case AuthType.login:
        return {HttpHeaders.contentTypeHeader: 'application/json'};
      case AuthType.policyAgree:
        return {HttpHeaders.contentTypeHeader: 'application/json', 'jwt': token!};
    }
  }

  @override
  HTTPMethod get method {
    return HTTPMethod.post;
  }

  @override
  String get path {
    switch (type) {
      case AuthType.login:
        return "/user/login";
      case AuthType.policyAgree:
        return "/user/policyAgree";
    }
  }

  @override
  Map<String, String> get query {
    return {HttpHeaders.contentTypeHeader: 'application/json'};
  }

  @override
  Future request() {
    return APIProvider().request(this);
  }

  @override
  String get url => endpoint + path;
}
