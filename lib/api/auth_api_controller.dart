import 'dart:convert';
import 'dart:io';

import 'package:api2/api/api_controller.dart';
import 'package:api2/model/student_model.dart';
import 'package:api2/prefs/sheared_pref_controller.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';

import '../widget/wedget.dart';

class AuthApiController {
  static Future<bool> register(context, {required Student student}) async {
    ToastContext().init(context);
    var url = Uri.parse(ApiController.registerURL);
    var response = await http.post(
      url,
      body: {
        'full_name': student.fullName,
        'email': student.email,
        'password': student.password,
        'gender': student.gender
      },
    );

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

  static Future<bool> login(context,
      {required String email, required String password}) async {
    ToastContext().init(context);
    var url = Uri.parse(ApiController.loginURL);
    var response = await http.post(
      url,
      body: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      // Shared Prf data user..
      var bodyObject = jsonDecode(response.body)['object'];
      Student student = Student.fromJson(bodyObject);
      SharedPrfController().save(student: student);
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
    } else {
      return false;
    }
  }

  static Future<bool> logout() async {
    var url = Uri.parse(ApiController.logoutURL);
    var response = await http.get(url, headers: {
      HttpHeaders.authorizationHeader: SharedPrfController().tokenApp,
      HttpHeaders.acceptHeader: 'application/json'
    });
    if (response.statusCode == 200 || response.statusCode == 401) {
      await SharedPrfController().clear();
      return true;
    }
    return false;
  }

  static Future<bool> forgetPassword(context, {required String email}) async {
    ToastContext().init(context);
    var url = Uri.parse(ApiController.forgetPassURL);
    var response = await http.post(
      url,
      body: {
        'email': email,
      },
    );
    if (response.statusCode == 200) {
      print(jsonDecode(response.body)['code']);
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
    } else {
      return false;
    }
  }

  static Future<bool> resetPassword(
    context, {
    required String email,
    required String code,
    required String pass,
    required String conPass,
  }) async {
    ToastContext().init(context);
    var url = Uri.parse(ApiController.resetPassURL);
    var response = await http.post(
      url,
      body: {
        'email': email,
        'code': code,
        'password': pass,
        'password_confirmation': conPass
      },
      headers: {HttpHeaders.acceptHeader: 'application/json'},
    );
    if (response.statusCode == 200) {
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
    } else if (response.statusCode == 500) {
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
