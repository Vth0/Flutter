import 'package:flutter/material.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({super.key});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phân loại sản phẩm'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            _buildCategoryCard(
              context,
              'Điện thoại',
              'assets/images/phone.png',
            ),
            _buildCategoryCard(
              context,
              'Laptop',
              'assets/images/laptop.png',
            ),
            _buildCategoryCard(
              context,
              'Tablet',
              'assets/images/tablet.png',
            ),
            _buildCategoryCard(
              context,
              'Đồng hồ',
              'assets/images/watch.png',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard(
      BuildContext context, String title, String imagePath) {
    return GestureDetector(
      onTap: () {
        // Xử lý sự kiện khi nhấn vào mục
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(10.0)),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  title,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
