import 'package:flutter/material.dart';
import 'package:flutter_application_1/Ui/Login/bloc/login_bloc.dart';

import 'package:flutter_application_1/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _Register();
}

class _Register extends State<Register> {
  GlobalKey<FormState> formstate = GlobalKey();
  final TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Final Step",
            style: TextStyle(fontSize: 30.sp),
          ),
          backgroundColor: Colors.greenAccent,
        ),
        body: BlocConsumer<LoginBloc, LoginState>(
          listenWhen: (previous, current) => current is SetNameinitSucsess,
          buildWhen: (previous, current) => current is SetNameinitSucsess,
          listener: (context, state) {
            if (state is SetNameinitSucsess) {
              return context.pushReplacement('/category');
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
                  child: Form(
                    key: formstate,
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Your name !!!!";
                        }
                        if (value.length <= 2) {
                          return "this is to short";
                        }
                        return "";
                      },
                      controller: name,
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
                          hintText: "Enter your Name",
                          hintStyle: TextStyle(color: Colors.blueGrey),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(200)),
                              borderSide: BorderSide(color: Colors.black))),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 14,
                ),
                MaterialButton(
                    child: Container(
                      color: Colors.greenAccent,
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Text(
                        "Login",
                        style: TextStyle(fontSize: 15.sp),
                      ),
                    ),
                    onPressed: () {
                      if (formstate.currentState!.validate()) {}
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
