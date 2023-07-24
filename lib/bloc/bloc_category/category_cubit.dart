import 'dart:convert';

import 'package:api2/api/api_controller.dart';
import 'package:api2/api/auth_api_controller.dart';
import 'package:api2/model/CategoryModel.dart';
import 'package:api2/widget/const_app.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../prefs/sheared_pref_controller.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  static CategoryCubit get(context) => BlocProvider.of<CategoryCubit>(context);


  String token = SharedPrfController().tokenApp;
  void init(){
    print("token is : $token");
  }

  void logout() async{
    bool logout = await AuthApiController.logout();
    if (logout) {
      emit(Logout());
    }
  }
}
