import 'dart:convert';

import 'package:api2/api/api_app.dart';
import 'package:api2/api/api_controller.dart';
import 'package:api2/model/AuthModel.dart';
import 'package:api2/model/storage_model.dart';
import 'package:api2/screens/auth/register_screen.dart';
import 'package:api2/widget/const_app.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

import '../../screens/category_screen.dart';
import '../storage_app.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of<LoginCubit>(context);

  late TextEditingController emailController;
  late TextEditingController passController;
  late TapGestureRecognizer recognizer;

  void initState() {
    emailController = TextEditingController();
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

  ObjectUser user = ObjectUser();
  late StorageModel store ;

  void loginApp(context)async{
    emit(LoginLoading());
    try{
      bool isLogin = await ApiApp.login(emailController.text.trim(), passController.text.trim(), context, user);
      if (isLogin) {
          if (user != null) {
            store = StorageModel(user.token, KeysStore.token.toString());
            StorageApp().writeSecureData(store);
            store = StorageModel(user.fullName, KeysStore.token.toString());
            StorageApp().writeSecureData(store);
            store = StorageModel(user.email, KeysStore.token.toString());
            StorageApp().writeSecureData(store);
            store = StorageModel(user.gender, KeysStore.token.toString());
            StorageApp().writeSecureData(store);
          }
        Get.off(() => const CategoryScreen());
      }
      emit(LoginSuccess());
    }catch(error){
      print('error in login $error');
      emit(LoginError('$error'));
    }
  }
}
