import 'package:app_aluguel_bike_modulacao_mvp/Models/bike.dart';
import 'package:flutter/material.dart';

class CartItem with ChangeNotifier{
  List<Bike> _bikes = [];
  List<Bike> get bikes => [..._bikes];

  int get total => _bikes.length;

  void addBike(Bike bike){
    _bikes.add(bike);
    notifyListeners();
  }

  void removeBike(Bike bike){
    _bikes.remove(bike);
    notifyListeners();
  }
}