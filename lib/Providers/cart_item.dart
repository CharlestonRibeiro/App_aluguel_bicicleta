import 'package:app_aluguel_bike_modulacao_mvp/Models/bike.dart';
import 'package:flutter/material.dart';

class CartItem with ChangeNotifier{
  List<Bike> _bikes = [];
  List<Bike> get bikes => [..._bikes];
  int get total => _bikes.length;

  String resposta = "";
  double somaTotal = 0;


  addBike(Bike bike){
    if (!_bikes.contains(bike)) {
        _bikes.add(bike);
        notifyListeners();
        resposta = "Otima escolha";
    }else{
      resposta = "Item já selecionado!";
    }
    return resposta;
  }

  void removeBike(Bike bike){
    _bikes.remove(bike);
    notifyListeners();
  }

  void sumPrice(Bike bike){
    somaTotal += bike.preco;
    notifyListeners();
  }

  void mPrice(Bike bike){
    somaTotal -= bike.preco;
    notifyListeners();
  }


}

