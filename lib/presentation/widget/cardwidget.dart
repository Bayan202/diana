import 'package:flutter/material.dart';
import 'package:flutter_project/data/model/flowermodel.dart';

class FlowerCard extends StatelessWidget {
  final Flower flower;

  FlowerCard({required this.flower});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0, 
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0), 
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)), 
              child: Image.asset(flower.image_path, fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              flower.name, 
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red, 
                fontSize: 18.0,
              )
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
            child: Text(
              '${flower.price_tg} тг.',
              style: TextStyle(color: Colors.pink), 
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.red, 
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onPressed: () {
              },
              child: Text('Купить'),
            ),
          ),
        ],
      ),
    );
  }
}