import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

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
    /*Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginPage()));*/
    //  return context.go('/login');
    return context.pushReplacement('/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Container(
        color: Colors.white,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: CircleAvatar(
                    backgroundColor: Colors.greenAccent,
                    maxRadius: 80,
                    minRadius: 80,
                    child: Image.asset(
                      'images/240_F_330615996_BsfQgJv5i8VZdVaFAblNIeur3V2sRqSS.jpg',
                      fit: BoxFit.fill,
                    )),
              ),
              Center(
                child: Text(
                  "Happy Meal",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 40.sp,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 10,
              ),
            ]),
      ),
    );
  }
}
