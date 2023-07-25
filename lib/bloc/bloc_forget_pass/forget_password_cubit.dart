
import 'package:api2/api/auth_api_controller.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit() : super(ForgetPasswordInitial());

  static ForgetPasswordCubit get (context) => BlocProvider.of<ForgetPasswordCubit>(context);
  late TextEditingController emailController ;
  void initForgetScreen(){
    emailController = TextEditingController();
    emit(ForgetPasswordInitial());
  }

  void resetPassword(context)async{
  emit(ForgetPasswordLoading());
    bool forgetPass = await AuthApiController.forgetPassword(context, email: emailController.text);

    if (forgetPass) {
      emit(ForgetPasswordSuccess());
    }  else{
      emit(ForgetPasswordError());
    }
  }
}
