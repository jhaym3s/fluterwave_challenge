import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:jumga/providers/product.dart';

class ProductGridItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    return GridTile(child: Image.network(product.imageUrl), footer: GridTileBar(
      backgroundColor: Colors.black45,
      leading: Consumer<Product>(
        builder: (BuildContext context, product, Widget child) {
          return IconButton(icon: Icon(  product.isFavourite? Icons.favorite:Icons.favorite_border,color: Colors.red,), onPressed: () {
            return product.toggleFavourite();
           },
          );
        },
      ),
      trailing: IconButton(icon: Icon(Icons.add_shopping_cart), onPressed: null),
      title: Text(product.title),subtitle: Text(product.shopName),
    ),);
  }
}
