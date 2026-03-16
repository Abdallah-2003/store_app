import 'package:dio/dio.dart';
import 'package:schooler_chat/core/networking/api_constants.dart';

abstract class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
        // headers: {'Content-Type' : 'application.json'}
      ),
    );
  }

  static Future<Response<dynamic>> getData({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    String? token,
  }) async {
    final res = await dio.get(endPoint, queryParameters: queryParameters);
    return res;
  }

  static Future<Response<dynamic>> postData({
    required String endPoint,
    Map<String, dynamic>? data,
    Options? options
  }) async {
    final res = await dio.post(endPoint, data: data, options: options);
    return res;
  }
}
