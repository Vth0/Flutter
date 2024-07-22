// ignore_for_file: use_build_context_synchronously, prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/api.dart';
import '../../model/product.dart';
import '../../model/user.dart';
import '../Product/productdetailwidget.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  List<Product> products = [];
  User user = User.userEmpty();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  Future<void> _loadProducts() async {
    setState(() {
      isLoading = true;
    });
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      products = await APIRepository().getProductAdmin(
          prefs.getString('accountID').toString(),
          prefs.getString('token').toString());
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load products: $e')),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Widget _buildProductCard(Product product) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailWidget(product: product),
          ),
        );
      },
      child: SizedBox(
        width: 180,
        child: Card(
          child: Column(
            children: [
              SizedBox(
                height: 5,
              ),
              if (product.imageUrl.isNotEmpty && product.imageUrl != 'Null')
                Container(
                  height: 150,
                  width: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  alignment: Alignment.center,
                  child: Image.network(
                    product.imageUrl,
                    loadingBuilder: (context, child, progress) {
                      return progress == null
                          ? child
                          : const CircularProgressIndicator();
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.error, color: Colors.red);
                    },
                  ),
                )
              else
                Container(
                  height: 150,
                  width: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  alignment: Alignment.center,
                  child: const Icon(Icons.image, color: Colors.grey),
                ),
              const SizedBox(width: 10),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      'Giá: ${product.price}đ',
                      style: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Giá gốc: ${product.price + 100000}đ',
                      style: const TextStyle(
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  // Banner section using CarouselSlider
                  Stack(
                    children: [
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
                            'assets/images/banner1.jpg',
                            fit: BoxFit.cover,
                          ),
                          Image.asset(
                            'assets/images/banner2.jpg',
                            fit: BoxFit.cover,
                          ),
                          // Add more banner images if needed
                        ],
                      ),
                      Positioned(
                        top: 20,
                        left: 20,
                        right: 20,
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search...',
                              prefixIcon: Icon(Icons.search),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 15),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // Flash Sale section
                  Container(
                    color: Colors.yellow[100],
                    padding: const EdgeInsets.all(10),
                    height: 320,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Flash Sale',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.red),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 240,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: products.length,
                            itemBuilder: (context, index) {
                              final product = products[index];
                              return _buildProductCard(product);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Hot Products section
                  Container(
                    color: Colors.purple[100],
                    padding: const EdgeInsets.all(10),
                    height: 320,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Sản phẩm Hot',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 240,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: products.length,
                            itemBuilder: (context, index) {
                              final product = products[index];
                              return _buildProductCard(product);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),

                  //New Product section
                  Container(
                    color: Colors.orange[100],
                    padding: const EdgeInsets.all(10),
                    height: 320,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Sản phẩm mới',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 240,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: products.length,
                            itemBuilder: (context, index) {
                              final product = products[index];
                              return _buildProductCard(product);
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
