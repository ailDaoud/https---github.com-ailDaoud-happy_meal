import 'package:flutter/material.dart';
import 'package:flutter_application_1/Ui/Register.dart';
import 'package:flutter_application_1/bloc/login_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Varity extends StatefulWidget {
  const Varity({super.key});

  @override
  State<Varity> createState() => _Varity();
}

const String otpp = "1111";

class _Varity extends State<Varity> {
  final TextEditingController otp = TextEditingController();
  LoginBloc loginBloc = LoginBloc();
  @override
  void initState()  {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc,LoginState>(
      listener: (context, state) {
        if (state.runtimeType is VarityinitStateSucsess) {
           Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Register(),
              ));
        } else if (state.runtimeType is VarityinitStateError) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Wronge")));
          print(
              "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Wronge")));
        }
      },
      child: Scaffold(
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
              child: TextField(
                cursorColor: Colors.amber,
                keyboardType: TextInputType.number,
                controller: otp,
                decoration: const InputDecoration(
                    hintText: "Enter Otp",
                    border: UnderlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        borderSide: BorderSide(color: Colors.black))),
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
                  SharedPreferences sh = await SharedPreferences.getInstance();
                  String c = sh.get("Number").toString();
                  BlocProvider.of<LoginBloc>(context)
                      .add(SetVarity(number: c, otp: otp.text));
                  SharedPreferences sharedPreferences =
                      await SharedPreferences.getInstance();
                  sharedPreferences.setString("Number", otp.text);
                })
          ],
        ),
      ),
    );
  }
}

/*Scaffold(
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
              child: TextField(
                cursorColor: Colors.amber,
                keyboardType: TextInputType.number,
                controller: otp,
                decoration: const InputDecoration(
                    hintText: "Enter Otp",
                    border: UnderlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        borderSide: BorderSide(color: Colors.black))),
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
                  SharedPreferences sh = await SharedPreferences.getInstance();
                  String c = sh.get("Number").toString();
                  BlocProvider.of<LoginBloc>(context)
                      .add(SetVarity(number: c, otp: otp.text));
                  SharedPreferences sharedPreferences =
                      await SharedPreferences.getInstance();
                  sharedPreferences.setString("Number", otp.text);
                })
          ],
        ),
      ); */
