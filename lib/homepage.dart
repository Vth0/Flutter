import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'phone.dart'; // Import model Phone

class Homepage extends StatelessWidget {
  final List<Phone> phones = [
    Phone(name: 'Phone 1', imageUrl: 'assets/phone1.jpg', currentPrice: 29790000, originalPrice: 32990000),
    Phone(name: 'Phone 2', imageUrl: 'assets/phone2.jpg', currentPrice: 29790000, originalPrice: 32990000),
    Phone(name: 'Phone 3', imageUrl: 'assets/phone3.jpg', currentPrice: 29790000, originalPrice: 32990000),
    Phone(name: 'Phone 4', imageUrl: 'assets/phone4.jpg', currentPrice: 29790000, originalPrice: 32990000),
    Phone(name: 'Phone 5', imageUrl: 'assets/phone5.jpg', currentPrice: 29790000, originalPrice: 32990000),
    Phone(name: 'Phone 6', imageUrl: 'assets/phone6.jpg', currentPrice: 29790000, originalPrice: 32990000),
    Phone(name: 'Phone 7', imageUrl: 'assets/phone7.jpg', currentPrice: 29790000, originalPrice: 32990000),
    Phone(name: 'Phone 8', imageUrl: 'assets/phone8.jpg', currentPrice: 29790000, originalPrice: 32990000),
    Phone(name: 'Phone 9', imageUrl: 'assets/phone9.jpg', currentPrice: 29790000, originalPrice: 32990000),
    Phone(name: 'Phone 10', imageUrl: 'assets/phone10.jpg', currentPrice: 29790000, originalPrice: 32990000),
  ];

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
                  'assets/banner1.jpg', // Thay thế bằng hình ảnh banner của bạn
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/banner2.jpg', // Thay thế bằng hình ảnh banner khác nếu cần
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
                      itemCount: phones.length,
                      itemBuilder: (context, index) {
                        final phone = phones[index];
                        return Container(
                          width: 180,
                          child: Card(
                            child: Column(
                              children: [
                                Image.asset(
                                  phone.imageUrl, // Thay thế bằng hình ảnh sản phẩm của bạn
                                  fit: BoxFit.cover,
                                  height: 100,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(phone.name),
                                      Text(
                                        'Giá: ${phone.currentPrice.toString()}đ',
                                        style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'Giá gốc: ${phone.originalPrice.toString()}đ',
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
                      itemCount: phones.length,
                      itemBuilder: (context, index) {
                        final phone = phones[index];
                        return Container(
                          width: 180,
                          child: Card(
                            child: Column(
                              children: [
                                Image.asset(
                                  phone.imageUrl, // Thay thế bằng hình ảnh sản phẩm của bạn
                                  fit: BoxFit.cover,
                                  height: 100,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(phone.name),
                                      Text(
                                        'Giá: ${phone.currentPrice.toString()}đ',
                                        style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'Giá gốc: ${phone.originalPrice.toString()}đ',
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
