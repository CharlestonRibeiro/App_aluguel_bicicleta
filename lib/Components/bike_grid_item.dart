import 'package:app_aluguel_bike_modulacao_mvp/Models/bike.dart';
import 'package:app_aluguel_bike_modulacao_mvp/Providers/cart_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app_routes.dart';

class BikeGridItem extends StatelessWidget {
  final Bike bike;
  BikeGridItem(this.bike);

  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartItem>(context);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(AppRoutes.BIKE_DETAIL, arguments: bike);
      },
      child: GridTile(
        child: Image(
          image: CachedNetworkImageProvider(bike.imagemURL),
          fit: BoxFit.cover,
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          title: Text(
            '${bike.nome}',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            textAlign: TextAlign.left,
          ),
          subtitle: Text(
            'Diária: R\$ ${bike.preco}',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          trailing: GestureDetector(
            child: Icon(Icons.add_shopping_cart),
            onTap: () {
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
              print('Quantidade de Bikes no Cart: ${cartProvider.total}');
            },
          ),
        ),
      ),
    );
  }
}
