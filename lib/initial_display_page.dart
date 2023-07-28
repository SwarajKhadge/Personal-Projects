// ignore_for_file: must_be_immutable
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:shopping_app/information_of_product.dart';
import 'cart_page.dart';
import 'display_coupun.dart';
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
  @override
  void initState() {
    super.initState();

    textEditingController.addListener(() => setState(() {}));
  }

  void searchAccordingtoName() {}
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

  int minimum = -1, maximum = -1;
  List<GroceryItem> newRequiredItemList = [];
  void newRequiredItemGiver(int minimum, int maximum) {
    this.minimum = minimum;
    this.maximum = maximum;
  }

  TextEditingController textEditingController = TextEditingController();
  String searchProduct = '';
  OutlineInputBorder textFieldKa = const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(30)),
    borderSide: BorderSide(
      color: Colors.white,
      width: 3,
    ),
  );
  List<Widget> displayItems() {
    List<Widget> displayItemList = [];
    List<GroceryItem> requiredList = il.listGiver(selected, minimum, maximum);
    // displayItemList.add();
    for (var gI in requiredList) {
      displayItemList.add(Padding(
        padding: const EdgeInsets.all(12),
        child: SizedBox(
          height: 260,
          width: 198,
          child: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return InformationOfProduct(_update, cartItems, totalAmount,
                    gI: gI, quantity: getQuantity(gI));
              }));
            },
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              elevation: 6,
              child: AnimatedContainer(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(30)),
                duration: const Duration(seconds: 3),
                padding: const EdgeInsets.all(6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(gI.pictureUrl))),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Visibility(
                                visible: true,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        minimumSize: const Size(30, 30),
                                        shape: const CircleBorder(),
                                        backgroundColor: const Color.fromARGB(
                                            255, 61, 197, 122)),
                                    onPressed: () {
                                      addItems(gI);
                                    },
                                    child: const Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 24,
                                    ))),
                            const SizedBox(
                              height: 8,
                            ),
                            Visibility(
                                visible: true,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        minimumSize: const Size(30, 30),
                                        shape: const CircleBorder(),
                                        backgroundColor: const Color.fromARGB(
                                            255, 61, 197, 122)),
                                    onPressed: () {
                                      removeItems(gI);
                                    },
                                    child: const Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                      size: 24,
                                    ))),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      gI.name,
                      style: const TextStyle(
                        fontFamily: 'a',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          '₹ ${gI.pricePerUnit}',
                          style: const TextStyle(
                            fontFamily: 'a',
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const LikeButton(size: 20)
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
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
            borderRadius: BorderRadius.circular(16),
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

  List<Widget> newDisplayList = [];
  List<Widget> newDisplayListGiver() {
    newDisplayList.clear();
    ItemList itemList = ItemList();
    List<GroceryItem> newGroceryList = [];
    List<GroceryItem> dummyDisplayList =
        itemList.listGiver(selected, minimum, maximum);
    for (var product in dummyDisplayList) {
      if ((product.name.toLowerCase()).contains(searchProduct.toLowerCase())) {
        newGroceryList.add(product);
      }
    }
    // newDisplayList.add(

    // );
    for (GroceryItem gI in newGroceryList) {
      newDisplayList.add(Padding(
        padding: const EdgeInsets.all(12),
        child: SizedBox(
          height: 240,
          width: 198,
          child: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return InformationOfProduct(_update, cartItems, totalAmount,
                    gI: gI, quantity: getQuantity(gI));
              }));
            },
            child: Card(
              elevation: 6,
              child: AnimatedContainer(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(30)),
                duration: const Duration(seconds: 3),
                padding: const EdgeInsets.all(6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(gI.pictureUrl))),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Visibility(
                                visible: true,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        shape: const CircleBorder(),
                                        backgroundColor: const Color.fromARGB(
                                            255, 61, 197, 122)),
                                    onPressed: () {
                                      addItems(gI);
                                    },
                                    child: const Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ))),
                            const SizedBox(
                              height: 8,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      gI.name,
                      style: const TextStyle(
                        fontFamily: 'a',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          '₹ ${gI.pricePerUnit}',
                          style: const TextStyle(
                            fontFamily: 'a',
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const LikeButton(size: 20)
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ));
    }
    return newDisplayList;
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
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi,',
              style: TextStyle(
                  fontFamily: 'a', fontSize: 12, color: Colors.black54),
            ),
            Text(
              'Krsna Yadav',
              style:
                  TextStyle(fontFamily: 'a', fontSize: 16, color: Colors.black),
            ),
          ],
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
                                CartPage(_update, cartItems, totalAmount)));
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
                    child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.white,
                        width: 2,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        style: BorderStyle.solid),
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                  width: 23,
                  height: 23,
                  child: Center(
                    child: Text(
                      cartItems.length.toString(),
                      style:
                          const TextStyle(color: Colors.white, fontFamily: 'a'),
                    ),
                  ),
                )),
              ),
            ]),
          ),
          const SizedBox(width: 10)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const SizedBox(height: 40),
                Expanded(
                  flex: 9,
                  child: TextFormField(
                    onChanged: (value) {
                      setState(() {
                        Timer(const Duration(milliseconds: 300), () {});
                        searchProduct = value;
                      });
                    },
                    controller: textEditingController,
                    decoration: InputDecoration(
                        hintText: 'Kya Chahiye Apko?',
                        border: textFieldKa,
                        enabledBorder: textFieldKa,
                        focusedBorder: textFieldKa),
                  ),
                ),
                SizedBox(
                  width: 120,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text(
                                  'Filter by Price',
                                  style: TextStyle(
                                      fontFamily: 'a',
                                      fontSize: 16,
                                      color: Colors.black),
                                ),
                                content: SizedBox(
                                  height: 200,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        width: 300,
                                        child: TextButton(
                                          style: TextButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                  side: const BorderSide(
                                                      color: Colors.green),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12))),
                                          onPressed: () {
                                            Navigator.pop(context);
                                            setState(() {
                                              newRequiredItemGiver(0, 101);
                                            });
                                          },
                                          child: const Text(
                                            'Upto 100',
                                            style: TextStyle(
                                                fontFamily: 'a',
                                                fontSize: 12,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      SizedBox(
                                        width: 300,
                                        child: TextButton(
                                          style: TextButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                  side: const BorderSide(
                                                      color: Colors.green),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12))),
                                          onPressed: () {
                                            setState(() {
                                              Navigator.pop(context);
                                              newRequiredItemGiver(101, 201);
                                            });
                                          },
                                          child: const Text(
                                            '100-200',
                                            style: TextStyle(
                                                fontFamily: 'a',
                                                fontSize: 12,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      SizedBox(
                                        width: 300,
                                        child: TextButton(
                                          style: TextButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                  side: const BorderSide(
                                                      color: Colors.green),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12))),
                                          onPressed: () {
                                            setState(() {
                                              Navigator.pop(context);
                                              newRequiredItemGiver(202, 303);
                                            });
                                          },
                                          child: const Text(
                                            '200-300',
                                            style: TextStyle(
                                                fontFamily: 'a',
                                                fontSize: 12,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      SizedBox(
                                        width: 300,
                                        child: TextButton(
                                          style: TextButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                  side: const BorderSide(
                                                      color: Colors.green),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12))),
                                          onPressed: () {
                                            setState(() {
                                              Navigator.pop(context);
                                              newRequiredItemGiver(
                                                  303, 1000000);
                                            });
                                          },
                                          child: const Text(
                                            'above 300',
                                            style: TextStyle(
                                                fontFamily: 'a',
                                                fontSize: 12,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      SizedBox(
                                        width: 300,
                                        child: TextButton(
                                          style: TextButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                  side: const BorderSide(
                                                      color: Colors.green),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12))),
                                          onPressed: () {
                                            setState(() {
                                              Navigator.pop(context);
                                              newRequiredItemGiver(
                                                  0, 100000000);
                                            });
                                          },
                                          child: const Text(
                                            'All',
                                            style: TextStyle(
                                                fontFamily: 'a',
                                                fontSize: 12,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(colors: [
                              Color.fromARGB(255, 99, 222, 152),
                              Color.fromARGB(255, 41, 175, 100),
                            ]),
                            borderRadius: BorderRadius.circular(26)),
                        height: 50,
                        width: 200,
                        child: const Icon(Icons.filter_list),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
            const SizedBox(height: 30),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: categoryGiver(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(height: 300, child: DisplayCoupun()),
            SizedBox(
              height: 300,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: searchProduct.isEmpty
                      ? displayItems()
                      : newDisplayListGiver(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
