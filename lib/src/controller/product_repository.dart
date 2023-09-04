import 'dart:async';

import 'package:convenient_store_management/src/models/models.dart';

abstract class ProductRepository {
  FutureOr<Product> getProductById(String id);

  FutureOr<bool> addOrUpdateProduct(Product product);

  Stream<bool> removeProducts(List<Product> products);

  FutureOr<bool> removeProduct(Product product);

  Stream<bool> removeProductByIds(List<String> ids);

  FutureOr<bool> removeProductById(String id);
}
