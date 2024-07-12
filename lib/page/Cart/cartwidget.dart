import 'package:flutter/material.dart';
import 'package:flutter_application_smartshop/page/Cart/checkout.dart';

class CartWidget extends StatefulWidget {
  const CartWidget({super.key});

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  int quantity = 1;
  final double price = 22590000;

  void incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decrementQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double totalPrice = quantity * price;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Giỏ hàng'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/products/phone1.jpg',
                        width: 100,
                        height: 100,
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'iPhone 15 Plus 128GB',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8,),
                            const Text(
                              'Màu: Hồng',
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(height: 8,),
                            Text(
                              '${price.toStringAsFixed(0)} đ',
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.red),
                            ),
                            SizedBox(height: 8,),
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.remove),
                                  onPressed: decrementQuantity,
                                ),
                                Text(
                                  '$quantity',
                                  style: const TextStyle(fontSize: 16),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.add),
                                  onPressed: incrementQuantity,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Divider(),
                ],
              ),
              
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment :CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
                      children: [
                        const Text(
                          'Tổng thanh toán:',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8.0,),
                        Text(
                          '${totalPrice.toStringAsFixed(0)}đ',
                          style:
                              const TextStyle(fontSize: 18, color: Colors.red),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CheckOutWidget(),
                              ),
                            );
                          // Handle purchase action
                        },
                        style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)),
                          ),
                          backgroundColor: Colors.red
                        ),
                        
                        child: const Text(
                            'Mua hàng',
                            style: TextStyle(fontWeight:FontWeight.bold,color: Colors.white),
                            ), // const không cần thiết ở đây
                      ),
                    )
                  ],
                ),
              
              ],
            ),
          ),
        ],
      ),
    );
  }
}
