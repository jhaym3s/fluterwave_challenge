import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/product_grid.dart';
import '../screens/cart_screen.dart';
import '../providers/product_provider.dart';

class ProductOverView extends StatefulWidget {
  static const routeName = "productOverview";
  @override
  _ProductOverViewState createState() => _ProductOverViewState();
}

class _ProductOverViewState extends State<ProductOverView> {
  var isInit = true;
  // @override
  // void initState() {
  //   Future.delayed(Duration.zero).then((value) =>
  //   Provider.of<ProductsProvider>(context).fetchProduct()
  //   );
  //   super.initState();
  // this
  // }
  @override
  void didChangeDependencies() {
    if(isInit){
      Provider.of<ProductsProvider>(context).fetchProduct();
    }
    isInit = false;
    super.didChangeDependencies();
  }
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
