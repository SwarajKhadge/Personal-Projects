import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shopping_app/information_of_product.dart';

import 'cart_page.dart';
import 'grocery_item.dart';
import 'item_list.dart';

class ShoppingApp extends StatefulWidget {
  const ShoppingApp({super.key});
  @override
  State<ShoppingApp> createState() {
    return StateOfShoppingApp();
  }
}

class StateOfShoppingApp extends State<ShoppingApp> {
  Map<GroceryItem, int> cartItems = {};
  Cart cart = Cart();
  double totalAmount = 0;
  //category ka no.
  // dailyFoodItems:0
  // bath:1
  // snacks=2
  //toys:3
  // washroom:4;
  // clothes:5;
  // electronics:6;
  // furniture:7;
  //All:8
  ItemList il = ItemList();
  Color selectedColor = const Color.fromARGB(255, 0, 0, 0);
  Color notSelectedColor = Colors.grey;
  List<Color> temp = [
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey
  ];
  int selected = 8;
  bool viewOfList = false;
  List<String> categoryList = [
    'Food Essentials',
    'Bath',
    'Snacks',
    'Toys',
    'Washroom',
    'Clothes',
    'Electronics',
    'Furniture',
    'All'
  ];
  void _update(Map<GroceryItem, int> cartItems) {
    setState(() {
      this.cartItems = cartItems;
    });
  }

  void addItems(GroceryItem gI) {
    setState(() {
      if (cartItems.containsKey(gI)) {
        cartItems[gI] = cartItems[gI]! + 1;
      } else {
        cartItems[gI] = 1;
      }
      totalAmount += gI.pricePerUnit;
    });
  }

  void clearItems(GroceryItem gI) {
    setState(() {
      if (cartItems.containsKey(gI)) {
        final toRemove = cartItems[gI];
        cartItems.remove(gI);
        totalAmount -= toRemove! * (gI.pricePerUnit);
      }
    });
  }

  void removeItems(GroceryItem gI) {
    setState(() {
      if (cartItems.containsKey(gI)) {
        if (cartItems[gI] == 1) {
          cartItems.remove(gI);
        } else {
          cartItems[gI] = cartItems[gI]! - 1;
        }
        totalAmount -= gI.pricePerUnit;
      }
    });
  }

  int getQuantity(GroceryItem gI) {
    if (cartItems.containsKey(gI)) {
      return cartItems[gI]!;
    } else {
      return 0;
    }
  }

  List<Widget> displayItems() {
    List<Widget> displayItemList = [];
    List<GroceryItem> requiredList = il.listGiver(selected);
    for (GroceryItem gI in requiredList) {
      displayItemList.add(Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                if (cartItems.containsKey(gI)) {
                  return InformationOfProduct(
                      gI: gI,
                      quantity: cartItems[gI]!,
                      _update,
                      cartItems,
                      totalAmount);
                } else {
                  return InformationOfProduct(
                      _update, gI: gI, quantity: 0, cartItems, totalAmount);
                }
              }));
            },
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 75,
                  width: 75,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: NetworkImage(gI.pictureUrl),
                    fit: BoxFit.cover,
                  )),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          gI.name,
                          style: const TextStyle(fontFamily: 'a', fontSize: 14),
                        ),
                      ],
                    ),
                    Visibility(
                      visible: getQuantity(gI) > 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const SizedBox(width: 40),
                          Container(
                            height: 34,
                            decoration: const BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 0.2, color: Colors.black26)
                                ],
                                color: Color.fromARGB(255, 240, 247, 222),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5))),
                            child: Center(
                              child: IconButton(
                                iconSize: 17,
                                onPressed: () {
                                  removeItems(gI);
                                },
                                icon: const Icon(Icons.remove),
                              ),
                            ),
                          ),
                          Container(
                            height: 34,
                            width: 40,
                            decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 0.2, color: Colors.black26)
                              ],
                              color: Color.fromARGB(255, 240, 247, 222),
                            ),
                            child: Center(
                              child: Text(getQuantity(gI).toString(),
                                  style: const TextStyle(
                                      fontFamily: 'a', fontSize: 14)),
                            ),
                          ),
                          Container(
                            height: 34,
                            decoration: const BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 0.2, color: Colors.black26)
                                ],
                                color: Color.fromARGB(255, 240, 247, 222),
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(5),
                                    bottomRight: Radius.circular(5))),
                            child: Center(
                              child: IconButton(
                                iconSize: 17,
                                onPressed: () {
                                  addItems(gI);
                                },
                                icon: const Icon(Icons.add),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Visibility(
                        visible: getQuantity(gI) == 0,
                        child: Container(
                          height: 34,
                          decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 0.2, color: Colors.black26)
                              ],
                              color: Color.fromARGB(255, 240, 247, 222),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: Center(
                            child: TextButton(
                              onPressed: () {
                                addItems(gI);
                              },
                              child: const Text(
                                'Add to Cart',
                                style: TextStyle(
                                    fontFamily: 'a',
                                    fontSize: 12,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          const Divider()
        ],
      ));
    }
    return displayItemList;
  }

  List<Widget> categoryGiver() {
    List<Widget> categoryListGiver = [];
    for (int i = 0; i < categoryList.length; i++) {
      categoryListGiver.add(TextButton(
          style: const ButtonStyle(
              overlayColor:
                  MaterialStatePropertyAll(Color.fromARGB(255, 206, 239, 255))),
          onPressed: () {
            selected = i;

            setState(() {
              for (int t = 0; t < temp.length; t++) {
                if (t == selected) {
                  temp[t] = selectedColor;
                } else {
                  temp[t] = notSelectedColor;
                }
              }
            });
          },
          child: Text(categoryList[i],
              style: TextStyle(color: temp[i], fontFamily: 'a'))));
    }
    return categoryListGiver;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 171, 60, 255),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(width: 56),
              Image.asset(
                'images/grocery.png',
                width: 40,
                height: 40,
                color: const Color.fromARGB(255, 255, 239, 100),
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                'EasyBuy',
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 239, 100),
                    fontFamily: 'a',
                    fontSize: 24),
              )
            ],
          ),
          actions: [
            IconButton(
                onPressed: () {
                  exit(0);
                },
                icon: Image.asset(
                  'images/exit.png',
                  color: Colors.white,
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: categoryGiver(),
                ),
              ),
              Column(
                children: displayItems(),
              )
            ],
          ),
        ),
        floatingActionButton: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => CartPage(cartItems, totalAmount)));
          },
          style: const ButtonStyle(
            iconColor: MaterialStatePropertyAll(
              Color.fromARGB(255, 255, 239, 100),
            ),
            elevation: MaterialStatePropertyAll(10),
            iconSize: MaterialStatePropertyAll(26),
            fixedSize: MaterialStatePropertyAll(Size(50, 50)),
            shape: MaterialStatePropertyAll(CircleBorder()),
            backgroundColor: MaterialStatePropertyAll(
              Color.fromARGB(255, 171, 60, 255),
            ),
          ),
          child: const Icon(
            Icons.shopping_cart,
          ),
        ));
  }
}
