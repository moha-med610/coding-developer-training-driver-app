import 'package:coding_developer_driver_app/core/errors/failure.dart';
import 'package:dio/dio.dart';

class DioErrorHandler {
  static Failure handle(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return NetworkFailure(message: 'Connection Timeout');
      case DioExceptionType.sendTimeout:
        return NetworkFailure(message: 'Send Timeout');
      case DioExceptionType.receiveTimeout:
        return NetworkFailure(message: 'Receive Timeout');
      case DioExceptionType.badCertificate:
        return BadRequestFailure(message: 'Bad Certificate');
      case DioExceptionType.badResponse:
        return _handleStatusCode(e.response!.statusCode!, e.response!.data);
      case DioExceptionType.cancel:
        // TODO: Handle this case.
        throw UnimplementedError();
      case DioExceptionType.connectionError:
        return NoInternetFailure(message: "No Internet Connection");
      case DioExceptionType.unknown:
        return UnknownFailure(message: "Unknown Error");
    }
  }

  static Failure _handleStatusCode(int statusCode, data) {
    switch (statusCode) {
      case 400:
        return BadRequestFailure(message: data['message']);
      case 401:
        return UnauthorizedFailure(message: data['message']);
      case 404:
        return NotFoundFailure(message: data['message']);
      case 409:
        return ConflictFailure(message: data['message']);
      case 500:
        return InternalServerErrorFailure(message: data['message']);
      default:
        return UnknownFailure(message: data['message']);
    }
  }
}
