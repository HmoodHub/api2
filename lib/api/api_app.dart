import 'dart:convert';

import 'package:api2/api/api_controller.dart';
import 'package:api2/model/AuthModel.dart';
import 'package:api2/model/storage_model.dart';
import 'package:api2/widget/wedget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';

import '../bloc/storage_app.dart';
import '../widget/const_app.dart';

class ApiApp {
  static Future<bool> register(ObjectUser object, context) async {
    ToastContext().init(context);
    var url = Uri.parse(ApiController.registerURL);
    var body = {
      'full_name': object.fullName,
      'email': object.email,
      'password': object.password,
      'gender': object.gender
    };
    var response = await http.post(url, body: body);
    if (response.statusCode == 201) {
      toastMessage(
        msg: jsonDecode(response.body)['message'],
        state: Colors.green,
        gravity: Toast.bottom,
      );
      return true;
    } else if (response.statusCode == 400) {
      toastMessage(
        msg: jsonDecode(response.body)['message'],
        state: Colors.red,
        gravity: Toast.bottom,
      );
      return false;
    }
    return false;
  }
  static Future<bool> login(String email, String pass, context, ObjectUser user) async {
    ToastContext().init(context);
    var url = Uri.parse(ApiController.loginURL);
    var body = {
      'email': email,
      'password': pass,
    };
    var response = await http.post(url, body: body);
    if (response.statusCode == 200) {
      user = ObjectUser.fromJson(jsonDecode(response.body)['object']);
      toastMessage(
        msg: jsonDecode(response.body)['message'],
        state: Colors.green,
        gravity: Toast.bottom,
      );
      StorageModel storageModel = StorageModel(jsonDecode(response.body)['status'], KeysStore.login.toString());
      StorageApp().writeSecureData(storageModel);
      return true;
    } else if (response.statusCode == 400) {
      toastMessage(
        msg: jsonDecode(response.body)['message'],
        state: Colors.red,
        gravity: Toast.bottom,
      );
      return false;
    }
    return false;
  }

}
