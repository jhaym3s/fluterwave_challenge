import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/add_and_edit_screen.dart';
import '../providers/product_provider.dart';
import '../widgets/update_product_item.dart';

class UpdateProductScreen extends StatelessWidget {
  static const routeName = "update";
  @override
  Widget build(BuildContext context) {
    final product= Provider.of<ProductsProvider>(context);
    final individualProduct = product.products;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(icon: Icon(Icons.add), onPressed: (){
            Navigator.of(context).pushNamed(AddAndEditScreen.routeName);
          }),
        ],
        elevation: 1.0,
      ),
      body: ListView.builder(itemBuilder: (context, index) =>UpdateProductItem(
        id: individualProduct[index].id,title:individualProduct[index].title ,
        imageUrl: individualProduct[index].imageUrl,
        delete: Icons.delete, edit: Icons.edit,
      ),
      itemCount: individualProduct.length,
      ),
    );
  }
}
