class ProductModel {
  final String id, title, description;
  final String? imageUrl;
  final double price;

  const ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.price,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'].toString(),
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      imageUrl: json['thumbnail'] ?? '',
      price: (json['price'] as num).toDouble(),
    );
  }
}
