import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/Ui/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  String? fuser;
  String? femail;
  @override
  void initState() {
    super.initState();
    splashh();
  }

  splashh() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Happy Meal",
                style: TextStyle(
                  color: Colors.amber[600],
                  fontSize: 40,
                ),
              ),
            ),
            const Center(
              child: CircularProgressIndicator(
                color: Colors.amber,
                backgroundColor: Colors.white,
              ),
            )
          ]),
    );
  }
}
