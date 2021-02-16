import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:jumga/widgets/http_exception.dart';


class Product with ChangeNotifier{
  final String title,imageUrl,shopName,id,description;
  bool isFavourite;
  final double price;
  //final int quantity;


  Product({this.title,this.imageUrl,this.isFavourite = false,this.shopName,this.id,this.price,this.description});

  void setFavValue(bool newValue){
    isFavourite = newValue;
    notifyListeners();
  }
  toggleFavourite()async {
    final originalStatus = isFavourite;
    isFavourite = !isFavourite;
    final url = 'https://jumga-shop-c8b12-default-rtdb.firebaseio.com/product/$id.json';
    try{
      final response = await http.patch(url,body: json.encode(
      {
      "isFavourite": isFavourite
      }
      ));
      if(response.statusCode >= 400){
        setFavValue(originalStatus);
      }
    }catch(error){
        setFavValue(originalStatus);
    }
  }
}