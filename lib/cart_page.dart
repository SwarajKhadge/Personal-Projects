// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:shopping_app/grocery_item.dart';

// ignore: must_be_immutable
class CartPage extends StatefulWidget {
  ValueChanged<Map<GroceryItem, int>> update;
  Map<GroceryItem, int> cartItems = {};
  double totalAmount;
  CartPage(this.update, this.cartItems, this.totalAmount, {super.key});

  @override
  State<CartPage> createState() =>
      CartPageState(update, cartItems, totalAmount);
}

class CartPageState extends State<CartPage> {
  ValueChanged<Map<GroceryItem, int>> update;
  Map<GroceryItem, int> cartItems = {};
  double totalAmount;
  CartPageState(this.update, this.cartItems, this.totalAmount);
  Cart cart = Cart();
  void _update(Map<GroceryItem, int> newCartItems) {
    setState(() {
      cartItems = newCartItems;
      totalAmount = 0;
      cartItems.forEach((key, value) {
        totalAmount = key.pricePerUnit * value;
      });
      update(cartItems);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: cart.displayCart(
                _update, cartItems, widget.totalAmount, context),
          ),
        ),
      ),
    );
  }
}
