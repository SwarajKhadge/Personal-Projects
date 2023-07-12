import 'package:flutter/material.dart';
import 'package:shopping_app/buy_popup.dart';
import 'package:shopping_app/grocery_item.dart';
import 'package:shopping_app/item_list.dart';

// ignore:  must_be_immutable
class BuyPage extends StatelessWidget {
  ItemList itemList = ItemList();
  double finalAmount = 0.0;
  double taxAmount = 0.0;
  Map<GroceryItem, int> cartItemsAtBill;
  BuyPage(this.finalAmount, this.taxAmount, this.cartItemsAtBill, {super.key});
  List<TableRow> table = [];
  List<TableRow> tableGiver() {
    table.add(const TableRow(children: [
      Center(
        child: Text(
          'Name',
          style: TextStyle(fontFamily: 'a'),
        ),
      ),
      Center(
        child: Text(
          'Quantity',
          style: TextStyle(fontFamily: 'a'),
        ),
      ),
      Center(
        child: Text(
          'TaxAmount',
          style: TextStyle(fontFamily: 'a'),
        ),
      ),
    ]));
    cartItemsAtBill.forEach((key, value) {
      table.add(TableRow(children: [
        Center(
          child: Text(
            key.name,
            style: const TextStyle(fontFamily: 'a', fontSize: 12),
          ),
        ),
        Center(
          child: Text(
            value.toString(),
            style: const TextStyle(fontFamily: 'a', fontSize: 12),
          ),
        ),
        Center(
          child: Text(
            (key.pricePerUnit *
                    itemList.taxPercentage[key.category]! *
                    value /
                    100)
                .toString(),
            style: const TextStyle(fontFamily: 'a', fontSize: 12),
          ),
        ),
      ]));
    });
    return table;
  }

  @override
  Widget build(BuildContext context) {
    String t = (finalAmount - taxAmount).toStringAsFixed(2);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text(
                'Buying Page',
                style: TextStyle(
                    fontFamily: 'a',
                    color: Color.fromARGB(255, 255, 239, 100),
                    fontSize: 18),
              ),
              backgroundColor: const Color.fromARGB(255, 171, 60, 255),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: const BoxDecoration(
                      // color: Color.fromARGB(255, 255, 239, 100),
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(width: 56),
                            Image.asset(
                              'images/grocery.png',
                              width: 40,
                              height: 40,
                              color: const Color.fromARGB(255, 171, 60, 255),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              'EasyBuy',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 171, 60, 255),
                                  fontFamily: 'a',
                                  fontSize: 24),
                            ),
                          ],
                        ),
                      ),
                      Table(
                        columnWidths: const <int, TableColumnWidth>{
                          0: IntrinsicColumnWidth(flex: 5),
                          1: IntrinsicColumnWidth(flex: 2),
                          2: IntrinsicColumnWidth(flex: 2),
                        },
                        border: TableBorder.all(color: Colors.black54),
                        defaultVerticalAlignment:
                            TableCellVerticalAlignment.middle,
                        children: tableGiver(),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Total Amount: $t ',
                            style: const TextStyle(
                                fontFamily: 'a',
                                color: Color.fromARGB(255, 171, 60, 255),
                                fontSize: 18),
                          ),
                          Text(
                            'Tax Amount: ${taxAmount.toStringAsFixed(2)}',
                            style: const TextStyle(
                                fontFamily: 'a',
                                color: Color.fromARGB(255, 171, 60, 255),
                                fontSize: 18),
                          ),
                          Text(
                            'Final Amount: ${finalAmount.toStringAsFixed(2)} ',
                            style: const TextStyle(
                                fontFamily: 'a',
                                color: Color.fromARGB(255, 171, 60, 255),
                                fontSize: 18),
                          ),
                          const PopUp(),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )));
  }
}

//  Column(children: [
//                 const Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       'Name',
//                       style: TextStyle(fontFamily: 'a', fontSize: 14),
//                     ),
//                     Text(
//                       'Quantity',
//                       style: TextStyle(fontFamily: 'a', fontSize: 14),
//                     ),
//                     Text(
//                       'Tax Amount',
//                       style: TextStyle(fontFamily: 'a', fontSize: 14),
//                     )
//                   ],
//                 ),
//                 Expanded(
//                   child: ListView.separated(
//                       scrollDirection: Axis.vertical,
//                       itemBuilder: (context, index) {
//                         var c = cartItemsAtBill.keys.elementAt(index);
//                         int index1 = 0;
//                         int index2 = c.name.length - 1;
//                         while (c.name[index1] != ' ') {
//                           index1++;
//                         }
//                         while (c.name[index2] != ' ') {
//                           index2--;
//                         }
//                         var quantity = cartItemsAtBill[c];
//                         return Row(
//                           children: [
//                             Text(
//                               '${c.name.substring(0, index1)} ${c.name.substring(index2)}',
//                               style: const TextStyle(
//                                   fontFamily: 'a', fontSize: 12),
//                             ),
//                             Text(quantity.toString()),
//                             Text((quantity! *
//                                     (itemList.taxPercentage[c.category]! *
//                                         c.pricePerUnit /
//                                         100))
//                                 .toStringAsFixed(2))
//                           ],
//                         );
//                       },
//                       separatorBuilder: (context, index) {
//                         return const Divider();
//                       },
//                       itemCount: cartItemsAtBill.length),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Total Amount: $finalAmount',
//                       style: const TextStyle(
//                           fontFamily: 'a',
//                           color: Color.fromARGB(255, 171, 60, 255),
//                           fontSize: 18),
//                     ),
//                   ],
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Tax Amount: $taxAmount',
//                       style: const TextStyle(
//                           fontFamily: 'a',
//                           color: Color.fromARGB(255, 171, 60, 255),
//                           fontSize: 18),
//                     ),
                    
//                   ],
//                 ),
//               ]),