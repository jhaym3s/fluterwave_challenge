import 'package:flutter/material.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/product_grid.dart';
import '../screens/cart_screen.dart';

class ProductOverView extends StatefulWidget {
  static const routeName = "productOverview";
  @override
  _ProductOverViewState createState() => _ProductOverViewState();
}

class _ProductOverViewState extends State<ProductOverView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  backgroundColor: Colors.deepPurpleAccent,
  actions: [
    IconButton(icon: Icon(Icons.shopping_cart), onPressed: (){
      Navigator.of(context).pushNamed(CartScreen.routeName);
     },
    )
  ],
),
      drawer: CustomDrawer(),
      body: ProductGrid(),
    );
  }
}
