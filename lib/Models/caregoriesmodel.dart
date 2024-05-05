// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Categoryy {
  Data? data;
  Categoryy({
   this.data,
  });

  
  factory Categoryy.fromRawJson(String str) =>
      Categoryy.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Categoryy.fromJson(Map<String, dynamic> json) => Categoryy(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
      };
}

class Data {
  List<Category> categories;
  List<Category> offers;
  List<Category> companies;
  List<dynamic> bestSellings;
  List<dynamic> addresses;

  Data({
    required this.categories,
    required this.offers,
    required this.companies,
    required this.bestSellings,
    required this.addresses,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
        offers: List<Category>.from(
            json["offers"].map((x) => Category.fromJson(x))),
        companies: List<Category>.from(
            json["companies"].map((x) => Category.fromJson(x))),
        bestSellings: List<dynamic>.from(json["best_sellings"].map((x) => x)),
        addresses: List<dynamic>.from(json["addresses"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "offers": List<dynamic>.from(offers.map((x) => x.toJson())),
        "companies": List<dynamic>.from(companies.map((x) => x.toJson())),
        "best_sellings": List<dynamic>.from(bestSellings.map((x) => x)),
        "addresses": List<dynamic>.from(addresses.map((x) => x)),
      };
}

class Category {
  int id;
  String name;
  String image;

  Category({
    required this.id,
    required this.name,
    required this.image,
  });

  factory Category.fromRawJson(String str) =>
      Category.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
      };
}
