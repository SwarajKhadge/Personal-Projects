import 'package:flutter/material.dart';

class GroceryItem {
  String pictureUrl;
  double pricePerUnit;
  String name;
  int category;
  GroceryItem(this.pictureUrl, this.name, this.pricePerUnit, this.category);
}

class Cart {
  Map<GroceryItem, int> finalCartItems = {};
  double taxAmount = 0.0;
  List<Widget> returnDisplayCart = [];
  List<Widget> displayCart(
      Map<GroceryItem, int> cartItems, double finalAmount) {
    taxAmount = finalAmount * 2.5 / 100;
    finalAmount = finalAmount + taxAmount;
    returnDisplayCart.clear();
    returnDisplayCart.add(Text('Cart Amount: ${finalAmount.toStringAsFixed(2)}',
        style: const TextStyle(
            fontFamily: 'a',
            color: Color.fromARGB(255, 171, 60, 255),
            fontSize: 18)));
    cartItems.forEach((key, value) {
      returnDisplayCart.add(SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Card(
          child: Expanded(
            child: Row(
              children: [
                Text(
                  '${key.name}, Quantity:$value',
                  style: const TextStyle(fontFamily: 'a'),
                ),
              ],
            ),
          ),
        ),
      ));
    });
    return returnDisplayCart;
  }
}
