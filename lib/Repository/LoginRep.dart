import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter_application_1/Models/loginmodel.dart';
import 'package:get/get.dart';

const String baseurl = 'https://meal-market.com/api/';

class Auth {
   static Future<bool> fetchotp(String number) async {
    var dio = Dio();
    var d = {"phone_number": number};
    try {
      var firstRespons = await dio.post(
        'https://meal-market.com/api/request_otp',
        data: jsonEncode(d),
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        }),
      );
      if (firstRespons.statusCode == 200 && firstRespons.statusCode! < 300) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
    
  }

  static Future<bool> setotp(String number, String otp) async {
    var dio = Dio();
    var d = {"phone_number": number, "otp": otp};
    try {
      var secondRespons = await dio.post(
        'https://meal-market.com/api/verify_otp',
        data: jsonEncode(d),
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        }),
      );

      if (secondRespons.statusCode == 200 && secondRespons.statusCode! < 300) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
