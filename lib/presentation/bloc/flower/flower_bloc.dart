import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/data/repository/flowerRepository.dart';
import 'flower_event.dart';
import 'flower_state.dart';

class FlowerBloc extends Bloc<FlowerEvent, FlowerState> {
  final FlowerApi flowerApi;

  FlowerBloc({required this.flowerApi}) : super(FlowersInitial()) {
    on<LoadFlowers>(_onLoadFlowers);
  }

  Future<void> _onLoadFlowers(LoadFlowers event, Emitter<FlowerState> emit) async {
    try {
      emit(FlowersLoading());
      final flowers = await flowerApi.getFlowers();
      emit(FlowersLoaded(flowers));
    } catch (error) {
      emit(FlowersError(error.toString()));
    }
  }
}