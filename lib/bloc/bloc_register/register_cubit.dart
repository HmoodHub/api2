import 'dart:convert';

import 'package:api2/api/api_app.dart';
import 'package:api2/screens/auth/login_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import '../../model/AuthModel.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  static RegisterCubit get(context) => BlocProvider.of<RegisterCubit>(context);
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passController;
  late TapGestureRecognizer recognizer ;
  void initState(){
    nameController = TextEditingController();
    emailController = TextEditingController();
    passController = TextEditingController();
    recognizer = TapGestureRecognizer()..onTap = routeToRegister;
    emit(RegisterInitial());
  }
  void routeToRegister(){
    Get.to(LoginScreen());
  }
  bool obscureText = true;
  bool isVisible = false;
  void visibilityPass(){
    obscureText = !obscureText;
    isVisible = !isVisible;
    emit(RegisterVisibilityPass());
  }

  String gender = 'gender';
  void onChangeRadio(value){
    gender = value;
    emit(RegisterGenderState());
  }

  ObjectUser get user{
    ObjectUser user = ObjectUser();
    user.fullName = nameController.text.trim();
    user.email = emailController.text.trim();
    user.password = passController.text.trim();
    user.gender = gender;
    return user;
  }

  void registerApp(context)async{
    emit(RegisterLoading());
    try{
      bool isRegister = await ApiApp.register(user, context);
      if (isRegister) {
        print('value is $isRegister');
        Get.off(LoginScreen());
      }
      emit(RegisterSuccess());
    }catch(error){
      print(error);
      emit(RegisterError('$error'));
    }
  }

}
