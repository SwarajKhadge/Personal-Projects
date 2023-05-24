import 'dart:io';

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

class StateOfShoppingApp extends State<ShoppingApp> {
  //category ka

  // dailyFoodItems:0
  // bath:1
  // snacks=2
  //toys:3
  // washroom:4;
  // clothes:5;
  // electronics:6;
  // furniture:7;

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
  ];
  int selected = -1;
  bool viewOfList = false;
  List<String> categoryList = [
    'Food Essentials',
    'Bath',
    'Snacks',
    'Toys',
    'Washroom',
    'Clothes',
    'Electronics',
    'Furniture'
  ];

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
                              child: Container(
                                  height: 600,
                                  width: 290,
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 255, 239, 100),
                                      //List
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Column(children: const [
                                    Text('Selected Items ',
                                        style: TextStyle(
                                            fontFamily: 'a',
                                            color: Color.fromARGB(
                                                255, 171, 60, 255),
                                            fontSize: 18)),
                                    //important
                                  ]))),
                          Visibility(
                              visible: !viewOfList,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
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
                                    )
                                  ]))
                        ],
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
                )
              ],
            ),
          ),
        ));
  }
}
