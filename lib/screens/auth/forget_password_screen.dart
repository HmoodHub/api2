import 'package:api2/bloc/bloc_forget_pass/forget_password_cubit.dart';
import 'package:api2/bloc/bloc_login/login_cubit.dart';
import 'package:api2/screens/auth/verification_screen.dart';
import 'package:api2/widget/wedget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/getwidget.dart';

import '../category_screen.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ForgetPasswordCubit bloc = ForgetPasswordCubit.get(context);
    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
        if (state is ForgetPasswordSuccess) {
          Get.to(VerificationCodeScreen(),arguments: {'email' : bloc.emailController.text});
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Forget Password'),
            centerTitle: true,
          ),
          body: Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.all(15),
              children: [
                Text(
                  'Hello',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text('Enter E-mail to Reset Password....',
                    style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(
                  height: 30,
                ),
                textFormFieldApp(
                  controller: bloc.emailController,
                  type: TextInputType.emailAddress,
                  hint: 'E-mail',
                  prefixIcon: Icons.email,
                ),
                const SizedBox(
                  height: 40,
                ),
                GFButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      bloc.resetPassword(context);
                    }
                  },
                  text: 'Send',
                  size: GFSize.LARGE,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
