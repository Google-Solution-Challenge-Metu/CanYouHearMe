import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../translations/locale_keys.g.dart';

class CartModel extends ChangeNotifier {
  // list of items on sale
  final List _shopItems = [
    // [ itemName, itemPrice, imagePath, color ]
    [
      LocaleKeys.donation_helpbox_page_helpbox_main_clothes.tr(),
      "1",
      "assets/images/box_clothes.png",
      Color(0xffd9d9d9)
    ],
    [
      LocaleKeys.donation_helpbox_page_helpbox_main_packed_food.tr(),
      "1",
      "assets/images/box_food.png",
      Color(0xffd9d9d9)
    ],
    [
      LocaleKeys.donation_helpbox_page_helpbox_main_toys.tr(),
      "1",
      "assets/images/box_toys.png",
      Color(0xffd9d9d9)
    ],
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
  String calculateTotal() {
    // calculator
    double totalPrice = 0;
    for (int i = 0; i < cartItems.length; i++) {
      totalPrice += double.parse(cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(0);
  }
}
