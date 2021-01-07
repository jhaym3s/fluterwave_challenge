import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/product_provider.dart';

class ShopScreen extends StatefulWidget {
  static const routeName = "/shopScreen";
  @override
  _ShopScreenState createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  @override
  Widget build(BuildContext context) {
    final productId =
    ModalRoute.of(context).settings.arguments as String; // is the id!
    final loadedProduct = Provider.of<ProductsProvider>(
      context,
      listen: false,
    ).findById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
    );
  }
}
