import 'package:ecommerce/model/product_model.dart';
import 'package:ecommerce/services/product_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';

class ProductProvider extends ChangeNotifier{
  List<ProductModel> _products = [];
  List<ProductModel> get products => _products;

  ProductServices _services = ProductServices();

  ProductProvider(){
    fetchProduct();
  }

  Future<void> fetchProduct() async {
    _products = await _services.fetchProduct();
    notifyListeners();
  }

  Future<bool> addProduct(String title, double price, String imageUrl, String description) async {
    final product = ProductModel(
    id: Uuid().v4(), 
    title: title, 
    price: price, 
    imageUrl: imageUrl, 
    description: description
    );

    await _services.addProduct(product);
    notifyListeners();
    return true;
  }

  Future<void> deleteProduct(String id) async {
    await _services.deleteProduct(id);
    notifyListeners();
    fetchProduct();
    notifyListeners();
  }

  Future<void> updateProduct(ProductModel product) async {
    await _services.updateProduct(product);
    notifyListeners();
    fetchProduct();
    notifyListeners();
  }
}