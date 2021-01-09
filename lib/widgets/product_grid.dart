import 'package:flutter/material.dart';
import '../widgets/product_grid_item.dart';
import '../providers/product_provider.dart';
import 'package:provider/provider.dart';

class ProductGrid extends StatefulWidget {
  @override
  _ProductGridState createState() => _ProductGridState();
}
class _ProductGridState extends State<ProductGrid> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final product = Provider.of<ProductsProvider>(context);
    final extractedProducts = product.products;
    return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
        mainAxisSpacing: 10,crossAxisSpacing: 10,childAspectRatio: 4/3
    ), itemBuilder: (context, index) => ChangeNotifierProvider.value(value: extractedProducts[index],child: ProductGridItem(),),
      itemCount:extractedProducts.length ,);
  }
}
