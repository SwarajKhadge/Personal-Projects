import 'initial_display_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const EasyBuy());
}

class EasyBuy extends StatelessWidget {
  const EasyBuy({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ShoppingApp(),
    );
  }
}
