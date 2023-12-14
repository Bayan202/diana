import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/data/repository/flowerRepository.dart';
import 'package:flutter_project/presentation/bloc/flower/flower_bloc.dart';
import 'package:flutter_project/presentation/bloc/flower/flower_event.dart';
import 'package:flutter_project/presentation/bloc/flower/flower_state.dart';
import 'package:flutter_project/presentation/widget/cardwidget.dart';


class FlowersGridPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => FlowerBloc(flowerApi: FlowerApi(Dio()))..add(LoadFlowers()),
        child: BlocBuilder<FlowerBloc, FlowerState>(
          builder: (context, state) {
            if (state is FlowersLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is FlowersLoaded) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemCount: state.flowers.length,
                itemBuilder: (context, index) {
                  return FlowerCard(flower: state.flowers[index]);
                },
              );
            } else if (state is FlowersError) {
              return Center(child: Text('Ошибка: ${state.message}'));
            }
            return Center(child: Text('Начните загрузку цветов'));
          },
        ),
      ),
    );
  }
}