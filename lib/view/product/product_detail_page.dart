import 'package:flutter/material.dart';
import 'package:flutter_application_smartshop/model/product.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                product.imageUrl,
                height: 300,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              product.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                Text(
                  '${product.currentPrice}đ',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 8.0),
                Text(
                  '${product.originalPrice}đ',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Text(
              'Thông số kỹ thuật',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              '- Các thông số kỹ thuật của sản phẩm sẽ được hiển thị ở đây.',
            ),
            // Thêm các chi tiết khác về sản phẩm nếu cần
            SizedBox(height: 16.0),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  // Thêm hành động cho button Mua hàng
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero, // Đặt padding là zero
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero, // Đặt bo tròn cạnh thành zero
                  ),
                ),
                child: Container(
                  width: double.infinity, // Đảm bảo button rộng hết khoảng trống
                  height: 50, // Điều chỉnh chiều cao của button theo nhu cầu
                  alignment: Alignment.center, // Căn giữa nội dung
                  child: Text('Mua hàng'),
                ),
              ),
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  // Thêm hành động cho button Thêm vào giỏ hàng
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero, // Đặt padding là zero
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero, // Đặt bo tròn cạnh thành zero
                  ),
                ),
                child: Container(
                  width: double.infinity, // Đảm bảo button rộng hết khoảng trống
                  height: 50, // Điều chỉnh chiều cao của button theo nhu cầu
                  alignment: Alignment.center, // Căn giữa nội dung
                  child: Text('Thêm vào giỏ hàng'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
