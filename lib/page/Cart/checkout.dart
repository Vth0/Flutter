import 'package:flutter/material.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  // Sample data for the product list and other sections.
  // In a real application, this data would be fetched from a backend or state management solution.
  final List<ProductItem> _cartItems = [
    ProductItem(
      imageUrl: 'assets/images/laptop.png',
      name: 'iPhone 15 Plus 128GB',
      color: 'Hồng',
      price: 22590000,
      quantity: 1,
    ),
    ProductItem(
      imageUrl: 'assets/images/laptop.png',
      name: 'Laptop Asus TUF Gaming A15', 
      color: 'Đen',
      price: 17990000,
      quantity: 1,
    ),
    ProductItem(
      imageUrl: 'assets/images/laptop.png',
      name: 'Mi Band 8',
      color: 'Đen',
      price: 690000,
      quantity: 1,
    ),ProductItem(
      imageUrl: 'assets/images/laptop.png',
      name: 'Mi Band 8',
      color: 'Đen',
      price: 690000,
      quantity: 1,
    ),
    ProductItem(
      imageUrl: 'assets/images/laptop.png',
      name: 'Mi Band 8',
      color: 'Đen',
      price: 690000,
      quantity: 1,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thanh toán'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AddressSection(),
            const SizedBox(height: 10),
            SizedBox(height: 300,
            child: ProductListSection(cartItems: _cartItems),
            ),
            const SizedBox(height: 10),

            PaymentMethodSection(),
            const SizedBox(height: 10),
            OrderSummarySection(cartItems: _cartItems),
            const Spacer(),
            CheckoutButton(),
          ],
        ),
      ),
    );
  }
}

class AddressSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Địa chỉ nhận hàng:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('Công | (+84)901111111'),
            Text('828 Đ. Sư Vạn Hạnh, Phường 12, Quận 10, Hồ Chí Minh'),
          ],
        ),
      ),
    );
  }
}

class ProductListSection extends StatelessWidget {
  final List<ProductItem> cartItems;

  const ProductListSection({required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: cartItems.map((item) {
          return item;
        }).toList(),
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String color;
  final int price;
  final int quantity;

  const ProductItem({
    required this.imageUrl,
    required this.name,
    required this.color,
    required this.price,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset(imageUrl, width: 50, height: 50),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text('Màu: $color'),
                  Text('x$quantity'),
                ],
              ),
            ),
            Text('${price.toString()}đ'),
          ],
        ),
      ),
    );
  }
}


class PaymentMethodSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
        leading: Icon(Icons.payment),
        title: Text('Phương thức thanh toán'),
        subtitle: Text('Thanh toán khi nhận hàng'),
      ),
    );
  }
}

class OrderSummarySection extends StatelessWidget {
  final List<ProductItem> cartItems;

  const OrderSummarySection({required this.cartItems});

  @override
  Widget build(BuildContext context) {
    int totalPrice = cartItems.fold(0, (sum, item) => sum + item.price * item.quantity);

    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Chi tiết thanh toán', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            // Adjust this value according to your logic for vouchers, etc.
            OrderSummaryItem(label: 'Tổng thanh toán', value: '$totalPrice đ', isBold: true),
          ],
        ),
      ),
    );
  }
}

class OrderSummaryItem extends StatelessWidget {
  final String label;
  final String value;
  final bool isBold;

  const OrderSummaryItem({
    required this.label,
    required this.value,
    this.isBold = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
        Text(value, style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
      ],
    );
  }
}

class CheckoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          // Handle checkout process
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          minimumSize: Size(double.infinity, 50),
        ),
        child: const Text('Thanh toán', style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
