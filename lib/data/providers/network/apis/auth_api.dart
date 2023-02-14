import 'dart:io';

import 'package:ringdingdong/data/providers/network/api_endpoint.dart';
import 'package:ringdingdong/data/providers/network/api_provider.dart';
import 'package:ringdingdong/data/providers/network/api_request_representable.dart';

enum AuthType { login, policyAgree }

class AuthAPI implements APIRequestRepresentable {
  final AuthType type;
  String? id;
  String? email;

  AuthAPI._({required this.type, required this.id, required this.email});
  AuthAPI.login(String id, String email) : this._(type: AuthType.login, id: id, email: email);
  AuthAPI.policyAgree(String id, String email) : this._(type: AuthType.policyAgree, id: id, email: email);

  @override
  get body => {"id": id, "email": email};

  @override
  String get endpoint => APIEndpoint.apiUrl;

  @override
  Map<String, String> get headers => {HttpHeaders.contentTypeHeader: 'application/json'};

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
      default:
        return "";
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
