import 'package:app_aluguel_bike_modulacao_mvp/Components/bike_grid_item.dart';
import 'package:app_aluguel_bike_modulacao_mvp/Mocks/mocks_bike.dart';
import 'package:app_aluguel_bike_modulacao_mvp/Models/bike.dart';
import 'package:flutter/material.dart';

class BikeOverviewScreen extends StatefulWidget {
  @override
  _BikeOverviewScreenState createState() => _BikeOverviewScreenState();
}

class _BikeOverviewScreenState extends State<BikeOverviewScreen> {

  final List<Bike> bikes = MOCK_BIKES;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aluguel de Bikes'),
        centerTitle: true,
        backgroundColor: Colors.black87,
      ),
      body: GridView.builder(
          itemCount: bikes.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 3 / 2,
          ),
          itemBuilder: (context, index){
            return BikeGridItem(bikes[index]);
          }),
    );
  }
}
