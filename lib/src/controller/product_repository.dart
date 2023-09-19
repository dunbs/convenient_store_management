import 'dart:async';

import 'package:convenient_store_management/src/models/models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_repository.g.dart';

@riverpod
abstract class ProductRepository extends _$ProductRepository {
  ProductRepository.internal();

  factory ProductRepository() {
    throw UnimplementedError();
  }

  @override
  FutureOr<Map<String, Product>> build();

  FutureOr<Product?> getProductById(String id);

  FutureOr<bool> addOrUpdateProduct(Product product);

  Stream<bool> removeProducts(List<Product> products) {
    return Stream<bool>.fromFutures(products.map((e) {
      return Future(() => removeProduct(e));
    }));
  }

  FutureOr<bool> removeProduct(Product product) {
    return removeProductById(product.id);
  }

  Stream<bool> removeProductByIds(List<String> ids) {
    return Stream<bool>.fromFutures(ids.map((id) {
      return Future(() => removeProductById(id));
    }));
  }

  FutureOr<bool> removeProductById(String id);
}
