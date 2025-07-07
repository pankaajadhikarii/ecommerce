import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/model/product_model.dart';

class ProductServices {
  final _collection = FirebaseFirestore.instance.collection("product");

  Future<void> addProduct(ProductModel product) async {
    await _collection.doc(product.id).set(product.toJson());
  }

  Future<List<ProductModel>> fetchProduct() async {
    final snapshot = await _collection.get();
    return snapshot.docs.map((d) => ProductModel.fromJson(d.data())).toList();
  }

  Future<void> deleteProduct(String id) async {
    await _collection.doc(id).delete();
  }

  Future<void> updateProduct(ProductModel product) async {
    await _collection.doc(product.id).update(product.toJson());
  }
}