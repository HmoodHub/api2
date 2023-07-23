import 'package:api2/bloc/bloc_category/category_cubit.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/getwidget.dart';

import '../bloc/storage_app.dart';
import '../widget/const_app.dart';

class CategoryScreen extends StatelessWidget {

  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CategoryCubit bloc = CategoryCubit.get(context);
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
              },
              text: 'Print User Data',
              size: GFSize.LARGE,
            ),
          ],
        ),
      ),
      // How are you ?
    );
  }

}

