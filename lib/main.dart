import 'package:app_aluguel_bike_modulacao_mvp/Providers/cart_item.dart';
import 'package:app_aluguel_bike_modulacao_mvp/Providers/cart_provider.dart';
import 'package:app_aluguel_bike_modulacao_mvp/Screens/bike_details_screen.dart';
import 'package:app_aluguel_bike_modulacao_mvp/Screens/bikes_overview_screen.dart';
import 'package:app_aluguel_bike_modulacao_mvp/Screens/cart_detail_screen.dart';
import 'package:app_aluguel_bike_modulacao_mvp/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CartProvider(
      child: ChangeNotifierProvider(
        create: (context) => CartItem(),
       child:MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BikeOverviewScreen(),
        routes: {
          AppRoutes.BIKE_DETAIL: (context) => BikeDetailsScreen(),
          AppRoutes.CART_DETAIL: (context) => CartDetailScreen(),
        },
      ),
      ),
    );
  }
}
