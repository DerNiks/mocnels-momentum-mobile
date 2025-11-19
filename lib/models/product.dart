import 'dart:convert';

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  String model;
  int pk;
  Fields fields;

  Product({required this.model, required this.pk, required this.fields});

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    model: json["model"],
    pk: json["pk"],
    fields: Fields.fromJson(json["fields"]),
  );

  Map<String, dynamic> toJson() => {
    "model": model,
    "pk": pk,
    "fields": fields.toJson(),
  };
}

class Fields {
  int user;
  String name;
  int price;
  String description;
  String category;
  int stock;
  bool isFeatured;
  String brand;
  String thumbnail;
  DateTime createdAt;

  Fields({
    required this.user,
    required this.name,
    required this.price,
    required this.description,
    required this.category,
    required this.stock,
    required this.isFeatured,
    required this.brand,
    required this.thumbnail,
    required this.createdAt,
  });

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
    user: json["user"],
    name: json["name"],
    price: json["price"],
    description: json["description"],
    category: json["category"],
    stock: json["stock"],
    isFeatured: json["is_featured"],
    brand: json["brand"],
    thumbnail: json["thumbnail"],
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "user": user,
    "name": name,
    "price": price,
    "description": description,
    "category": category,
    "stock": stock,
    "is_featured": isFeatured,
    "brand": brand,
    "thumbnail": thumbnail,
    "created_at": createdAt.toIso8601String(),
  };
}
