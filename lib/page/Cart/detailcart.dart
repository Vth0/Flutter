import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/api.dart';
import '../../data/sqlite.dart';
import '../../model/cart.dart';

class Detailcart extends StatefulWidget {
  const Detailcart({super.key});

  @override
  State<Detailcart> createState() => _DetailcartState();
}

class _DetailcartState extends State<Detailcart> {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  Future<List<Cart>> _getProducts() async {
    return await _databaseHelper.products();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 11,
            child: FutureBuilder<List<Cart>>(
              future: _getProducts(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(
                    child: Text('Không có sản phẩm nào trong giỏ hàng'),
                  );
                }
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final itemProduct = snapshot.data![index];
                      return _buildProduct(itemProduct, context);
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                textStyle: const TextStyle(fontSize: 18),
              ),
              onPressed: () async {
                SharedPreferences pref = await SharedPreferences.getInstance();
                List<Cart> temp = await _databaseHelper.products();
                await APIRepository()
                    .addBill(temp, pref.getString('token').toString());
                setState(() {
                  _databaseHelper.clear();
                });
              },
              child: const Text(
                "Thanh toán",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProduct(Cart pro, BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            if (pro.img.isNotEmpty && pro.img != 'Null')
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: NetworkImage(pro.img),
                    fit: BoxFit.cover,
                  ),
                ),
                alignment: Alignment.center,
                child: Image.network(
                  pro.img,
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
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                alignment: Alignment.center,
                child: const Icon(Icons.image, color: Colors.grey),
              ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pro.name,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    NumberFormat('###,###.0').format(pro.price),
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text('Số lượng: ${pro.count}'),
                  Text(
                    'Mô tả: ${pro.des}',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  _databaseHelper.minus(pro);
                });
              },
              icon: Icon(
                Icons.remove_circle_outline,
                color: Colors.yellow.shade800,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  _databaseHelper.deleteProduct(pro.productID);
                });
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  _databaseHelper.add(pro);
                });
              },
              icon: Icon(
                Icons.add_circle_outline,
                color: Colors.yellow.shade800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
