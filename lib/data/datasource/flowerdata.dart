import 'package:flutter_project/data/model/flowermodel.dart';
import 'package:flutter_project/data/repository/flowerRepository.dart';

class FlowerDataSource {
    final FlowerApi _flowerApi;

    FlowerDataSource(this._flowerApi);

    Future<List<Flower>> getFlowers() {
        return _flowerApi.getFlowers();
    }
}