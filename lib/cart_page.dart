import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  final int totalProductsBought;

  const CartPage(this.totalProductsBought, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Center(
        child: Text(
          'Total Products : $totalProductsBought',
          style: const TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
