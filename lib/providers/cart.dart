import 'package:flutter/cupertino.dart';

import '../providers/cart_item.dart';

class Cart with ChangeNotifier{
  Map<String, CartItem> _cartItems = {};

  Map<String, CartItem> get cartItems {
    return {..._cartItems};
  }
  double get totalAmount{
    var total = 0.0;
 _cartItems.forEach((_, cartItem) {
       total += cartItem.price*cartItem.quantity;
 });
    return total;
  }

  addItem({String productId, double price, String title}){
    if(_cartItems.containsKey(productId)){
        _cartItems.update(productId, (previousCartItem) => CartItem(
          title: previousCartItem.title, quantity: previousCartItem.quantity+1,
          price: previousCartItem.price,id: previousCartItem.id,
        ));
    }else{
      _cartItems.putIfAbsent(productId, () => CartItem(
        price: price,quantity: 1,id: DateTime.now().toString(),title: title,
      ));
    }
    notifyListeners();
  }

  removeLastItem(String productId){
    if(!_cartItems.containsKey(productId)){
      return;
    }
    if(_cartItems[productId].quantity > 1){
      _cartItems.update(productId, (previousCartItem) => CartItem(
        quantity: previousCartItem.quantity-1,
        title: previousCartItem.title,
        id: previousCartItem.id,price: previousCartItem.price,
       ),
      );
    }
    notifyListeners();
  }

}