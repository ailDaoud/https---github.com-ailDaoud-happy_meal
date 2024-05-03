import 'package:flutter/material.dart';

import 'package:flutter_application_1/Ui/Homepage.dart';
import 'package:flutter_application_1/bloc/login_bloc.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _Register();
}

class _Register extends State<Register> {
  final TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        if (state is SetNameinitSucsess) {
          return const Home();
        } else if (state is SetNameNameError) {
          return const Text("Wrong With Varifyy");
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: name,
                decoration: const InputDecoration(
                    hintText: "Enter your name",
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black))),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            MaterialButton(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: const Text("Login"),
                ),
                onPressed: () {
                  BlocProvider.of<LoginBloc>(context)
                      .add(SetName(name: name.text));
                  sharedPreferences!.setString("name", name.text);
                })
          ],
        );
      },
    ));
  }
}
