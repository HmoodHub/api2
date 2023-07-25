import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'verification_code_state.dart';

class VerificationCodeCubit extends Cubit<VerificationCodeState> {
  VerificationCodeCubit() : super(VerificationCodeInitial());

  static VerificationCodeCubit get(context) => BlocProvider.of<VerificationCodeCubit>(context);

  late TextEditingController field1;
  late TextEditingController field2;
  late TextEditingController field3;
  late TextEditingController field4;
  late FocusNode code1;
  late FocusNode code2;
  late FocusNode code3;
  late FocusNode code4;

  void initVerificationScreen(){
    field1 = TextEditingController();
    field4 = TextEditingController();
    field3 = TextEditingController();
    field2 = TextEditingController();
    code4 = FocusNode();
    code3 = FocusNode();
    code2 = FocusNode();
    code1 = FocusNode();
    emit(VerificationCodeInitial());
  }
}
