import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Repository/LoginRep.dart';
import 'package:flutter_application_1/Ui/varify.dart';
import 'package:flutter_application_1/bloc/login_bloc.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_connect/http/src/response/response.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController number = TextEditingController();
  GlobalKey<FormState> formstate = GlobalKey();
  //=LoginBloc(Auth());
  final Auth auth = Auth();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    number.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        if (state is LoginInitial) {
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
                        if (value!.isEmpty) {
                          return "Enter Number !!!!";
                        }
                        return "";
                      },
                      cursorColor: Colors.amber,
                      keyboardType: TextInputType.number,
                      controller: number,
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 20),
                          fillColor: Colors.blueAccent,
                          hintText: "Enter your Number",
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
                      child: const Text(
                        "Login",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white54),
                      ),
                    ),
                    onPressed: () async {
                      BlocProvider.of<LoginBloc>(context)
                          .add(SetNumper(number: number.text));
                          var category = await Dio().get('https://meal-market.com/api/home');
                          print(category.data["data"]);
                          print("ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZz");
                      if (formstate.currentState!.validate()) {}

                      sharedPreferences!.setString("Number", number.text);
                    }),
              ],
            ),
          );
        } else if (state is LogininitstateSucsess) {
          setState(() {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Varify(),
                ));
          });
        }
        return const Text(
          "wronge ",
          style: TextStyle(fontSize: 40),
        );
      },
    );
  }
}
