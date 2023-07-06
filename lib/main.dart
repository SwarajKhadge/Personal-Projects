import 'dart:io';
import 'grocery_item.dart';
import 'item_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ShoppingApp());
}

class ShoppingApp extends StatefulWidget {
  const ShoppingApp({super.key});
  @override
  State<ShoppingApp> createState() {
    return StateOfShoppingApp();
  }
}

Map<GroceryItem, int> cartItems = {};

class StateOfShoppingApp extends State<ShoppingApp> {
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

  List<Widget> displayItems() {
    List<Widget> displayItemList = [];
    List<GroceryItem> requiredList = il.listGiver(selected);
    for (GroceryItem gI in requiredList) {
      displayItemList.add(Row(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(width: 40),
                  Container(
                    height: 34,
                    decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(blurRadius: 0.2, color: Colors.black26)
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
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(blurRadius: 0.2, color: Colors.black26)
                      ],
                      color: Color.fromARGB(255, 240, 247, 222),
                    ),
                    child: Center(
                      child: IconButton(
                        iconSize: 17,
                        onPressed: () {
                          clearItems(gI);
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    ),
                  ),
                  Container(
                    height: 34,
                    decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(blurRadius: 0.2, color: Colors.black26)
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
              )
            ],
          )
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
    return MaterialApp(
        theme: ThemeData(
          useMaterial3: false,
        ),
        // scrollBehavior:
        // ScrollBehavior(),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          drawer: Drawer(
              width: 300,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            TextButton.icon(
                                style: const ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      Color.fromARGB(255, 255, 240, 102)),
                                  // maximumSize: MaterialStatePropertyAll(
                                  //   Size.fromRadius(20))
                                ),
                                icon: const Icon(
                                  Icons.shopping_cart,
                                  color: Color.fromARGB(255, 171, 60, 255),
                                ),
                                onPressed: () {
                                  setState(() {
                                    if (viewOfList == false) {
                                      viewOfList = true;
                                    } else {
                                      viewOfList = false;
                                    }
                                  });
                                },
                                label: const Text(
                                  'View Cart',
                                  style: TextStyle(
                                      fontFamily: 'a',
                                      color: Color.fromARGB(255, 171, 60, 255),
                                      fontSize: 24),
                                )),
                            const SizedBox(
                              height: 12,
                            ),
                            Visibility(
                                visible: viewOfList,
                                child: Column(
                                    children:
                                        cart.displayCart(cartItems, totalAmount)
                                    //important
                                    )),
                            Visibility(
                              visible: !viewOfList,
                              child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(height: 200),
                                    Image(
                                      opacity: AlwaysStoppedAnimation(1),
                                      image: AssetImage('images/namaste.png'),
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        'Namaste, you can view your Cart here',
                                        style: TextStyle(
                                            fontFamily: 'a',
                                            color: Color.fromARGB(96, 0, 0, 0),
                                            fontSize: 24),
                                      ),
                                    ),
                                  ]),
                            ),
                          ],
                        ),
                      ),
                    )),
              )),
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 171, 60, 255),
            title: Align(
              alignment: Alignment.topCenter,
              child: Row(
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
        ));
  }
}
