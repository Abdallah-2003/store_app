import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schooler_chat/features/login/data/repo/login_repo.dart';
import 'package:schooler_chat/features/login/presentation/cubit/login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  final LoginRepo loginRepo;
  LoginCubit(this.loginRepo) : super(InitialLoginState());

  Future<void> login({required String name, required String password}) async {
    emit(LoadingLoginState());

    final res = await loginRepo.login(name: name, password: password);
    res.fold(
      (error) => emit(FailureLoginState(errMessage: error)),
      (_) => emit(SuccessLoginState()),
    );
  }
}
