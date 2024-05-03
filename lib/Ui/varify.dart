import 'package:flutter/material.dart';
import 'package:flutter_application_1/Ui/Register.dart';

import 'package:flutter_application_1/bloc/login_bloc.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Varify extends StatefulWidget {
  const Varify({super.key});

  @override
  State<Varify> createState() => _Varity();
}

const String otpp = "1111";

class _Varity extends State<Varify> {
  GlobalKey<FormState> formstate = GlobalKey();
  final TextEditingController otp = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    otp.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listenWhen: (previous, current) => current is VarityinitStateSucsess,
      listener: (context, state) {
        if (state is VarityinitStateSucsess) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Register(),
              ));
        } else if (State is VarityinitStateError) {
          print("{{{{{{{{{{{{{{{{{{{{{{}}}}}}}}}}}}}}}}}}}}}}");
        }
      },
      builder: (context, state) {
        if (state is VarityinitStateSucsess) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Register()));
        } else if (state is VarityinitStateError) {
          return const Text("Wrong With Varifyy");
        }
        return Scaffold(
            appBar: AppBar(
              title: const Text(
                "Happy Meal",
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.amber,
            ),
            body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Form(
                      key: formstate,
                      child: TextFormField(
                        validator: (value) {
                          if (value!.length < 4 || value.length > 4) {
                            return "otp shold be four digits";
                          }
                          return "";
                        },
                        cursorColor: Colors.amber,
                        keyboardType: TextInputType.number,
                        controller: otp,
                        decoration: const InputDecoration(
                            hintText: "Enter Otp",
                            border: UnderlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                borderSide: BorderSide(color: Colors.black))),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  MaterialButton(
                      child: Container(
                        color: Colors.amber,
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: const Text("Send"),
                      ),
                      onPressed: () async {
                        //             if (formstate.currentState!.validate()) {}

                        BlocProvider.of<LoginBloc>(context).add(SetVarity(
                            number: await sharedPreferences!
                                .getString("Number")
                                .toString(),
                            otp: otpp));
                      })
                ]));
      },
    );
  }
}
