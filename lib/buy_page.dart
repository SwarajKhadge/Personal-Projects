import 'package:flutter/material.dart';

// ignore:  must_be_immutable
class BuyPage extends StatelessWidget {
  double finalAmount = 0.0;
  double taxAmount = 0.0;

  BuyPage(this.finalAmount, this.taxAmount, {super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Column(children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Bill',
              style: TextStyle(
                  fontFamily: 'a',
                  color: Color.fromARGB(255, 171, 60, 255),
                  fontSize: 26),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Total Amount: $finalAmount',
              style: const TextStyle(
                  fontFamily: 'a',
                  color: Color.fromARGB(255, 171, 60, 255),
                  fontSize: 26),
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
                  fontSize: 26),
            ),
          ],
        ),
      ]),
    )));
  }
}
