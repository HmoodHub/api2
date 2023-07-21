import 'package:api2/bloc/bloc_category/category_cubit.dart';
import 'package:api2/bloc/bloc_login/login_cubit.dart';
import 'package:api2/bloc/bloc_register/register_cubit.dart';
import 'package:api2/screens/auth/login_screen.dart';
import 'package:api2/widget/const_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'bloc/bloc_obsearvable.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await GetStorage.init();
  runApp(const MyApp());
  Future.delayed(const Duration(seconds: 5),(){
    print(token);
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
          create: (context) => CategoryCubit()..initCategory(),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
      ),
    );
  }
}
