import 'package:flutter/material.dart';
import 'package:shopping_app/item_list.dart';

class GroceryItem {
  String pictureUrl;
  double pricePerUnit;
  String name;
  int category;
  GroceryItem(this.pictureUrl, this.name, this.pricePerUnit, this.category);
}

class Cart {
  ItemList itemList = ItemList();
  double finalAmount = 0.0;
  double taxAmount = 0.0;
  List<Widget> returnDisplayCart = [];
  List<Widget> displayCart(Map<GroceryItem, int> cartItems, finalAmount) {
    Map<int, double> getTax = itemList.taxPercentage;

    returnDisplayCart.clear();
    returnDisplayCart.add(Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Text('Cart Amount: ${finalAmount.toStringAsFixed(2)}',
          style: const TextStyle(
              fontFamily: 'a',
              color: Color.fromARGB(255, 171, 60, 255),
              fontSize: 18)),
    ));
    cartItems.forEach((key, value) {
      taxAmount =
          taxAmount + value * key.pricePerUnit * getTax[key.category]! / 100;
      finalAmount += taxAmount;
      returnDisplayCart.add(SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 30,
              child: Expanded(
                child: Row(
                  children: [
                    Text(
                      '${key.name}, Quantity:$value  Amount:${(value * key.pricePerUnit).toInt()}  Tax Amount:${(value * key.pricePerUnit * getTax[key.category]! / 100).toStringAsFixed(1)}',
                      style: const TextStyle(fontFamily: 'a'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ));
    });
    return returnDisplayCart;
  }
}
