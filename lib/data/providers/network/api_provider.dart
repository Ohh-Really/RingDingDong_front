import 'dart:async';
import 'dart:io';

import 'package:get/get.dart';
import 'package:get/get_connect/connect.dart';
import 'package:ringdingdong/data/providers/network/api_request_representable.dart';

class APIProvider {
  static const requestTimeOut = Duration(seconds: 15);
  final _client = GetConnect(timeout: requestTimeOut);

  static final _singleton = APIProvider();
  static APIProvider get insance => _singleton;

  Future request(APIRequestRepresentable request) async {
    try {
      final response = await _client.request(
        request.url,
        request.method.string,
        headers: request.headers,
        query: request.query,
        body: request.body,
      );
      return _returnResponse(response);
    } on TimeoutException catch (_) {
      throw TimeOutException(null);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  dynamic _returnResponse(Response<dynamic> response) {
    switch (response.statusCode) {
      case 200:
        return response.body;
      case 201:
        throw PolicyAgreeException(response.body.toString());
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 404:
        throw BadRequestException('Not found');
      case 500:
        throw FetchDataException('Internal Server Error');
      default:
        throw FetchDataException('Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}

class AppException implements Exception {
  final String code;
  final String message;
  final String? details;

  AppException({required this.code, required this.message, this.details});

  @override
  String toString() {
    return "[$code]: $message \n $details";
  }
}

class FetchDataException extends AppException {
  FetchDataException(String? details)
      : super(
          code: "fetch-data",
          message: "Error During Communication",
          details: details,
        );
}

class PolicyAgreeException extends AppException {
  PolicyAgreeException(String? details)
      : super(
          code: "need-policy-agree",
          message: "Need Policy Agree",
          details: details,
        );
}

class BadRequestException extends AppException {
  BadRequestException(String? details)
      : super(
          code: "invalid-request",
          message: "Invalid Request",
          details: details,
        );
}

class UnauthorisedException extends AppException {
  UnauthorisedException(String? details)
      : super(
          code: "unauthorised",
          message: "Unauthorised",
          details: details,
        );
}

class InvalidInputException extends AppException {
  InvalidInputException(String? details)
      : super(
          code: "invalid-input",
          message: "Invalid Input",
          details: details,
        );
}

class AuthenticationException extends AppException {
  AuthenticationException(String? details)
      : super(
          code: "authentication-failed",
          message: "Authentication Failed",
          details: details,
        );
}

class TimeOutException extends AppException {
  TimeOutException(String? details)
      : super(
          code: "request-timeout",
          message: "Request TimeOut",
          details: details,
        );
}
