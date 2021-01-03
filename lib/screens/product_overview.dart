import 'package:flutter/material.dart';
import 'package:jumga/widgets/custom_drawer.dart';
import '../widgets/product_grid.dart';

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
  //automaticallyImplyLeading: false,
),
      drawer: CustomDrawer(),
      body: ProductGrid(),
    );
  }
}
