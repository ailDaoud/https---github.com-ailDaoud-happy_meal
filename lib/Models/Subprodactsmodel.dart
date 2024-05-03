import 'dart:convert';

class SubProdacts {
  List<Datum> data;

  SubProdacts({
    required this.data,
  });

  factory SubProdacts.fromRawJson(String str) =>
      SubProdacts.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SubProdacts.fromJson(Map<String, dynamic> json) => SubProdacts(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  int id;
  String name;
  String slug;
  String image;
  String price;
  int amount;
  int categoryId;
  int subCategoryId;

  Datum({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
    required this.price,
    required this.amount,
    required this.categoryId,
    required this.subCategoryId,
  });

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        image: json["image"],
        price: json["price"],
        amount: json["amount"],
        categoryId: json["category_id"],
        subCategoryId: json["sub_category_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "image": image,
        "price": price,
        "amount": amount,
        "category_id": categoryId,
        "sub_category_id": subCategoryId,
      };
}
