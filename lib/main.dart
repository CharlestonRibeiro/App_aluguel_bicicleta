import 'package:app_aluguel_bike_modulacao_mvp/Screens/bike_details_screen.dart';
import 'package:app_aluguel_bike_modulacao_mvp/Screens/bikes_overview_screen.dart';
import 'package:app_aluguel_bike_modulacao_mvp/app_routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BikeOverviewScreen(),
      routes: {
        AppRoutes.BIKE_DETAIL: (context) => BikeDetailsScreen(),
      },
    );
  }
}
