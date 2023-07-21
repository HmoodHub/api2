import 'package:api2/bloc/bloc_login/login_cubit.dart';
import 'package:api2/widget/wedget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/getwidget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    LoginCubit bloc = LoginCubit.get(context);
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {}
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Login'),
            centerTitle: true,
          ),
          body: Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.all(15),
              children: [
                Text(
                  'Welcome back',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text('Enter data to Login....',
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
                  height: 10,
                ),
                textFormFieldApp(
                  controller: bloc.passController,
                  type: TextInputType.visiblePassword,
                  hint: 'Password',
                  // onSubmit: (p0) => bloc.login(),
                  prefixIcon: Icons.lock,
                  suffix:
                      bloc.isVisible ? Icons.visibility_off : Icons.visibility,
                  obscureText: bloc.obscureText,
                  onPressedSuffix: () => bloc.visibilityPass(),
                ),
                const SizedBox(
                  height: 40,
                ),
                GFButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      bloc.loginApp(context);
                    }
                  },
                  text: 'Login',
                  size: GFSize.LARGE,
                ),
                const SizedBox(
                  height: 10,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Don\'t have an account?',
                    style: const TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: ' Create now',
                        style: const TextStyle(color: Colors.blue),
                        recognizer: bloc.recognizer,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
