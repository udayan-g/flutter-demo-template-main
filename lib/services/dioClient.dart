import 'package:dio/dio.dart';
import 'package:demo/services/dioException.dart';

class DioClient {
  final dio = createDio();
  final tokenDio = Dio(BaseOptions(baseUrl: 'https://fakestoreapi.com'));

  DioClient._internal();

  static final _singleton = DioClient._internal();

  factory DioClient() => _singleton;

  static Dio createDio() {
    var dio = Dio(BaseOptions(
        baseUrl: 'https://fakestoreapi.com',
        receiveTimeout: 15000, // 15 seconds
        connectTimeout: 15000,
        sendTimeout: 15000,
        headers: {"x-user-agent": "android"}));

    dio.interceptors.addAll({
      AppInterceptors(dio),
    });
    return dio;
  }
}
