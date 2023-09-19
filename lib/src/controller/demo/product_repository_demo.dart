import 'dart:async';

import 'package:convenient_store_management/src/controller/product_repository.dart';
import 'package:convenient_store_management/src/models/models.dart';

class ProductRepositoryDemo extends ProductRepository {
  final Map<String, Product> products = {};

  ProductRepositoryDemo() : super.internal();

  @override
  FutureOr<Map<String, Product>> build() async {
    return products;
  }

  @override
  FutureOr<Product?> getProductById(String id) {
    return products[id];
  }

  @override
  FutureOr<bool> addOrUpdateProduct(Product product) {
    products[product.id] = product;
    update((p0) => products);
    return true;
  }

  @override
  FutureOr<bool> removeProductById(String id) {
    var result = products.remove(id) != null;
    if (result) {
      update((p0) => products);
    }
    return result;
  }
}
