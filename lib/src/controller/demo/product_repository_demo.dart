import 'dart:async';

import 'package:convenient_store_management/src/controller/product_repository.dart';
import 'package:convenient_store_management/src/models/models.dart';

class ProductRepositoryDemo extends ProductRepository {
  final Map<String, Product> products = const {
    "1": Product(
      id: "1",
      name: "Coca Cola",
      sellingPrice: 10000,
      quantity: 10,
      unit: "can",
    ),
    "2": Product(
      id: "2",
      name: "Pepsi",
      sellingPrice: 10000,
      quantity: 10,
      unit: "can",
    ),
    "3": Product(
      id: "3",
      name: "Fanta",
      sellingPrice: 20000,
      quantity: 10,
      unit: "can",
    ),
    "4": Product(
      id: "4",
      name: "7up",
      sellingPrice: 20000,
      quantity: 10,
      unit: "can",
    ),
    "5": Product(
      id: "5",
      name: "Mirinda",
      sellingPrice: 20000,
      quantity: 10,
      unit: "can",
    ),
  };

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
