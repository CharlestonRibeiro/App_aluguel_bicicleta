import 'package:app_aluguel_bike_modulacao_mvp/Models/bike.dart';
import 'package:app_aluguel_bike_modulacao_mvp/Providers/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartItem>(context);
    final List<Bike> bikes = Provider.of<CartItem>(context).bikes;
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de Aluguel'),
        backgroundColor: Colors.black87,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.separated(
              shrinkWrap: true,
                separatorBuilder: (context, int index) => const Divider(),
                itemCount: bikes.length,
                itemBuilder:(context, index){
                  return Card(
                    child: ListTile(
                      trailing: GestureDetector(
                        onTap: (){
                          cartProvider.removeBike(bikes[index]);
                          cartProvider.mPrice(bikes[index]);
                        },
                        child: Icon(Icons.remove_shopping_cart_rounded),),
                      title: Text('${bikes[index].nome}'),
                    ),
                  );
                },),
            ElevatedButton.icon(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.black87)
                ),
                onPressed: () {},
                icon: Icon(Icons.payment),
                label: Text('O Aluguel de ${cartProvider.total} Bikes fica no valor de R\$ ${cartProvider.somaTotal.toStringAsFixed(2)}')
            ),
          ],
        ),
      ),
    );
  }
}
