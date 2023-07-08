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
                      width: 40,
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(blurRadius: 0.2, color: Colors.black26)
                        ],
                        color: Color.fromARGB(255, 240, 247, 222),
                      ),
                      child: Center(
                        child: Text(getQuantity(gI).toString(),
                            style:
                                const TextStyle(fontFamily: 'a', fontSize: 14)),
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
                          BoxShadow(blurRadius: 0.2, color: Colors.black26)
                        ],
                        color: Color.fromARGB(255, 240, 247, 222),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
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
                ),
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

// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// void main() {
//   runApp(const Recipe());
// }

// class Recipe extends StatelessWidget {
//   const Recipe({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         brightness: Brightness.light,
//         colorScheme: ColorScheme.fromSeed(
//           seedColor: Colors.purple,
//         ),
//         useMaterial3: true,
//       ),
//       home: Recipe(),
//     );
//   }
// }

// List<Categories> category = [
//   Categories(
//       'https://cdn.dribbble.com/userupload/8335522/file/original-eb4fe06026d4ecb8563f87317559d1a1.png?compress=1&resize=752x',
//       "omkar"),
//   Categories(
//       'https://cdn.dribbble.com/userupload/8335522/file/original-eb4fe06026d4ecb8563f87317559d1a1.png?compress=1&resize=752x',
//       "name"),
//   Categories(
//       'https://cdn.dribbble.com/userupload/8335522/file/original-eb4fe06026d4ecb8563f87317559d1a1.png?compress=1&resize=752x',
//       "name"),
//   Categories(
//       'https://cdn.dribbble.com/userupload/8335522/file/original-eb4fe06026d4ecb8563f87317559d1a1.png?compress=1&resize=752x',
//       "name"),
//   Categories(
//       'https://cdn.dribbble.com/userupload/8335522/file/original-eb4fe06026d4ecb8563f87317559d1a1.png?compress=1&resize=752x',
//       "name")
// ];
// List<Recommendation> recommend = [
//   Recommendation("oijbnsoefi", "omkar"),
//   Recommendation("oijbnsoefi", "omkar"),
//   Recommendation("oijbnsoefi", "omkar"),
//   Recommendation("oijbnsoefi", "omkar"),
//   Recommendation("oijbnsoefi", "omkar"),
// ];

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});
//   @override
//   State<MyHomePage> createState() => _MyHomePage();
// }

// class _MyHomePage extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Hello Omkar")),
//       body: SingleChildScrollView(
//         child: Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               colors: [Colors.black, Colors.red],
//               begin: Alignment.bottomLeft,
//               end: Alignment.topRight,
//             ),
//           ),
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Text(
//                         "What would you like",
//                         style: TextStyle(fontSize: 30),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(right: 88.0),
//                         child: const Text(
//                           "to cook today?",
//                           style: TextStyle(fontSize: 30),
//                         ),
//                       )
//                     ],
//                   ),
//                   CircleAvatar(
//                     backgroundColor: Colors.red,
//                     maxRadius: 23,
//                   ),
//                 ],
//               ),
//               Container(
//                 width: 375,
//                 height: 70,
//                 decoration: BoxDecoration(
//                     color: Colors.green,
//                     borderRadius: BorderRadius.circular(25)),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "Categories",
//                     style: TextStyle(fontSize: 25),
//                   ),
//                   Text(
//                     "See all",
//                     style: TextStyle(fontSize: 15),
//                   )
//                 ],
//               ),
//               SizedBox(
//                 width: 580,
//                 height: 110,
//                 child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemBuilder: (context, index) {
//                     return Padding(
//                       padding: const EdgeInsets.only(right: 20.0),
//                       child: Card(
//                           elevation: 10,
//                           shadowColor: Colors.black,
//                           child: ClipRRect(
//                               borderRadius: BorderRadius.circular(18),
//                               child: Image.network(
//                                   'https://i.pinimg.com/564x/71/f2/68/71f268e9134132ac73440607ac975413.jpg'))),
//                     );
//                   },
//                   itemCount: category.length,
//                 ),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "Recommendation",
//                     style: TextStyle(fontSize: 25),
//                     textAlign: TextAlign.start,
//                   ),
//                   Text("See all", style: TextStyle(fontSize: 15))
//                 ],
//               ),
//               SizedBox(
//                 width: 900,
//                 height: 280,
//                 child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemBuilder: (context, index) {
//                     return Padding(
//                       padding: const EdgeInsets.only(right: 10.0),
//                       child: Card(
//                         elevation: 10,
//                         shadowColor: Colors.black,
//                         shape: ContinuousRectangleBorder(
//                             borderRadius: BorderRadius.circular(20)),
//                         child: Column(
//                           children: [
//                             Container(
//                                 height: 235,
//                                 child: ClipRRect(
//                                     borderRadius: BorderRadius.circular(20),
//                                     child: Image.network(
//                                         'https://i.pinimg.com/564x/71/f2/68/71f268e9134132ac73440607ac975413.jpg'))),
//                             Expanded(child: Text(recommend[index].name))
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                   itemCount: category.length,
//                 ),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Recipies Of The Week",
//                     style: TextStyle(fontSize: 25),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 width: 700,
//                 height: 300,
//                 child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemBuilder: (context, index) {
//                     return Padding(
//                       padding: const EdgeInsets.only(right: 20.0),
//                       child: Container(
//                         width: 200,
//                         height: 200,
//                         child: Column(
//                           children: [
//                             Container(
//                                 width: 200,
//                                 height: 90,
//                                 child: Image.network(
//                                   'https://i.pinimg.com/564x/71/f2/68/71f268e9134132ac73440607ac975413.jpg',
//                                   fit: BoxFit.fill,
//                                 )),
//                             Expanded(child: Text(recommend[index].name))
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                   itemCount: category.length,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class Categories {
//   final String imageurl;
//   final String name;

//   Categories(this.imageurl, this.name);
// }

// class Recommendation {
//   final String imageurl;
//   final String name;
//   Recommendation(this.imageurl, this.name);
// }
