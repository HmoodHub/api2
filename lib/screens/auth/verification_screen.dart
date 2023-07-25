import 'package:api2/bloc/bloc_forget_pass/forget_password_cubit.dart';
import 'package:api2/bloc/bloc_login/login_cubit.dart';
import 'package:api2/bloc/bloc_verification/verification_code_cubit.dart';
import 'package:api2/widget/wedget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/getwidget.dart';

import '../category_screen.dart';

class VerificationCodeScreen extends StatelessWidget {
  VerificationCodeScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    VerificationCodeCubit bloc = VerificationCodeCubit.get(context);
    return BlocConsumer<VerificationCodeCubit, VerificationCodeState>(
      listener: (context, state) {
        if (state is ForgetPasswordSuccess) {}
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Verification Code'),
            centerTitle: true,
          ),
          body: Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.all(15),
              children: [
                Text(
                  'Verification',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text('Enter valid code....',
                    style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(
                  height: 30,
                ),
                 Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: bloc.field1,
                        focusNode: bloc.code1,
                        maxLength: 1,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)
                          ),
                          hintText: "0",
                          counterText: ''
                        ),
                        onChanged: (value) {
                          if(value.isNotEmpty){
                            bloc.code2.requestFocus();
                          }
                        },
                      ),
                    ),
                    const SizedBox(width: 5,),
                    Expanded(
                      child: TextField(
                        controller: bloc.field2,
                        focusNode: bloc.code2,
                        maxLength: 1,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)
                          ),
                          hintText: "0",
                          counterText: ''
                        ),
                        onChanged: (value) {
                          value.isNotEmpty?
                          bloc.code3.requestFocus(): bloc.code1.requestFocus();
                        },
                      ),
                    ),
                    const SizedBox(width: 5,),
                    Expanded(
                      child: TextField(
                        controller: bloc.field3,
                        focusNode: bloc.code3,
                        maxLength: 1,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5)
                            ),
                            hintText: "0",
                            counterText: ''
                        ),
                        onChanged: (value) {
                          value.isNotEmpty?
                            bloc.code4.requestFocus(): bloc.code2.requestFocus();

                        },
                      ),
                    ),
                    const SizedBox(width: 5,),
                    Expanded(
                      child: TextField(
                        controller: bloc.field4,
                        focusNode: bloc.code4,
                        maxLength: 1,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5)
                            ),
                            hintText: "0",
                            counterText: ''
                        ),
                        onChanged: (value) {
                          if(value.isEmpty){
                            bloc.code3.requestFocus();
                          }
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                GFButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                     return;
                    }
                  },
                  text: 'Verification',
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
