import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';


import '../providers/product_provider.dart';



import '../widgets/cart_screen_item.dart';
import '../providers/cart.dart';
import '../widgets/custom_drawer.dart';


class CartScreen extends StatelessWidget {
  static const routeName = "/cartScreen";
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductsProvider>(context).products;
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(),
      body:cart.cartItems.isEmpty? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.remove_shopping_cart_outlined,
              size: 80,color: Colors.blueGrey,),
          ],
        ),
      ): Column(
        children: [
          Expanded(child: ListView.builder(
            itemBuilder: (context,index)=> ChangeNotifierProvider.value(
              value: products[index],
              child: CartScreenItem(
                title: cart.cartItems.values.toList()[index].title,
                cartId: cart.cartItems.values.toList()[index].id,
                productId: cart.cartItems.keys.toList()[index],
              price: cart.cartItems.values.toList()[index].price,
                quantity: cart.cartItems.values.toList()[index].quantity,
              ),
            ),
            itemCount: cart.cartItems.length,
          )),
          //SizedBox(height: 10,),
          Card(
           elevation: 2.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
          Text("Total"),
          SizedBox(width: 7,),
          Chip(label: Text("\$${cart.totalAmount.toStringAsFixed(2)}")),
                FlatButton(
                  child: Text("Order",style: TextStyle(color:Colors.purple),),
                  onPressed: (){},
                ),

              ],
            ),
          ),
        ],
      ),
      drawer: CustomDrawer(),
    );
  }
}
