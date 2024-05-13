import 'package:flutter/material.dart';
import 'package:flutter_application_1/Ui/Register.dart';

import 'package:flutter_application_1/bloc/login_bloc.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';


const String otpp = "1111";
class Varify extends StatefulWidget {

   Varify({super.key});

  @override
  State<Varify> createState() => _VarifyState();
}

class _VarifyState extends State<Varify> {
   GlobalKey<FormState> formstate = GlobalKey();

  final TextEditingController otp = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: BlocConsumer<LoginBloc, LoginState>(
        listenWhen: (previous, current) => current is VarityinitStateSucsess,
        buildWhen: (previous, current) => current is VarityinitStateSucsess,
        listener: (context, state) {
          if (state is VarityinitStateSucsess) {
         return context.go('/register');
            
          } else if (state is VarityinitStateError) {
            print("error^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");
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
                            borderRadius: BorderRadius.all(Radius.circular(50)),
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
                    if (formstate.currentState!.validate()) {}

                    BlocProvider.of<LoginBloc>(context).add(SetVarity(
                        number:
                            sharedPreferences!.getString("Number").toString(),
                        otp: otpp));
                  })
            ]),
      ),
    ); ;
  }
}



/*class Varify extends StatefulWidget {
  const Varify({super.key});

  @override
  State<Varify> createState() => _Varity();
}

const String otpp = "1111";

class _Varity extends State<Varify> {
  GlobalKey<FormState> formstate = GlobalKey();
  final TextEditingController otp = TextEditingController();
  @override
  @override
  void dispose() {
    otp.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: BlocConsumer<LoginBloc, LoginState>(
        listenWhen: (previous, current) => current is VarityinitStateSucsess,
        buildWhen: (previous, current) => current is VarityinitStateSucsess,
        listener: (context, state) {
          if (state is VarityinitStateSucsess) {
            /* Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Register(),
                ));*/
            /*  WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => const Register()));
                });*/
            /*Future.delayed(Duration.zero, () async{
             await Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Register(),
                  ));
            });*/
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => Register()));
            });
          } else if (state is VarityinitStateError) {
            print("error^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");
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
                            borderRadius: BorderRadius.all(Radius.circular(50)),
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
}*/


/*Column(
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
                      if (formstate.currentState!.validate()) {}

                      BlocProvider.of<LoginBloc>(context).add(SetVarity(
                          number:
                              sharedPreferences!.getString("Number").toString(),
                          otp: otpp));
                    })
              ]) */












/* var c=await sharedPreferences!.getString("Number");
                         var dio = Dio();
                        var d = {"phone_number":c , "otp": otpp};
                        var secondRespons = await dio.post(
                          'https://meal-market.com/api/verify_otp',
                          data: jsonEncode(d),
                          options: Options( headers: {
                            HttpHeaders.contentTypeHeader: "application/json",
                          }),
                        );
                        print(secondRespons.data);
                        print("QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQ"); */




    /* BlocBuilder<LoginBloc, LoginState>(
      /*  listenWhen: (previous, current) => current is VarityinitStateSucsess,
      buildWhen: (previous, current) => current is VarityinitStateSucsess,
      listener: (context, state) {
        if (state is VarityinitStateSucsess) {
          WidgetsBinding.instance!.addPostFrameCallback((_) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => const Register()));
          }

              /*   Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Register(),
              ));*/
              );
          /*Future.delayed(Duration.zero, () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => const Register(),));
          });*/
        } else if (State is VarityinitStateError) {
          print("{{{{{{{{{{{{{{{{{{{{{{}}}}}}}}}}}}}}}}}}}}}}");
        }
      },*/
      builder: (context, state) {
        if (state is VarityinitStateSucsess) {
          return const Register();

          /* WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => const Register()));
          });*/
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
                        if (formstate.currentState!.validate()) {}

                        BlocProvider.of<LoginBloc>(context).add(SetVarity(
                            number: sharedPreferences!
                                .getString("Number")
                                .toString(),
                            otp: otpp));
                      })
                ]));
      },
    ); */