import 'dart:io';

import 'package:ringdingdong/data/providers/network/api_endpoint.dart';
import 'package:ringdingdong/data/providers/network/api_provider.dart';
import 'package:ringdingdong/data/providers/network/api_request_representable.dart';

class GoogleLoginAPI implements APIRequestRepresentable {
  GoogleLoginAPI.getLoginUrl();

  @override
  get body => null;

  @override
  String get endpoint => APIEndpoint.apiUrl;

  @override
  Map<String, String> get headers => {HttpHeaders.contentTypeHeader: 'text/plain'};

  @override
  HTTPMethod get method {
    return HTTPMethod.get;
  }

  @override
  String get path => "/user/google/login";

  @override
  Map<String, String> get query {
    return {HttpHeaders.contentTypeHeader: 'text/plain'};
  }

  @override
  Future request() {
    return APIProvider().request(this);
  }

  @override
  String get url => endpoint + path;
}
