import 'package:flutter/material.dart';

import 'package:flutter_application_1/bloc/login_bloc.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  OtpFieldController otpController = OtpFieldController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Text("Verify"),
      ),
      body: BlocConsumer<LoginBloc, LoginState>(
        listenWhen: (previous, current) => current is VarityinitStateSucsess,
        buildWhen: (previous, current) => current is VarityinitStateSucsess,
        listener: (context, state) {
          if (state is VarityinitStateSucsess) {
            return context.go('/register');
          } else if (state is VarityinitStateError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Some thing Wrong")));
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
                      onCompleted: (pin) {}),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              MaterialButton(
                  child: Container(
                    color: Colors.greenAccent,
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: const Text("Send"),
                  ),
                  onPressed: () async {
                    if (formstate.currentState!.validate()) {}

                    BlocProvider.of<LoginBloc>(context).add(SetVarity(
                        number:
                            sharedPreferences!.getString("Number").toString(),
                        otp: otpp));
                  })
            ]),
      ),
    );
  }
}
