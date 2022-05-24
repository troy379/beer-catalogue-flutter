import 'package:dio/dio.dart';

class PunkApiDioClient {
  static const String apiUrl = "https://api.punkapi.com/v2/";
  static const int connectTimeoutMilliseconds = 10000;
  static const int receiveTimeoutMilliseconds = 10000;

  final Dio dio;

  PunkApiDioClient._({
    required this.dio,
  });

  factory PunkApiDioClient.create() {
    final dio = Dio(
      BaseOptions(
        baseUrl: apiUrl,
        connectTimeout: connectTimeoutMilliseconds,
        receiveTimeout: receiveTimeoutMilliseconds,
      ),
    );

    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

    return PunkApiDioClient._(dio: dio);
  }
}
