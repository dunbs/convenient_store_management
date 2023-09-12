import 'dart:async';

import 'package:convenient_store_management/src/models/models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_repository.g.dart';

@riverpod
abstract class ProductRepository extends _$ProductRepository {
  @override
  FutureOr<Map<String, Product>> build();

  FutureOr<Product?> getProductById(String id);

  FutureOr<bool> addOrUpdateProduct(Product product);

  Stream<bool> removeProducts(List<Product> products);

  FutureOr<bool> removeProduct(Product product);

  Stream<bool> removeProductByIds(List<String> ids);

  FutureOr<bool> removeProductById(String id);
}
