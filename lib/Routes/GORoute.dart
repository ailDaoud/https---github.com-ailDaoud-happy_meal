import 'package:flutter/material.dart';
import 'package:flutter_application_1/Ui/Categories.dart';
import 'package:flutter_application_1/Ui/LoginPage.dart';
import 'package:flutter_application_1/Ui/Productui.dart';
import 'package:flutter_application_1/Ui/Register.dart';
import 'package:flutter_application_1/Ui/Splash.dart';
import 'package:flutter_application_1/Ui/varify.dart';
import 'package:go_router/go_router.dart';

class Myroute {
  GoRouter router = GoRouter(routes: <GoRoute>[
    GoRoute(
        name: 'Splash',
        path: '/',
        pageBuilder: (context, state) {
          return MaterialPage(child: Splash());
        },
        routes: [
          GoRoute(
            name: 'login',
            path: 'login',
            pageBuilder: (context, state) {
              return MaterialPage(child: LoginPage());
            },
          ),
          GoRoute(
            name: 'varify',
            path: 'verify',
            pageBuilder: (context, state) {
              return MaterialPage(child: Varify());
            },
          ),
          GoRoute(
            name: 'register',
            path: 'register',
            pageBuilder: (context, state) {
              return MaterialPage(child: Register());
            },
          ),
          GoRoute(
            name: 'category',
            path: 'category',
            pageBuilder: (context, state) {
              return MaterialPage(child: CategoriesUiState());
            },
          ),
          GoRoute(
            name: 'product',
            path: 'product',
            pageBuilder: (context, state) {
              return MaterialPage(child: ProdactUi());
            },
          ),
        ]),
    /* GoRoute(
      name: 'login',
      path: '/login',
      pageBuilder: (context, state) {
        return MaterialPage(child: LoginPage());
      },
    ),
    GoRoute(
      name: '/varify',
      path: 'verify',
      pageBuilder: (context, state) {
        return MaterialPage(child: Varify());
      },
    ),
    GoRoute(
      name: '/register',
      path: 'register',
      pageBuilder: (context, state) {
        return MaterialPage(child: Register());
      },
    )*/
  ]);
}
