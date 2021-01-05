import 'package:flutter/material.dart';

import './providers/product.dart';
import './providers/cart.dart';
import './providers/product_provider.dart';
import './screens/cart_screen.dart';
import './screens/registration_screen.dart';
import 'package:provider/provider.dart';
import './screens/product_overview.dart';
import './login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) => ProductsProvider(),),
        ChangeNotifierProvider(create: (BuildContext context) => Product(),),
        ChangeNotifierProvider(create: (BuildContext context)=> Cart())
      ] ,
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: ProductOverView(),
          routes: {
            ProductOverView.routeName :(context)=> ProductOverView(),
            RegistrationScreen.routeName :(context)=> RegistrationScreen(),
            CartScreen.routeName :(context)=> CartScreen(),
          },
        ),
    );
  }
}

