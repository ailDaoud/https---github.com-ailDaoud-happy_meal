//import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Routes/GORoute.dart';
import 'package:flutter_application_1/Ui/Register.dart';
import 'package:flutter_application_1/Ui/Splash.dart';
import 'package:flutter_application_1/bloc/bloc/category_bloc.dart';
import 'package:flutter_application_1/bloc/content_bloc.dart';
import 'package:flutter_application_1/bloc/login_bloc.dart';
import 'package:flutter_application_1/consts/app_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? sharedPreferences;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final bool isdark = false;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) => ContentBloc(),
        ),
        BlocProvider(
          create: (context) => CategoryBloc(),
        )
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Fancy Dialog Example',
        theme: Style.themeData(isdark, context),
       // home: const Splash(),
       routerConfig: Myroute().router,
      ),
    );
  }
}
