import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_application_smartshop/model/product.dart';

class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({super.key});

  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  List<Product> favoriteProducts = [];
  @override
  void initState() {
    super.initState();
    _loadFavoriteProducts();
  }
  void _loadFavoriteProducts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Set<String> keys = prefs.getKeys();
    List<Product> loadedProducts = [];

    for (String key in keys) {
      String? productJson = prefs.getString(key);
      if (productJson != null) {
        Map<String, dynamic> productMap = json.decode(productJson);
        Product product = Product.fromMap(productMap);
        loadedProducts.add(product);
      }
    }

    setState(() {
      favoriteProducts = loadedProducts;
    });
  }

  void _removeFavorite(Product product) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(product.name);  // Assuming the product name is unique

    setState(() {
      favoriteProducts.remove(product);
    });
  }
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yêu thích"),
      ),
      body: ListView.builder(
        itemCount: favoriteProducts.length,
        itemBuilder: (context, index) {
          final product = favoriteProducts[index];
          return Card(
            child: ListTile(
              leading: Image.asset(product.imageUrl, width: 50, height: 50),
              title: Text(product.name),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${product.currentPrice}đ',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${product.originalPrice}đ',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: () {
                      // Add to cart functionality
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.favorite, color: Colors.red),
                    onPressed: () {
                      _removeFavorite(product);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}