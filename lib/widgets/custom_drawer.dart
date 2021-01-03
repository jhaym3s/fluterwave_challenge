import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.purpleAccent,Colors.purple
                ]
              )
            ),
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

        ],
      ),
    );
  }
}
