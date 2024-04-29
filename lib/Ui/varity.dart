import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Varity extends StatefulWidget {
  const Varity({super.key});

  @override
  State<Varity> createState() => _Varity();
}

class _Varity extends State<Varity> {
  final TextEditingController otp = TextEditingController();
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
              controller: otp,
              decoration: const InputDecoration(
                  hintText: "Enter Otp",
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
                child: const Text("Send"),
              ),
              onPressed: () async {
//           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage(),));
              })
        ],
      ),
    );
  }
}
