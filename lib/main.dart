import 'package:flutter/material.dart';

import 'package:jumga/providers/ptoduct_provider.dart';
import 'package:jumga/screens/registration_screen.dart';
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
        ChangeNotifierProvider(
        create: (BuildContext context) => ProductsProvider(),
        )
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
          },
        ),
    );
  }
}

