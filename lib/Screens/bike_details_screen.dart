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
          style: TextStyle(fontSize: 16),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.pedal_bike),
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.CART_DETAIL);
              }),
          Consumer<CartItem>(
            builder: (context, cartItem, _) => Text(cartItem.total.toString()),
          ),
          SizedBox(
            width: 18,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image(
              image: CachedNetworkImageProvider(bike.imagemURL),
              fit: BoxFit.cover,
            ),
            Text(
              '${bike.nome}',
              style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
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
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black87)),
                onPressed: () {

                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("${bike.nome}"),
                          content: Text(cartProvider.ChecarAddBike(bike)),
                          actions: <Widget>[
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('Fechar'))
                          ],
                        );
                      });


                  //cartProvider.addBike(bike);
                  cartProvider.sumPrice(bike);
                },
                icon: Icon(Icons.pedal_bike),
                label: Text('Alugar Bike')),
            ElevatedButton.icon(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black87)),
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.CART_DETAIL);
                },
                icon: Icon(Icons.shopping_cart),
                label: Text('Ir para o carrinho'))
          ],
        ),
      ),
    );
  }
}
