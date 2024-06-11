import 'package:meta/meta.dart';
import 'dart:convert';

class ShirtModel {
  final String name;
  final int price;
  final String img;
  final String id;

  ShirtModel({
    required this.name,
    required this.price,
    required this.img,
    required this.id,
  });

  ShirtModel copyWith({
    String? name,
    int? price,
    String? img,
    String? id,
  }) =>
      ShirtModel(
        name: name ?? this.name,
        price: price ?? this.price,
        img: img ?? this.img,
        id: id ?? this.id,
      );

  factory ShirtModel.fromRawJson(String str) =>
      ShirtModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ShirtModel.fromJson(Map<String, dynamic> json) => ShirtModel(
        name: json["name"],
        price: json["price"],
        img: json["img"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "price": price,
        "img": img,
        "id": id,
      };
}
