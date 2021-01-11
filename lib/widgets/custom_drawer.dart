import 'package:flutter/material.dart';
import 'package:jumga/screens/add_and_edit_screen.dart';
import 'package:jumga/screens/cart_screen.dart';
import 'package:jumga/screens/product_overview.dart';
import 'package:jumga/screens/update_product_screen.dart';

import '../screens/registration_screen.dart';

class CustomDrawer extends StatelessWidget {

  customListTile(String title, IconData icon, Future function){
    return Column(
      children: [
        ListTile(
          onTap: (){
            // ignore: unnecessary_statements
            function;
          },
          leading: Text(title),trailing: Icon(icon),
        ),
        Divider(),
      ],
    );
  }
  navigator(BuildContext context,String routeName){
    final nextPage =  Navigator.of(context).pushNamed(routeName);
    return nextPage;
  }
  @override
  Widget build(BuildContext context) {

    return Drawer(
      child: Column(
        children: [
          Container(
            color: Colors.deepPurpleAccent,
            height: 100,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Hi Jhaymes",style: TextStyle(fontSize: 21),),
                  CircleAvatar(
                    child: Icon(Icons.account_circle,size: 60,color: Colors.black,),
                    radius: 30,backgroundColor: Colors.grey,
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Text("Product"),
            trailing: Icon(Icons.list),
            onTap: (){
              Navigator.of(context).pushNamed(ProductOverView.routeName);
            },
          ),
          Divider(),
          ListTile(
            leading: Text("Register Your store"),
            trailing: Icon(Icons.store),
            onTap: (){
              Navigator.of(context).pushNamed(RegistrationScreen.routeName);
            },
          ),
          Divider(),
          ListTile(
            leading: Text("Cart"),
            trailing: Icon(Icons.add_shopping_cart_sharp),
            onTap: (){
              Navigator.of(context).pushNamed(CartScreen.routeName);
            },
          ),
          Divider(),
          ListTile(
            leading: Text("Setting"),
            trailing: Icon(Icons.settings),
            onTap: (){
              Navigator.of(context).pushNamed(RegistrationScreen.routeName);
            },
          ),
          Divider(),
          ListTile(
            leading: Text("User product screen"),
            trailing: Icon(Icons.edit),
            onTap: (){
              Navigator.of(context).pushNamed(UpdateProductScreen.routeName);
            },
          ),
          Divider(),
          ListTile(
            leading: Text("Logout"),
            trailing: Icon(Icons.logout),
            onTap: (){
              Navigator.of(context).pushNamed(RegistrationScreen.routeName);
            },
          ),
          Divider(),
        ],
      ),
    );
  }
}
