import 'dart:convert';

import 'package:api2/api/api_controller.dart';
import 'package:api2/api/auth_api_controller.dart';
import 'package:api2/screens/auth/register_screen.dart';
import 'package:api2/widget/const_app.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of<LoginCubit>(context);

  late TextEditingController emailController;
  late TextEditingController passController;
  late TapGestureRecognizer recognizer;
  String? email = "";

  void initState() {
    if (Get.arguments != null && Get.arguments.containsKey('email')) {
      email = Get.arguments['email'];
    }
    emailController = TextEditingController(text: email);
    passController = TextEditingController();
    recognizer = TapGestureRecognizer()..onTap = routeToRegister;
    emit(LoginInitial());
  }

  void routeToRegister() {
    Get.to(RegisterScreen());
  }

  bool obscureText = true;
  bool isVisible = false;

  void visibilityPass() {
    obscureText = !obscureText;
    isVisible = !isVisible;
    emit(LoginVisibilityPass());
  }

  void loginApp(context) async {
    emit(LoginLoading());
    try {
      bool isLogin = await AuthApiController.login(context,
          email: emailController.text, password: passController.text);
      if (isLogin) {
        emit(LoginSuccess());
      }
    } catch (error) {
      print('error in login $error');
      emit(LoginError('$error'));
    }
  }
}
