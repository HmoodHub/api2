import 'package:api2/bloc/bloc_category/category_cubit.dart';
import 'package:api2/screens/auth/login_screen.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';


class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CategoryCubit bloc = CategoryCubit.get(context);
    return BlocConsumer<CategoryCubit, CategoryState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is Logout) {
          Get.off(
            () => LoginScreen(),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Category'),
            centerTitle: true,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GFButton(
                  onPressed: () {
                    bloc.logout();
                  },
                  text: 'Logout',
                  size: GFSize.LARGE,
                ),
              ],
            ),
          ),
          // How are you ?
        );
      },
    );
  }
}
