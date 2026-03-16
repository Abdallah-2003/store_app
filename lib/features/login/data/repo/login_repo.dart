import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:schooler_chat/core/networking/api_constants.dart';
import 'package:schooler_chat/core/networking/dio_helper.dart';
import 'package:schooler_chat/core/services/cash_helper.dart';

class LoginRepo {
  Future<Either<String, void>> login({
    required String name,
    required String password,
  }) async {
    try {
      final res = await DioHelper.postData(
        endPoint: ApiConstants.loginEndpoint,
        data: {"username": name, "password": password},
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      final accessToken = res.data['accessToken'];
      await CashHelper.saveData(key: 'accessToken', value: accessToken);

      return right(null);
    } on Exception catch (e) {
      return left(e.toString());
    }
  }
}
