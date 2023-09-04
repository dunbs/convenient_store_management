import 'dart:async';

import 'package:convenient_store_management/src/controller/product_repository.dart';
import 'package:convenient_store_management/src/models/models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_repository_demo.g.dart';

@Riverpod(keepAlive: true)
class ProductRepositoryDemo extends _$ProductRepositoryDemo
    implements ProductRepository {
  final Map<String, Product> products = {};

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
  Stream<bool> removeProducts(List<Product> products) {
    return Stream<bool>.fromFutures(products.map((e) {
      return Future(() => removeProduct(e));
    }));
  }

  @override
  FutureOr<bool> removeProduct(Product product) {
    return removeProductById(product.id);
  }

  @override
  Stream<bool> removeProductByIds(List<String> ids) {
    return Stream<bool>.fromFutures(ids.map((id) {
      return Future(() => removeProductById(id));
    }));
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
