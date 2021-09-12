import 'package:app_aluguel_bike_modulacao_mvp/Components/bike_grid_item.dart';
import 'package:app_aluguel_bike_modulacao_mvp/Mocks/mocks_bike.dart';
import 'package:app_aluguel_bike_modulacao_mvp/Models/bike.dart';
import 'package:app_aluguel_bike_modulacao_mvp/Providers/cart_item.dart';
import 'package:app_aluguel_bike_modulacao_mvp/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        backgroundColor: Colors.black87,
        actions: [
          IconButton(
              icon: Icon(Icons.pedal_bike),
              onPressed:(){
                Navigator.of(context).pushNamed(AppRoutes.CART_DETAIL);
              }),
          Consumer<CartItem>(
              builder: (context, cartItem, _) => Text(cartItem.total.toString()),
          ),
          SizedBox(
            width: 22,
          )
        ],
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
