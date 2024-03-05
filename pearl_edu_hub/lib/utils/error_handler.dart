import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ErrorHandler extends Interceptor {
  final Dio dio;

  ErrorHandler(this.dio);

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint(
        "Error is ====> ${err.response?.statusCode} ${err.response?.data} and url is ===> ${err.requestOptions.path}");
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.connectionError:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.badCertificate:
      case DioExceptionType.receiveTimeout:
        throw DeadlineExceededException(err.requestOptions);
      case DioExceptionType.badResponse:
        switch (err.response?.statusCode) {
          case 422:
            throw BadRequestException(err.response, err.requestOptions);
          case 400:
            throw BadRequestException(err.response, err.requestOptions);
          case 401:
            throw UnauthorizedException(err.requestOptions);
          case 404:
            throw NotFoundException(err.requestOptions);
          case 409:
            throw ConflictException(err.requestOptions);
          case 429:
            throw TooManyRequestException(err.requestOptions);
          case 500:
            throw InternalServerErrorException(err.requestOptions);
        }
        break;
      case DioExceptionType.cancel:
        break;
      case DioExceptionType.unknown:
        throw InternalServerErrorException(err.requestOptions);
    }

    return handler.next(err);
  }
}

class BadRequestException extends DioException {
  BadRequestException(Response? res, RequestOptions r)
      : super(requestOptions: r, response: res);

  @override
  String toString() {
    return response.toString();
  }
}

class InternalServerErrorException extends DioException {
  InternalServerErrorException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Unknown error occurred, please try again later.';
  }
}

class ConflictException extends DioException {
  ConflictException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Conflict occurred';
  }
}

class UnauthorizedException extends DioException {
  UnauthorizedException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Access denied';
  }
}

class NotFoundException extends DioException {
  NotFoundException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'The requested information could not be found';
  }
}

class NoInternetConnectionException extends DioException {
  NoInternetConnectionException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'No internet connection detected, please try again.';
  }
}

class DeadlineExceededException extends DioException {
  DeadlineExceededException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Please check your internet connection.';
  }
}

class TooManyRequestException extends DioException {
  TooManyRequestException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Too many request server exception.';
  }
}

bool checkConnectionError(DioException dioError) {
  return dioError is DeadlineExceededException ||
      dioError is NoInternetConnectionException;
}
