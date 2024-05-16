import 'package:flutter/material.dart';

import 'package:flutter_application_1/Repository/LoginRep.dart';

import 'package:flutter_application_1/bloc/login_bloc.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController number = TextEditingController();
  GlobalKey<FormState> formstate = GlobalKey();
  final Auth auth = Auth();
  @override
  @override
  void dispose() {
    number.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("login"),
        ),
        body: BlocConsumer<LoginBloc, LoginState>(
          listenWhen: (previous, current) => current is LogininitstateSucsess,
          buildWhen: (previous, current) => current is LogininitstateSucsess,
          listener: (context, state) {
            if (state is LogininitstateSucsess) {
              return context.go('/verify');
            } else if (state is LogininitstateError) {
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
                  child: Form(
                    key: formstate,
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Number !!!!";
                        }
                        return "";
                      },
                      cursorColor: Colors.blueGrey,
                      keyboardType: TextInputType.number,
                      controller: number,
                      decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          focusColor: Colors.amber,
                          hoverColor: Colors.black,
                          contentPadding: EdgeInsets.symmetric(horizontal: 20),
                          fillColor: Colors.blueAccent,
                          hintText: "Enter your Number",
                          hintStyle: TextStyle(color: Colors.blueGrey),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(200)),
                              borderSide: BorderSide(color: Colors.black))),
                    ),
                  ),
                ),
                MaterialButton(
                  height: 90,
                  minWidth: 70,
                  child: Container(
                    color: Color.fromARGB(255, 92, 227, 162),
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: const Text(
                      "Login",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.blueGrey),
                    ),
                  ),
                  onPressed: () async {
                    BlocProvider.of<LoginBloc>(context)
                        .add(SetNumper(number: number.text));

                    if (formstate.currentState!.validate()) {}

                    sharedPreferences!.setString("Number", number.text);
                  },
                ),
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
      Text("Enter your Number to login"),
    ],
  );
}
