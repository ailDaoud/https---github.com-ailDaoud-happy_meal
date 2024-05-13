import 'dart:convert';

class GetProdactsByid {
  List<Datumm> data;

  GetProdactsByid({
    required this.data,
  });

  factory GetProdactsByid.fromRawJson(String str) =>
      GetProdactsByid.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GetProdactsByid.fromJson(Map<String, dynamic> json) =>
      GetProdactsByid(
        data: List<Datumm>.from(json["data"].map((x) => Datumm.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datumm {
  int id;
  String name;
  List<Product> products;

  Datumm({
    required this.id,
    required this.name,
    required this.products,
  });

  factory Datumm.fromRawJson(String str) => Datumm.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datumm.fromJson(Map<String, dynamic> json) => Datumm(
        id: json["id"],
        name: json["name"],
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class Product {
  int id;
  String name;
  String slug;
  String image;
  String price;
  int amount;
  int categoryId;
  int subCategoryId;

  Product({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
    required this.price,
    required this.amount,
    required this.categoryId,
    required this.subCategoryId,
  });

  factory Product.fromRawJson(String str) => Product.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Product.fromJson(Map<String, dynamic> json) => Product(
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
