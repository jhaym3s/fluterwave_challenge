import 'package:flutter/cupertino.dart';

class Product with ChangeNotifier{
  final String title,imageUrl,shopName,id,description;
  bool isFavourite;
  final double price;
  //final int quantity;


  Product({this.title,this.imageUrl,this.isFavourite = false,this.shopName= "",this.id,this.price,this.description});

  toggleFavourite(){
    isFavourite = !isFavourite;
    notifyListeners();
  }
}