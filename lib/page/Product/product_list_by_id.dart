// ignore_for_file: library_private_types_in_public_api

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/api.dart';
import '../../model/product.dart';

class ProductListById extends StatefulWidget {
  final int categoryId;

  const ProductListById({super.key, required this.categoryId});

  @override
  _ProductListByIdState createState() => _ProductListByIdState();
}

class _ProductListByIdState extends State<ProductListById> {
  late Future<List<Product>> _futureProducts;

  @override
  void initState() {
    super.initState();
    _futureProducts = _getProductsByCategory();
  }

  Future<List<Product>> _getProductsByCategory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return APIRepository().getProductByCategoryId(
      widget.categoryId.toString(),
      prefs.getString('accountID').toString(),
      prefs.getString('token') ?? '',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: FutureBuilder<List<Product>>(
        future: _futureProducts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Failed to load products: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No products available'));
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final product = snapshot.data![index];
              return Card(
                child: ListTile(
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image(
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                            image: FileImage(File(product.imageUrl)),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Tên sản phẩm: ${product.name}'),
                              Text('Mô tả: ${product.description}'),
                              Text(
                                'Giá: ${NumberFormat('#,##0').format(product.price)}',
                              ),
                              Text('Phân loại: ${product.categoryName}'),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
