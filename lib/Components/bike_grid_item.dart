import 'package:app_aluguel_bike_modulacao_mvp/Models/bike.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../app_routes.dart';

class BikeGridItem extends StatelessWidget {

  final Bike bike;
  BikeGridItem(this.bike);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).pushNamed(AppRoutes.BIKE_DETAIL, arguments: bike);
      },
      child: GridTile(
        child: Image(image: CachedNetworkImageProvider(bike.imagemURL), fit: BoxFit.cover,
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          title:  Text('${bike.nome}', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
          //subtitle:  Text('${bike.preco}', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
        ),
      ),
    );
  }
}
