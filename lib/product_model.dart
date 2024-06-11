import 'package:meta/meta.dart';
import 'dart:convert';

class ProductModel {
  final int id;
  final String proName;
  final int price;
  final int catId;
  final int isDeleted;

  ProductModel({
    required this.id,
    required this.proName,
    required this.price,
    required this.catId,
    required this.isDeleted,
  });

  ProductModel copyWith({
    int? id,
    String? proName,
    int? price,
    int? catId,
    int? isDeleted,
  }) =>
      ProductModel(
        id: id ?? this.id,
        proName: proName ?? this.proName,
        price: price ?? this.price,
        catId: catId ?? this.catId,
        isDeleted: isDeleted ?? this.isDeleted,
      );

  factory ProductModel.fromRawJson(String str) =>
      ProductModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        proName: json["pro_name"],
        price: json["price"],
        catId: json["cat_id"],
        isDeleted: json["is_deleted"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "pro_name": proName,
        "price": price,
        "cat_id": catId,
        "is_deleted": isDeleted,
      };
}
