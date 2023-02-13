import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  // list of items on sale
  final List _shopItems = const [       
    // [ itemName, itemPrice, imagePath, color ]
    ["Clothes", "1", "assets/images/google.png", Colors.blue],
    ["Packed Foods", "1", "assets/images/google.png", Colors.yellow],
    ["Toys", "1", "assets/images/google.png", Colors.brown],
    //["Heater", "1.00", "assets/images/google.png", Colors.blue],
  ];

  // list of cart items
  List _cartItems = [];

  get cartItems => _cartItems;

  get shopItems => _shopItems;

  // add item to cart
  void addItemToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  // calculate total price
  String calculateTotal() {           // calculator
    double totalPrice = 0;
    for (int i = 0; i < cartItems.length; i++) {
      totalPrice += double.parse(cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(0);
  }
}
