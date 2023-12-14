import 'package:flutter_project/data/model/flowermodel.dart';

abstract class FlowerState {}

class FlowersInitial extends FlowerState {}

class FlowersLoading extends FlowerState {}

class FlowersLoaded extends FlowerState {
  final List<Flower> flowers;

  FlowersLoaded(this.flowers);
}

class FlowersError extends FlowerState {
  final String message;

  FlowersError(this.message);
}