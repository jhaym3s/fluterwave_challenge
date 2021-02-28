import 'package:flutter/material.dart';
import './screens/auth_screen.dart.dart';
import './screens/update_product_screen.dart';
import './providers/product.dart';
import './providers/auth.dart';
import './providers/cart.dart';
import './providers/product_provider.dart';
import './screens/cart_screen.dart';
import './screens/registration_screen.dart';
import 'package:provider/provider.dart';
import './screens/product_overview.dart';
import 'widgets/login.dart';
import './screens/shop_screen.dart';
import './screens/add_and_edit_screen.dart';

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
        ChangeNotifierProvider(create: (BuildContext context) => Auth(),),
        ChangeNotifierProvider(create: (BuildContext context) => Product(),),
        ChangeNotifierProvider(create: (BuildContext context)=> Cart())
      ] ,
        child: MaterialApp(
          title: 'Jumga Flutter Wave challenge',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: AuthScreen(),
          routes: {
            ProductOverView.routeName :(context)=> ProductOverView(),
            RegistrationScreen.routeName :(context)=> RegistrationScreen(),
            CartScreen.routeName :(context)=> CartScreen(),
            ShopScreen.routeName :(context)=>ShopScreen(),
            AddAndEditScreen.routeName :(context)=>AddAndEditScreen(),
            UpdateProductScreen.routeName :(context)=>UpdateProductScreen(),

          },
        ),
    );
  }
}

