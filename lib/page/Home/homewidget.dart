import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_application_smartshop/model/product.dart';
import 'package:flutter_application_smartshop/page/Product/productdetailwidget.dart';

class HomeWidget extends StatefulWidget {
  HomeWidget({super.key});
  final List<Product> products = [
    Product(name: 'Phone 1', imageUrl: 'assets/images/products/phone1.jpg', currentPrice: 29790000, originalPrice: 32990000),
    Product(name: 'Phone 2', imageUrl: 'assets/images/products/phone2.jpg', currentPrice: 29790000, originalPrice: 32990000),
    Product(name: 'Phone 3', imageUrl: 'assets/images/products/phone3.jpg', currentPrice: 29790000, originalPrice: 32990000),
    Product(name: 'Phone 4', imageUrl: 'assets/images/products/phone4.jpg', currentPrice: 29790000, originalPrice: 32990000),
    Product(name: 'Phone 5', imageUrl: 'assets/images/products/phone5.jpg', currentPrice: 29790000, originalPrice: 32990000),
    Product(name: 'Phone 6', imageUrl: 'assets/images/products/phone6.jpg', currentPrice: 29790000, originalPrice: 32990000),
    Product(name: 'Phone 7', imageUrl: 'assets/images/products/phone7.jpg', currentPrice: 29790000, originalPrice: 32990000),
    Product(name: 'Phone 8', imageUrl: 'assets/images/products/phone8.jpg', currentPrice: 29790000, originalPrice: 32990000),
    Product(name: 'Phone 9', imageUrl: 'assets/images/products/phone9.jpg', currentPrice: 29790000, originalPrice: 32990000),
    Product(name: 'Phone 10', imageUrl: 'assets/images/products/phone10.jpg', currentPrice: 29790000, originalPrice: 32990000),
  ];

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Phần Banner sử dụng CarouselSlider
            CarouselSlider(
              options: CarouselOptions(
                height: 200,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                viewportFraction: 1.0,
              ),
              items: [
                Image.asset(
                  'assets/images/banner1.jpg', // Thay thế bằng hình ảnh banner của bạn
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/images/banner2.jpg', // Thay thế bằng hình ảnh banner khác nếu cần
                  fit: BoxFit.cover,
                ),
                // Thêm các hình ảnh banner khác nếu cần
              ],
            ),
            SizedBox(height: 10),

            // Phần Flash Sale
            Container(
              color: Colors.yellow[100],
              padding: EdgeInsets.all(10),
              height: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Flash Sale',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.red),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.products.length,
                      itemBuilder: (context, index) {
                        final product = widget.products[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductDetailWidget(product: product),
                              ),
                            );
                          },
                          child: Container(
                            width: 180,
                            child: Card(
                              child: Column(
                                children: [
                                  Image.asset(
                                    product.imageUrl, // Thay thế bằng hình ảnh sản phẩm của bạn
                                    fit: BoxFit.cover,
                                    height: 100,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(product.name),
                                        Text(
                                          'Giá: ${product.currentPrice.toString()}đ',
                                          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'Giá gốc: ${product.originalPrice.toString()}đ',
                                          style: TextStyle(
                                            decoration: TextDecoration.lineThrough,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),

            // Phần Sản phẩm Hot
            Container(
              color: Colors.purple[100],
              padding: EdgeInsets.all(10),
              height: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sản phẩm Hot',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.products.length,
                      itemBuilder: (context, index) {
                        final product = widget.products[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductDetailWidget(product: product),
                              ),
                            );
                          },
                          child: Container(
                            width: 180,
                            child: Card(
                              child: Column(
                                children: [
                                  Image.asset(
                                    product.imageUrl, // Thay thế bằng hình ảnh sản phẩm của bạn
                                    fit: BoxFit.cover,
                                    height: 100,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(product.name),
                                        Text(
                                          'Giá: ${product.currentPrice.toString()}đ',
                                          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'Giá gốc: ${product.originalPrice.toString()}đ',
                                          style: TextStyle(
                                            decoration: TextDecoration.lineThrough,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
