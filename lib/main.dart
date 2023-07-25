import 'package:api2/bloc/bloc_category/category_cubit.dart';
import 'package:api2/bloc/bloc_forget_pass/forget_password_cubit.dart';
import 'package:api2/bloc/bloc_login/login_cubit.dart';
import 'package:api2/bloc/bloc_register/register_cubit.dart';
import 'package:api2/bloc/bloc_verification/verification_code_cubit.dart';
import 'package:api2/prefs/sheared_pref_controller.dart';
import 'package:api2/screens/auth/login_screen.dart';
import 'package:api2/screens/category_screen.dart';
import 'package:api2/widget/const_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';


import 'bloc/bloc_obsearvable.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await SharedPrfController().initPref();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Hello
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegisterCubit()..initState(),
        ),
        BlocProvider(
          create: (context) => LoginCubit()..initState(),
        ),
        BlocProvider(
          create: (context) => CategoryCubit()..init(),
        ),
        BlocProvider(
          create: (context) => ForgetPasswordCubit()..initForgetScreen()
        ),
        BlocProvider(
            create: (context) => VerificationCodeCubit()..initVerificationScreen()
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: SharedPrfController().loggedIn ? const CategoryScreen() : LoginScreen(),
      ),
    );
  }
}
