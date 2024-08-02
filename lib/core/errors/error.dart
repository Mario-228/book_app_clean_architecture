import 'package:dio/dio.dart';

abstract class Errors {
  final String errorMessage;
  const Errors({required this.errorMessage});
}

class ServerError extends Errors {
  ServerError({required super.errorMessage});

  factory ServerError.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerError(errorMessage: "Connection Timeout with server");
      case DioExceptionType.sendTimeout:
        return ServerError(errorMessage: "Send Timeout with server");
      case DioExceptionType.receiveTimeout:
        return ServerError(errorMessage: "Receive Timeout with server");
      case DioExceptionType.badCertificate:
        return ServerError(errorMessage: "Bad Certificate with server");
      case DioExceptionType.badResponse:
        return ServerError.fromResponse(
            dioError.response!.statusCode!, dioError.response!.data);
      case DioExceptionType.cancel:
        return ServerError(errorMessage: "Request to api was cancelled");
      case DioExceptionType.connectionError:
        return ServerError(errorMessage: "No Internet Connection");
      case DioExceptionType.unknown:
        return ServerError(
            errorMessage: "Opps There was an error , please try again");
    }
  }

  factory ServerError.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerError(errorMessage: response['error']['message']);
    } else if (statusCode == 404) {
      return ServerError(
          errorMessage: "Your request not found, please try later");
    } else if (statusCode == 500) { 
      return ServerError(
          errorMessage: "Internal server error, please try later");
    } else {
      return ServerError(
          errorMessage: "Opps There was an error , please try again");
    }
  }
}
