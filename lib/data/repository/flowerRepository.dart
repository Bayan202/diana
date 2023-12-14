import 'package:flutter_project/data/model/flowermodel.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';


part 'flowerRepository.g.dart';

@RestApi(baseUrl: "https://flower-c1a36-default-rtdb.firebaseio.com/")
abstract class FlowerApi {
  factory FlowerApi(Dio dio, {String baseUrl}) = _FlowerApi;

  @GET("/flowers.json")
  Future<List<Flower>> getFlowers();
}