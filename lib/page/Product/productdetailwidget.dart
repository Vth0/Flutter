// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_application_smartshop/model/favorite.dart';
import '../../data/sqlite.dart';
import 'package:flutter_application_smartshop/model/product.dart';

class ProductDetailWidget extends StatefulWidget {
  final Product product;

  const ProductDetailWidget({super.key, required this.product});

  @override
  _ProductDetailWidgetState createState() => _ProductDetailWidgetState();
}

class _ProductDetailWidgetState extends State<ProductDetailWidget> {
  bool isFavorite = false;
  DatabaseHelper dbHelper = DatabaseHelper();

  @override
  void initState() {
    super.initState();
    _checkFavoriteStatus();
  }

  Future<void> _checkFavoriteStatus() async {
    bool favoriteStatus = await dbHelper.isFavorite(widget.product.id);
    setState(() {
      isFavorite = favoriteStatus;
    });
  }

  Future<void> _toggleFavorite(Product pro) async {
    try {
      if (isFavorite) {
        await dbHelper.removeFavorite(pro.id); // Implement removeFavorite
      } else {
        await dbHelper.addFavorite(Favorite(
          productID: pro.id,
          name: pro.name,
          des: pro.description,
          price: pro.price,
          img: pro.imageUrl,
        ));
      }
      setState(() {
        isFavorite = !isFavorite;
      });
    } catch (e) {
      // Handle error or show feedback
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.product.imageUrl.isNotEmpty &&
                widget.product.imageUrl != 'Null')
              Container(
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: NetworkImage(widget.product.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                alignment: Alignment.center,
                child: Image.network(
                  widget.product.imageUrl,
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
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                alignment: Alignment.center,
                child: const Icon(Icons.image, color: Colors.grey),
              ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.product.name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () => _toggleFavorite(widget.product),
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : null,
                  ),
                  padding: const EdgeInsets.all(8.0),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Row(
              children: [
                Text(
                  '${widget.product.price}đ',
                  style: const TextStyle(
                    fontSize: 22,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 8.0),
                Text(
                  '${widget.product.price + 100000}đ',
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Thông số kỹ thuật',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            const Text(
              '- Các thông số kỹ thuật của sản phẩm sẽ được hiển thị ở đây.',
            ),
            // Add more details if available
            const SizedBox(height: 16.0),
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
                  // Add action for "Mua hàng" button
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  alignment: Alignment.center,
                  child: const Text('Mua hàng'),
                ),
              ),
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  // Add action for "Thêm vào giỏ hàng" button
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  alignment: Alignment.center,
                  child: const Text('Thêm vào giỏ hàng'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
