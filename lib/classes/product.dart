class Product {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final Map rating;

  Product(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.category,
      required this.image,
      required this.rating});

  factory Product.fromJson(Map product) {
    return Product(
        id: product['id'],
        title: product['title'],
        price: double.parse(product['price'].toString()),
        description: product['description'],
        category: product['category'],
        image: product['image'],
        rating: product['rating']);
  }
}
