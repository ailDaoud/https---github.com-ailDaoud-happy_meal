import 'package:flutter/material.dart';
import 'package:flutter_application_1/Repository/LoginRep.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _Register();
}

class _Register extends State<Register> {
  final TextEditingController number = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: number,
              decoration: const InputDecoration(
                  hintText: "Enter your number",
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
              onPressed: () async {
                SharedPreferences sharedPreferences =
                    await SharedPreferences.getInstance();
                sharedPreferences.setString("Number", number.text);
              })
        ],
      ),
    );
  }
}
