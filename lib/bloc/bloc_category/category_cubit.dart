import 'dart:convert';

import 'package:api2/api/api_controller.dart';
import 'package:api2/model/CategoryModel.dart';
import 'package:api2/widget/const_app.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../storage_app.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  static CategoryCubit get(context) => BlocProvider.of<CategoryCubit>(context);

  late String token ;
  late String name ;
  late String email ;
  late String gender ;

  late String data;
  void initCategory(){
    token = StorageApp().dataSave(KeysStore.token.toString())??'NO';
    name = StorageApp().dataSave(KeysStore.name.toString())??'NO';
    email = StorageApp().dataSave(KeysStore.email.toString())??'NO';
    gender = StorageApp().dataSave(KeysStore.gender.toString())??'NO';
    data = '';
  }

  void setData(){
    data = '''
    'token : $token'
    'name :  $name'
    'email :  $email'
    'gender : $gender '
    ''';
    emit(SetData());
  }
}
