import 'package:app_aluguel_bike_modulacao_mvp/Models/bike.dart';
import 'package:app_aluguel_bike_modulacao_mvp/Providers/cart_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app_routes.dart';

class BikeDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Bike bike = ModalRoute.of(context).settings.arguments as Bike;
    var cartProvider = Provider.of<CartItem>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(
          '${bike.nome}',
          style: TextStyle(color: Colors.black87),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image(
              image: CachedNetworkImageProvider(bike.imagemURL),
              fit: BoxFit.cover,
            ),
            Text('${bike.nome}', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                          text: '${bike.descricao}',
                          style: TextStyle(color: Colors.black87)))),
            ),
            ElevatedButton.icon(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.black87)
              ),
                onPressed: () {
                 cartProvider.addBike(bike);
                 Navigator.of(context).pushNamed(AppRoutes.CART_DETAIL);
                },
                icon:Icon(Icons.shopping_cart),
                label: Text('Alugar Bike'))
          ],
        ),
      ),
    );
  }
}
