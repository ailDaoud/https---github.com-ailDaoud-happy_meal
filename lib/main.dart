//import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Ui/Category/bloc/category_bloc.dart';
import 'package:flutter_application_1/Ui/SubCategory/bloc/content_bloc.dart';
import 'package:flutter_application_1/Ui/Login/bloc/login_bloc.dart';
import 'package:flutter_application_1/Ui/Product/bloc/product_bloc.dart';
import 'package:flutter_application_1/Routes/GORoute.dart';



import 'package:flutter_application_1/consts/app_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        ),
        BlocProvider(
          create: (context) => ProductBloc(),
        )
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Happy meal',
          theme: Style.themeData(isdark, context),
          // home: const Splash(),
          routerConfig: Myroute().router,
        ),
      ),
    );
  }
}
