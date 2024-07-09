import 'package:flutter/material.dart';

class CartWidget extends StatefulWidget {
  const CartWidget({super.key});

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Giỏ hàng"),
      ),
    );
  }
}