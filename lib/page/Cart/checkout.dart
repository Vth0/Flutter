import 'package:flutter/material.dart';

class CheckOutWidget extends StatefulWidget {
  const CheckOutWidget({super.key});

  @override
  State<CheckOutWidget> createState() => _CheckOutWidgetState();
}

class _CheckOutWidgetState extends State<CheckOutWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thanh toán'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button press
          },
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          AddressSection(),
          SizedBox(height: 16.0),
          ProductList(),
          SizedBox(height: 16.0),
          VoucherSection(),
          SizedBox(height: 16.0),
          PaymentMethodSection(),
          SizedBox(height: 16.0),
          PaymentDetailSection(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Tổng thanh toán: ',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: '1000000đ',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.red,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                  width: 160,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle purchase action
                    },
                    style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        backgroundColor: Colors.red),

                    child: const Text(
                      'Mua hàng',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ), // const không cần thiết ở đây
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AddressSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4.0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Địa chỉ nhận hàng:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text('Công | (+84)901111111'),
          Text('828 Đ. Sư Vạn Hạnh, Phường 12, Quận 10, Hồ Chí Minh'),
        ],
      ),
    );
  }
}

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProductItem(
          name: 'iPhone 15 Plus 128GB',
          color: 'Hồng',
          price: '22.590.000đ',
          quantity: 1,
          imageUrl:
              'assets/images/products/phone1.jpg', // Replace with actual image URL
        ),
        ProductItem(
          name: 'Laptop Asus TUF Gaming A15',
          color: 'Đen',
          price: '17.990.000đ',
          quantity: 1,
          imageUrl:
              'assets/images/products/phone2.jpg', // Replace with actual image URL
        ),
        ProductItem(
          name: 'Mi Band 8',
          color: 'Đen',
          price: '690.000đ',
          quantity: 1,
          imageUrl:
              'assets/images/products/phone3.jpg', // Replace with actual image URL
        ),
      ],
    );
  }
}

class ProductItem extends StatelessWidget {
  final String name;
  final String color;
  final String price;
  final int quantity;
  final String imageUrl;

  const ProductItem({
    required this.name,
    required this.color,
    required this.price,
    required this.quantity,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
      ),
      child: Row(
        children: [
          Image.network(
            imageUrl,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
                Text('Màu: $color'),
                Text(price),
              ],
            ),
          ),
          Text('x$quantity'),
        ],
      ),
    );
  }
}

class VoucherSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Voucher'),
          Row(
            children: [
              Text('-3.301.600đ'),
              SizedBox(width: 8.0),
              ElevatedButton(
                onPressed: () {
                  // Handle voucher action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // Background color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    side: BorderSide(color: Colors.blue), // Border color
                  ),
                ),
                child: Text('Miễn phí vận chuyển'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PaymentMethodSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Phương thức thanh toán'),
          Text(
            'Thanh toán khi nhận hàng',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class PaymentDetailSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Chi tiết thanh toán',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Tổng tiền hàng'),
              Text('41.270.000đ'),
            ],
          ),
        ],
      ),
    );
  }
}
