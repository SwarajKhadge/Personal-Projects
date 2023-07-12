import 'package:flutter/material.dart';
import 'initial_display_page.dart';

import 'grocery_item.dart';

// ignore: must_be_immutable
class InformationOfProduct extends StatefulWidget {
  GroceryItem gI;
  int quantity;
  InformationOfProduct({required this.gI, required this.quantity, super.key});

  @override
  State<InformationOfProduct> createState() {
    // ignore: no_logic_in_create_state
    return InformationOfProductState(gI, quantity);
  }
}

class InformationOfProductState extends State<InformationOfProduct> {
  GroceryItem gI;
  int quantity;
  InformationOfProductState(
    this.gI,
    this.quantity,
  );
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
