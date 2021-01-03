import 'package:flutter/material.dart';
import 'package:jumga/widgets/custom_drawer.dart';

class CartScreen extends StatelessWidget {
  static const routeName = "/cartScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
             elevation: 2.0,
              child: Row(
                children: [],
              ),
            ),
          ],
        ),
      ),
      drawer: CustomDrawer(),
    );
  }
}
