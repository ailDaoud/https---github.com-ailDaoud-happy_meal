//import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Repository/LoginRep.dart';
import 'package:flutter_application_1/Ui/Splash.dart';
import 'package:flutter_application_1/bloc/login_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
 SharedPreferences? sharedPreferences ;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences=await SharedPreferences.getInstance();
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Fancy Dialog Example',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: Colors.amber),
          useMaterial3: true
        ),
        home: const Splash(),
      ),
    );
  }
}