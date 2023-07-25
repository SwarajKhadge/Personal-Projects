// ignore_for_file: must_be_immutable

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
  LinearGradient notSelectedGradient =
      const LinearGradient(colors: [Colors.transparent, Colors.transparent]);
  List<LinearGradient> gradients = [
    const LinearGradient(colors: [Colors.transparent, Colors.transparent]),
    const LinearGradient(colors: [Colors.transparent, Colors.transparent]),
    const LinearGradient(colors: [Colors.transparent, Colors.transparent]),
    const LinearGradient(colors: [Colors.transparent, Colors.transparent]),
    const LinearGradient(colors: [Colors.transparent, Colors.transparent]),
    const LinearGradient(colors: [Colors.transparent, Colors.transparent]),
    const LinearGradient(colors: [Colors.transparent, Colors.transparent]),
    const LinearGradient(colors: [Colors.transparent, Colors.transparent]),
    const LinearGradient(colors: [Colors.transparent, Colors.transparent]),
  ];
  Color selectedColor = Colors.black;
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
      cartItems.forEach((key, value) {
        totalAmount = 0;
        totalAmount += value * key.pricePerUnit;
      });
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
            hoverColor: Colors.transparent,
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
                              style: TextButton.styleFrom(
                                  foregroundColor: Colors.transparent),
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

  LinearGradient selectedGradient = const LinearGradient(colors: [
    Color.fromARGB(255, 99, 222, 152),
    Color.fromARGB(255, 41, 175, 100),
  ]);
  List<Widget> categoryGiver() {
    List<Widget> categoryListGiver = [];
    for (int i = 0; i < categoryList.length; i++) {
      categoryListGiver.add(Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: AnimatedContainer(
          curve: Curves.decelerate,
          margin: const EdgeInsets.symmetric(horizontal: 5),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            gradient: gradients[i],
          ),
          duration: const Duration(milliseconds: 1200),
          child: Row(
            children: [
              Image.asset(
                i != 8 ? 'images/category$i.png' : 'images/grocery.png',
                height: 20,
                color: temp[i],
                width: 20,
              ),
              InkWell(
                hoverColor: Colors.transparent,
                onTap: () {
                  selected = i;
                  setState(() {
                    for (int t = 0; t < temp.length; t++) {
                      if (t == selected) {
                        temp[t] = selectedColor;
                        gradients[t] = selectedGradient;
                      } else {
                        temp[t] = notSelectedColor;
                        gradients[t] = notSelectedGradient;
                      }
                    }
                  });
                },
                child: Text(categoryList[i],
                    style: TextStyle(color: temp[i], fontFamily: 'a')),
              ),
            ],
          ),
        ),
      ));
    }
    return categoryListGiver;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: const EdgeInsets.only(left: 8.0),
          width: 40,
          height: 40,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage('images/Krsna.jpg'))),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Column(
          children: [],
        ),
        actions: [
          SizedBox(
            height: 150,
            width: 150,
            child: Stack(alignment: AlignmentDirectional.topEnd, children: [
              Positioned(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0, right: 8),
                  child: InkWell(
                      splashColor: Colors.transparent,
                      radius: 45,
                      hoverColor: Colors.transparent,
                      splashFactory: InkRipple.splashFactory,
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                CartPage(_update,cartItems, totalAmount)));
                      },
                      child: Container(
                          height: 45,
                          width: 45,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(colors: [
                                Color.fromARGB(255, 99, 222, 152),
                                Color.fromARGB(255, 41, 175, 100),
                              ])),
                          child: const Icon(
                            Icons.shopping_cart,
                            size: 28,
                          ))),
                ),
              ),
              Visibility(
                visible: cartItems.isNotEmpty,
                child: Positioned(
                    child: AnimatedContainer(
                  curve: Curves.easeInCirc,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                  width: 23,
                  height: 23,
                  duration: const Duration(milliseconds: 900),
                  child: Center(
                    child: Text(
                      cartItems.length.toString(),
                      style:
                          const TextStyle(color: Colors.white, fontFamily: 'a'),
                    ),
                  ),
                )),
              )
            ]),
          ),
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
    );
  }
}

class CustomGradient extends StatelessWidget {
  Widget newChild;
  CustomGradient(this.newChild, {super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ShaderMask(shaderCallback: (rect) {
      return const LinearGradient(colors: [
        Color.fromARGB(255, 99, 222, 152),
        Color.fromARGB(255, 41, 175, 100),
      ]).createShader(rect);
    });
  }
}
