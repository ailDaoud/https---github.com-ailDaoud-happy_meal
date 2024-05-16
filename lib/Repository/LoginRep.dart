import 'dart:convert';

import 'dart:io';

import 'package:dio/dio.dart';

import 'package:flutter_application_1/main.dart';

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
    var c = await sharedPreferences!.getString("Number");
    var d = {"phone_number": c, "otp": "1111"};

    try {
      var secondRespons = await dio.post(
        'https://meal-market.com/api/verify_otp',
        data: jsonEncode(d),
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        }),
      );

      if (secondRespons.statusCode == 200 && secondRespons.statusCode! < 300) {
        sharedPreferences?.setString(
            "token", secondRespons.data["data"]["token"]);

        return true;
      } else {
        return false;
      }
    } on DioException catch (e) {
      print(e);
      return false;
    }
  }

  static Future<bool> setname(String name) async {
    var dio = Dio();
    var token = await sharedPreferences?.getString("token");
    var d = {"name": name};
    try {
      var thirdresponse = await dio.post(
        'https://meal-market.com/api/submit_name',
        data: jsonEncode(d),
        options: Options(headers: {
          'Authorization': 'Bearer $token',
          HttpHeaders.contentTypeHeader: "application/json",
        }),
      );
      if (thirdresponse.statusCode == 200 || thirdresponse.statusCode! < 305) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
