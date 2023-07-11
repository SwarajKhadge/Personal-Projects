import 'package:flutter/material.dart';
import 'package:shopping_app/grocery_item.dart';

// ignore: must_be_immutable
class CartPage extends StatelessWidget {
  Map<GroceryItem, int> cartItems = {};
  double totalAmount;
  CartPage(this.cartItems, this.totalAmount, {super.key});
  Cart cart = Cart();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8.0),
                child: Text('Cart Items'),
              ),
            ],
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: cart.displayCart(cartItems, totalAmount),
        ),
      ),
    );
  }
}
