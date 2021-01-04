import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../screens/shop_screen.dart';
import '../providers/product.dart';
import '../providers/cart.dart';

class ProductGridItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    final cart = Provider.of<Cart>(context);
    return GridTile(child: Image.network(product.imageUrl), footer: GridTileBar(
      backgroundColor: Colors.black45,
      leading: Consumer<Product>(
        builder: (BuildContext context, product, Widget child) {
          return IconButton(
            icon: Icon(product.isFavourite? Icons.favorite:Icons.favorite_border,color: Colors.orange,),
            onPressed: () {
            return product.toggleFavourite();
           },
          );
        },
      ),
      trailing: IconButton(icon: Icon(Icons.add_shopping_cart), onPressed: (){
        cart.addItem(title: product.title,price: product.price,productId: product.id);
        Scaffold.of(context).hideCurrentSnackBar();
        Scaffold.of(context).showSnackBar(SnackBar(
            content: Text("An item has been added to the cart"),
          backgroundColor: Colors.black45,duration: Duration(seconds: 3),
          action: SnackBarAction(label: "Undo", onPressed: (){
              cart.removeLastItem(product.id);
          }),
        ));
      }),
      title: Text(product.title),
      subtitle: FlatButton(onPressed: () {
        Navigator.of(context).pushNamed(ShopScreen.routeName,arguments: product.id);
      },
      child: Text(product.shopName,style: TextStyle(color: Colors.purpleAccent),textAlign: TextAlign.left,
        softWrap: true,)),
    ),);
  }
}
