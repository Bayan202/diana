import 'package:json_annotation/json_annotation.dart';

part 'flowermodel.g.dart';

@JsonSerializable()
class Flower {
  int id;
  String image_path;
  String name;
  int price_tg;

  Flower({required this.id, required this.image_path, required this.name, required this.price_tg});

  factory Flower.fromJson(Map<String, dynamic> json) => _$FlowerFromJson(json);
  Map<String, dynamic> toJson() => _$FlowerToJson(this);
}