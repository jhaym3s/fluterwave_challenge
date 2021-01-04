import 'package:flutter/material.dart';

class CartScreenItem extends StatelessWidget {
  final String cartId,productId,title;
  final double price;
  final int quantity;
  CartScreenItem({this.cartId, this.price, this.title, this.quantity, this.productId});
  @override
  Widget build(BuildContext context) {
    return Dismissible(key: ValueKey(cartId),
      child: ListTile(
      onLongPress: (){
        showDialog(context: context,builder: (context)=> AlertDialog(
          actions: [
            FlatButton(
                onPressed: (){
                  Navigator.of(context).pop(true);
                }, child: Text("Yes")),
            FlatButton(
                onPressed: (){
                  Navigator.of(context).pop(false);
                }, child: Text("No")),
          ],
        ));
      },
    ),
    background: Container(
      child: Icon(Icons.delete),
    color: Theme.of(context).errorColor,
    ),
      confirmDismiss: (direction) {
        return  showDialog(context: context,
          builder: (context) => AlertDialog(
            elevation: 3.0,
            title: Text("Do you wanna delete this"),
            backgroundColor: Colors.black45,
            content: Text("Click Yes to continue to delete"),
            actions: [
              FlatButton(onPressed: (){
                Navigator.of(context).pop(true);
                }, child: Text("YES")),
              FlatButton(onPressed: (){
                Navigator.of(context).pop(false);
                }, child: Text("NO"))
            ],
          ),
        );
      },
    );
  }
}
