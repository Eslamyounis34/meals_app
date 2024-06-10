import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;
  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectionTimeout:
        return ServerFailure('Connection Timeout with server');
      case DioErrorType.sendTimeout:
        return ServerFailure('SendConnection Timeout with server');
      case DioErrorType.receiveTimeout:
        return ServerFailure('RecieveConnection Timeout with server');
      case DioErrorType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode!, dioError.response!.data);
      case DioErrorType.cancel:
        return ServerFailure('Request to api Server was cancelled');
      case DioErrorType.unknown:
        if (dioError.message!.contains('SocketExeption')) {
          return ServerFailure('No Internet Connection');
        }
        return ServerFailure('UnExpected Error .. please try later!');
      default:
        return ServerFailure(
            'Oops there is an error  .. please try again later');
    }
  }
  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    // depend on api error json reponse .. in our case we have Field 'error' and Field 'message' inside it
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your Request not found .. please try again later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server Error .. please try again later');
    } else {
      return ServerFailure('Oops there is an error  .. please try again later');
    }
  }
}
