class Product {
  final String name;
  final String imageUrl;
  final double currentPrice;
  final double originalPrice;

  Product({
    required this.name,
    required this.imageUrl,
    required this.currentPrice,
    required this.originalPrice,
  });
  // Add a method to convert a product to a map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'imageUrl': imageUrl,
      'currentPrice': currentPrice,
      'originalPrice': originalPrice,
    };
  }

  // Add a method to create a product from a map
  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'],
      imageUrl: map['imageUrl'],
      currentPrice: map['currentPrice'],
      originalPrice: map['originalPrice'],
    );
  }
}

