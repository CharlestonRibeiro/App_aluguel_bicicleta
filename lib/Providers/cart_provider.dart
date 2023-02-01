import 'package:app_aluguel_bike_modulacao_mvp/Providers/cart_item.dart';
import 'package:flutter/material.dart';

class CartProvider extends InheritedWidget{
  final CartItem cart = CartItem();

  CartProvider({Widget child}): super(child: child);
  static CartProvider of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<CartProvider>();
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}