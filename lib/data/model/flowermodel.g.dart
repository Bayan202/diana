// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flowermodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Flower _$FlowerFromJson(Map<String, dynamic> json) => Flower(
      id: json['id'] as int,
      image_path: json['image_path'] as String,
      name: json['name'] as String,
      price_tg: json['price_tg'] as int,
    );

Map<String, dynamic> _$FlowerToJson(Flower instance) => <String, dynamic>{
      'id': instance.id,
      'image_path': instance.image_path,
      'name': instance.name,
      'price_tg': instance.price_tg,
    };
