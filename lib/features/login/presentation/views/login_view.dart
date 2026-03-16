import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:schooler_chat/constants.dart';
import 'package:schooler_chat/core/functions/show_scafold.dart';
import 'package:schooler_chat/core/routing/routes.dart';
import 'package:schooler_chat/features/login/data/repo/login_repo.dart';
import 'package:schooler_chat/features/login/presentation/cubit/login_cubit.dart';
import 'package:schooler_chat/features/login/presentation/cubit/login_states.dart';
import 'package:schooler_chat/features/login/presentation/views/widgets/custom_bottom.dart';
import 'package:schooler_chat/features/login/presentation/views/widgets/custom_text_field.dart';



class LoginView extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey();
  String? name, password;
  bool isLoading = false;

   LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(LoginRepo()),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoadingLoginState) {
          isLoading = true;
        } else if (state is SuccessLoginState) {
          showScafold(context, 'Login successfully');
          Navigator.pushReplacementNamed(context, Routes.homeView);
          isLoading = false;
        } else if (state is FailureLoginState) {
          showScafold(context, state.errMessage);
          isLoading = false;
        }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: isLoading,
            child: Scaffold(
            backgroundColor: kPrimaryColor,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Form(
                key: formKey,
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    spacing: 10,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 60),
                        child: Image.asset(kLogo, width: 200, height: 200),
                      ),
                      const Text(
                        'Shop with me',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontFamily: 'Pacifico',
                        ),
                      ),
                      const SizedBox(height: 100),
                      const Row(
                        children: [
                          Text(
                            'Sign In',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'Pacifico',
                            ),
                          ),
                        ],
                      ),
                      CustomTextField(
                        onChanged: (data) {
                          name = data;
                        },
                        hintText: 'User Name',
                      ),
                      CustomTextField(
                        onChanged: (data) {
                          password = data;
                        },
                        hintText: 'Password',
                      ),
                      const SizedBox(height: 20),
                      CustomBottom(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            BlocProvider.of<LoginCubit>(context).login(name: name!, password: password!);
                          }
                          Navigator.pushNamed(context, Routes.homeView);
                        },
                        text: 'Login',
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Don\'t have an account?',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                          TextButton(
                            onPressed: () {
                        
                            },
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
                    ),
          );
        },
      ),
    );
  }
}