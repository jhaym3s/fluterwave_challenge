import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:jumga/providers/product_provider.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = "/product_detail_screen";
  @override
  Widget build(BuildContext context) {
   final productId=  ModalRoute.of(context).settings.arguments as String;
   final products = Provider.of<ProductsProvider>(context).findById(productId);
    return Scaffold(
      appBar: AppBar(
        title:Text(products.title),
      ),
      body:Column(
        children: [

        ],
      ),
    );
  }
}
