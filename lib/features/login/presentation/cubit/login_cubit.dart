import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schooler_chat/features/login/data/repo/login_repo.dart';
import 'package:schooler_chat/features/login/presentation/cubit/login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  final LoginRepo loginRepo;
  LoginCubit(this.loginRepo) : super(InitialLoginState());


  Future<void> login({required String name, required String password}) async {
    emit(LoadingLoginState());

    try {
      await loginRepo.login(name: name, password: password);
      emit(SuccessLoginState());

     
    } catch (e) {
      emit(FailureLoginState(errMessage: e.toString()));
    }
  }
}
