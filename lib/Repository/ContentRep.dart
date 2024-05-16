import 'package:dio/dio.dart';
import 'package:flutter_application_1/Models/Prodactmodel.dart';
import 'package:flutter_application_1/Models/Subprodactsmodel.dart';
import 'package:flutter_application_1/Models/caregoriesmodel.dart';


import 'package:flutter_application_1/main.dart';

class ContantRep {
  Future<Categoryy> fetchcategories() async {
    Dio dio = Dio();

    try {
      var response = await dio.get('https://meal-market.com/api/home');
      Categoryy categoryy = Categoryy.fromJson(response.data);
      //  print(response.data);
      // print("::::::::::::::::::::::::::::::::::::::::::::");
      return categoryy;
    } on DioException catch (e) {
      print(e);
      return Categoryy();
    }
  }

  Future<List<Datum>> fetchsubcategories(int id) async {
    Dio dio = Dio();
    id = sharedPreferences!.getInt("catid") ?? 2;
    try {
      var response = await dio
          .get('https://meal-market.com/api/products/subcategory/1?page=$id');
      SubProdacts subProdacts = SubProdacts.fromJson(response.data);
      List<Datum> res = subProdacts.data.toList();
      return res;
    } on DioException catch (e) {
      return [];
    }
  }
   Future<GetProdacts>fetchproduct(int id)async{
    Dio dio =Dio();
    id=sharedPreferences!.getInt("proid")??0;
    try{
      var response=await dio.get('https://meal-market.com/api/products/$id');
      GetProdacts getProdacts=GetProdacts.fromJson(response.data);
      return getProdacts;
    }
    on DioException catch(e){
      return GetProdacts();
    }
  }
}
