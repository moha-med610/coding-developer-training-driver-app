import 'package:dio/dio.dart';

class DioConfig {
  static Dio dioClient() {
    final Dio dio = Dio(BaseOptions());

    dio.interceptors.addAll([]);
    return dio;
  }
}
