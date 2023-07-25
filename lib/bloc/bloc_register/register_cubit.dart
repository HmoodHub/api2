import 'dart:convert';

import 'package:api2/api/auth_api_controller.dart';
import 'package:api2/model/student_model.dart';
import 'package:api2/screens/auth/login_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  static RegisterCubit get(context) => BlocProvider.of<RegisterCubit>(context);
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passController;
  String gender = 'gender';
  void initState(){
    nameController = TextEditingController();
    emailController = TextEditingController();
    passController = TextEditingController();
    emit(RegisterInitial());
  }
  bool obscureText = true;
  bool isVisible = false;
  void visibilityPass(){
    obscureText = !obscureText;
    isVisible = !isVisible;
    emit(RegisterVisibilityPass());
  }

  void onChangeRadio(value){
    gender = value;
    emit(RegisterGenderState());
  }

  Student get student{
    Student student = Student();
    student.fullName = nameController.text;
    student.email = emailController.text;
    student.password = passController.text;
    student.gender = gender;
    return student;
  }

  void registerApp(context)async{
    emit(RegisterLoading());
    try{
      bool isRegister = await AuthApiController.register(context, student: student);
      if (isRegister) {
        Get.off(LoginScreen());
      }
      emit(RegisterSuccess());
    }catch(error){
      emit(RegisterError('$error'));
    }
  }

}
