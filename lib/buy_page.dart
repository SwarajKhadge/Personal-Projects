import 'package:flutter/material.dart';
import 'package:shopping_app/grocery_item.dart';
import 'package:shopping_app/item_list.dart';

// ignore:  must_be_immutable
class BuyPage extends StatelessWidget {
  ItemList itemList = ItemList();
  double finalAmount = 0.0;
  double taxAmount = 0.0;
  Map<GroceryItem, int> cartItemsAtBill;
  BuyPage(this.finalAmount, this.taxAmount, this.cartItemsAtBill, {super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            body: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              child: Column(children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Name',
                      style: TextStyle(fontFamily: 'a', fontSize: 18),
                    ),
                    Text(
                      'Quantity',
                      style: TextStyle(fontFamily: 'a', fontSize: 18),
                    ),
                    Text(
                      'Tax Amount',
                      style: TextStyle(fontFamily: 'a', fontSize: 18),
                    )
                  ],
                ),
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        var c = cartItemsAtBill.keys.elementAt(index);

                        var quantity = cartItemsAtBill[c];
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(c.name),
                            Text(quantity.toString()),
                            Text((quantity! *
                                    (itemList.taxPercentage[c.category]! *
                                        c.pricePerUnit /
                                        100))
                                .toString())
                          ],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Divider();
                      },
                      itemCount: cartItemsAtBill.length),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Total Amount: $finalAmount',
                      style: const TextStyle(
                          fontFamily: 'a',
                          color: Color.fromARGB(255, 171, 60, 255),
                          fontSize: 18),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Tax Amount: $taxAmount',
                      style: const TextStyle(
                          fontFamily: 'a',
                          color: Color.fromARGB(255, 171, 60, 255),
                          fontSize: 18),
                    ),
                  ],
                ),
              ]),
            )));
  }
}
