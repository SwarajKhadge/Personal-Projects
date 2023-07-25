// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:shopping_app/buy_page.dart';
// import 'package:shopping_app/cart_page.dart';

import 'package:shopping_app/item_list.dart';

class GroceryItem {
  String pictureUrl;
  double pricePerUnit;
  String name;
  int category;
  String information;
  GroceryItem(this.pictureUrl, this.name, this.pricePerUnit, this.information,
      this.category);
}

class Cart {
  ValueChanged<Map<GroceryItem, int>>? update;

  ItemList itemList = ItemList();
  double finalAmount = 0.0;
  double taxAmount = 0.0;
  List<Widget> returnDisplayCart = [];
  List<Widget> displayCart(update, Map<GroceryItem, int> cartItems, finalAmount,
      BuildContext context) {
    Map<int, double> getTax = itemList.taxPercentage;
    Map<GroceryItem, int> finalCartItems = cartItems;
    returnDisplayCart.clear();

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
                    Center(
                      child: IconButton(
                          splashRadius: 24,
                          onPressed: () {
                            cartItems.remove(key);
                            finalAmount = 0;
                            cartItems.forEach((key, value) {
                              taxAmount = taxAmount +
                                  value *
                                      key.pricePerUnit *
                                      getTax[key.category]! /
                                      100;
                              finalAmount += taxAmount;
                            });
                            update(cartItems);
                          },
                          icon: const Icon(
                            Icons.delete,
                            size: 18,
                          )),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ));
    });

    returnDisplayCart.add(Visibility(
      visible: cartItems.isEmpty,
      child: Center(
          child: Column(
        children: [
          Image.asset('images/error.png'),
          const Text(
            'No Items in Cart',
            style:
                TextStyle(fontFamily: 'a', color: Colors.black, fontSize: 18),
          )
        ],
      )),
    ));
    returnDisplayCart.add(
      Visibility(
        visible: cartItems.isNotEmpty,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton.icon(
              style: TextButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 171, 60, 255)),
              icon: const Icon(
                Icons.shopping_bag_outlined,
                color: Color.fromARGB(255, 255, 239, 100),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) =>
                            BuyPage(finalAmount, taxAmount, finalCartItems))));
              },
              label: const Text(
                'Buy Now',
                style: TextStyle(
                    fontFamily: 'a',
                    color: Color.fromARGB(255, 255, 239, 100),
                    fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
    return returnDisplayCart;
  }
}

class CustomGradient extends StatelessWidget {
  Widget newChild;
  CustomGradient(this.newChild, {super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ShaderMask(
      shaderCallback: (rect) {
        return const LinearGradient(colors: [
          Color.fromARGB(255, 99, 222, 152),
          Color.fromARGB(255, 41, 175, 100),
        ]).createShader(rect);
      },
      child: newChild,
    );
  }
}
