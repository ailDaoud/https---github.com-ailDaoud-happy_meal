import 'package:flutter/material.dart';

import 'package:flutter_application_1/bloc/login_bloc.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _Register();
}

class _Register extends State<Register> {
  final TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(""),
          backgroundColor: Colors.greenAccent,
        ),
        body: BlocConsumer<LoginBloc, LoginState>(
          listenWhen: (previous, current) => current is SetNameinitSucsess,
          buildWhen: (previous, current) => current is SetNameinitSucsess,
          listener: (context, state) {
            if (state is SetNameinitSucsess) {
              return context.go('/category');
            } else {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text("Some thing Wrong")));
            }
          },
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _header(context),
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
                      color: Colors.greenAccent,
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

_header(context) {
  return const Column(
    children: [
      Text(
        "Welcome To Happy Meal",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      Text("Set Your Name"),
    ],
  );
}
