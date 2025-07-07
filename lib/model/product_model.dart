    class ProductModel {
      final String id;
      final String title;
      final double price;
      final String imageUrl;
      final String description;

      ProductModel({
        required this.id,
        required this.title,
        required this.price,
        required this.imageUrl,
        required this.description,
      });

      
      factory ProductModel.fromJson(Map<String, dynamic> json) {
        return ProductModel(
          id: json['id'],
          title: json['title'],
          price: (json['price'] as num).toDouble(),
          imageUrl: json['imageUrl'],
          description: json['description'],
        );
      }

      
      Map<String, dynamic> toJson() {
        return {
          'id': id,
          'title': title,
          'price': price,
          'imageUrl': imageUrl,
          'description': description,
        };
      }
    }
