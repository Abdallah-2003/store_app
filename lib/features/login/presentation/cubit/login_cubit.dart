import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schooler_chat/core/services/cash_helper.dart';
import 'package:schooler_chat/features/login/presentation/cubit/login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit(this.dio) : super(InitialLoginState());

  final Dio dio;

  Future<void> login({required String name, required String password}) async {
    emit(LoadingLoginState());

    try {
      final res = await dio.post(
        'https://dummyjson.com/auth/login',
        data: {"username": name, "password": password},
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            // 'Postman-Token' : '<calculated when request is sent>',
            // 'Cookie' : 'accessToken=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJlbWlseXMiLCJlbWFpbCI6ImVtaWx5LmpvaG5zb25AeC5kdW1teWpzb24uY29tIiwiZmlyc3ROYW1lIjoiRW1pbHkiLCJsYXN0TmFtZSI6IkpvaG5zb24iLCJnZW5kZXIiOiJmZW1hbGUiLCJpbWFnZSI6Imh0dHBzOi8vZHVtbXlqc29uLmNvbS9pY29uL2VtaWx5cy8xMjgiLCJpYXQiOjE3NzE5NDQyMDcsImV4cCI6MTc3MTk0NzgwN30.wedBNhrt6CB7jiwrK-RF0mSF6mwi64CLmMMzgIBTrFA; refreshToken=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJlbWlseXMiLCJlbWFpbCI6ImVtaWx5LmpvaG5zb25AeC5kdW1teWpzb24uY29tIiwiZmlyc3ROYW1lIjoiRW1pbHkiLCJsYXN0TmFtZSI6IkpvaG5zb24iLCJnZW5kZXIiOiJmZW1hbGUiLCJpbWFnZSI6Imh0dHBzOi8vZHVtbXlqc29uLmNvbS9pY29uL2VtaWx5cy8xMjgiLCJpYXQiOjE3NzE5NDQyMDcsImV4cCI6MTc3NDUzNjIwN30.PG9v-hWbBW5PLAMYyRp5YlgVfYmnF6HDsVlXD3dsROo',
            // 'Content-Length' : '<calculated when request is sent>',
            // 'Host' : '<calculated when request is sent>',
          },
        ),
      );

      final accessToken = res.data['accessToken'];
      await CashHelper.saveData(key: 'accessToken', value: accessToken);

      if (res.statusCode == 200) {
        emit(SuccessLoginState());
      } else {
        emit(FailureLoginState(errMessage: 'error with status code'));
      }
    } catch (e) {
      emit(FailureLoginState(errMessage: e.toString()));
    }
  }
}
