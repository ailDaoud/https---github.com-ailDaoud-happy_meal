import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Ui/Login/bloc/login_bloc.dart';

import 'package:flutter_application_1/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

const String otpp = "1111";

class Varify extends StatefulWidget {
  Varify({super.key});

  @override
  State<Varify> createState() => _VarifyState();
}

class _VarifyState extends State<Varify> {
  GlobalKey<FormState> formstate = GlobalKey();

  final TextEditingController otp = TextEditingController();
  final OtpFieldController otpController = OtpFieldController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Text(
          "Verify",
          style: TextStyle(fontSize: 30.sp),
        ),
      ),
      body: BlocConsumer<LoginBloc, LoginState>(
        //   listenWhen: (previous, current) => current is VarityinitStateSucsess,
        buildWhen: (previous, current) => current is VarityinitStateError,
        listener: (context, state) {
          if (state is VarityinitStateSucsess) {
            return context.go('/register');
          } else if (state is VarityinitStateError) {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.infoReverse,
              headerAnimationLoop: true,
              animType: AnimType.bottomSlide,
              title: 'Something wrong',
              reverseBtnOrder: true,
              btnOkOnPress: () {},
              btnCancelOnPress: () {},
              desc: 'Wrong otp',
            ).show();
          }
        },
        builder: (context, state) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Form(
                  key: formstate,
                  child: OTPTextField(
                      controller: otpController,
                      length: 4,
                      width: MediaQuery.of(context).size.width,
                      textFieldAlignment: MainAxisAlignment.spaceAround,
                      fieldWidth: 45,
                      fieldStyle: FieldStyle.box,
                      outlineBorderRadius: 15,
                      style: TextStyle(fontSize: 17),
                      onChanged: (pin) {},
                      onCompleted: (pin) {
                        sharedPreferences!.setString("otp", pin);
                      }),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 10,
              ),
              MaterialButton(
                  child: Container(
                    color: Colors.greenAccent,
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      "Send",
                      style: TextStyle(fontSize: 15.sp),
                    ),
                  ),
                  onPressed: () async {
                    if (formstate.currentState!.validate()) {}

                    BlocProvider.of<LoginBloc>(context).add(SetVarity(
                        number:
                            sharedPreferences!.getString("Number").toString(),
                        otp: otpController.toString()));
                  })
            ]),
      ),
    );
  }
}
