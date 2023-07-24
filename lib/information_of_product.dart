import 'package:flutter/material.dart';
import 'initial_display_page.dart';

import 'grocery_item.dart';

// ignore: must_be_immutable
class InformationOfProduct extends StatefulWidget {
  Map<GroceryItem, int> cartItems = {};
  double totalAmount;
  GroceryItem gI;
  int quantity;
  InformationOfProduct(this.update, this.cartItems, this.totalAmount,
      {required this.gI, required this.quantity, super.key});
  final ValueChanged<Map<GroceryItem, int>> update;
  @override
  State<InformationOfProduct> createState() {
    // ignore: no_logic_in_create_state
    return InformationOfProductState(
        gI, quantity, update, cartItems, totalAmount);
  }
}

class InformationOfProductState extends State<InformationOfProduct> {
  Map<GroceryItem, int> cartItems = {};
  double totalAmount;
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

  final ValueChanged<Map<GroceryItem, int>> update;
  GroceryItem gI;
  int quantity;
  InformationOfProductState(
      this.gI, this.quantity, this.update, this.cartItems, this.totalAmount);
  StateOfShoppingApp stateOfShoppingApp = StateOfShoppingApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back))
            ],
          ),
          backgroundColor: const Color.fromARGB(255, 171, 60, 255),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    image: DecorationImage(image: NetworkImage(gI.pictureUrl)),
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 3,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            gI.name,
                            style:
                                const TextStyle(fontFamily: 'a', fontSize: 14),
                          ),
                          Text(
                            gI.information,
                            style: TextStyle(
                                fontFamily: 'a',
                                fontSize: 12,
                                color: Colors.grey.withOpacity(0.7)),
                          ),
                          const SizedBox(
                            width: double.maxFinite,
                          ),
                          Row(
                            children: [
                              ShaderMask(
                                shaderCallback: (bounds) {
                                  return const LinearGradient(colors: [
                                    Color.fromARGB(255, 102, 255, 168),
                                    Color.fromARGB(255, 30, 123, 70),
                                  ]).createShader(bounds);
                                },
                                child: ElevatedButton(
                                    onPressed: () {
                                      addItems(gI);
                                      update(cartItems);
                                    },
                                    child: const Text(
                                      'Add to Cart',
                                      style: TextStyle(color: Colors.white),
                                    )),
                              )
                            ],
                          )
                        ]),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

// GroceryItem gI;
//   int quantity;
//   InformationOfProduct(this.gI, this.quantity, {super.key});
//   StateOfShoppingApp stateOfShoppingApp = StateOfShoppingApp();
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           title: Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               IconButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   icon:const Icon(Icons.arrow_back))
//             ],
//           ),
//           backgroundColor: const Color.fromARGB(255, 171, 60, 255),
//         ),
//         body: Column(
//           children: [
//             Expanded(
//               flex: 5,
//               child: Padding(
//                 padding: const EdgeInsets.all(12.0),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: Colors.white10,
//                     borderRadius: const BorderRadius.all(Radius.circular(12)),
//                     image: DecorationImage(image: NetworkImage(gI.pictureUrl)),
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//                 flex: 3,
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           gI.name,
//                           style: const TextStyle(fontFamily: 'a', fontSize: 14),
//                         ),
//                         Text(
//                           gI.information,
//                           style: TextStyle(
//                               fontFamily: 'a',
//                               fontSize: 12,
//                               color: Colors.grey.withOpacity(0.7)),
//                         ),
//                         const SizedBox(
//                           width: double.maxFinite,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Column(
//                               children: [
//                                 Container(
//                                   width: 90,
//                                   decoration: const BoxDecoration(
//                                     borderRadius: BorderRadius.all(
//                                       Radius.circular(12),
//                                     ),
//                                     color: Color.fromARGB(255, 171, 60, 255),
//                                   ),
//                                   child: TextButton(
//                                     onPressed: () {
//                                       stateOfShoppingApp.addItems(gI);
//                                     },
//                                     child: const Text(
//                                       'Add to Cart',
//                                       style: TextStyle(
//                                         fontFamily: 'a',
//                                         fontSize: 12,
//                                         color:
//                                             Color.fromARGB(255, 255, 240, 102),
//                                       ),
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ],
//                         )
//                       ]),
//                 ))
//           ],
//         ),
//       ),
//     );
//   }
