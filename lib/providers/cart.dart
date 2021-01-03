import '../providers/cart_item.dart';

class Cart{
  Map<String, CartItem> _cartItems = {};

  Map<String, CartItem> get carttems {
    return {..._cartItems};
  }
  double get totalAmount{
    var total = 0.0;
 _cartItems.forEach((prod, cartItem) {
       total += cartItem.amount*cartItem.quantity;
 });
    return total;
  }

  addItem({String productId, double amount, String title}){
    if(_cartItems.containsKey(productId)){
        _cartItems.update(productId, (previousCartItem) => CartItem(
          title: previousCartItem.title, quantity: previousCartItem.quantity+1,
          amount: previousCartItem.amount
        ));
    }else{
      _cartItems.putIfAbsent(productId, () => CartItem(
        amount: amount,quantity: 1,id: DateTime.now().toString(),title: title,
      ));
    }

  }

}