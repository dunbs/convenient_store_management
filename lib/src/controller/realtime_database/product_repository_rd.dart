import 'dart:async';

import 'package:convenient_store_management/src/controller/product_repository.dart';
import 'package:convenient_store_management/src/models/product.dart';
import 'package:firebase_database/firebase_database.dart';

class ProductRepositoryRD extends ProductRepository {
  late FirebaseDatabase _firebaseDatabase;

  ProductRepositoryRD() : super.internal() {
    _firebaseDatabase = FirebaseDatabase.instance;
  }

  @override
  FutureOr<bool> addOrUpdateProduct(Product product) async {
    await _firebaseDatabase
        .ref("products")
        .child(product.id)
        .set(product.toJson());

    return true;
  }

  @override
  FutureOr<Map<String, Product>> build() {
    return _firebaseDatabase.ref("products").get().then((snapshot) {
      final result = <String, Product>{};

      final values = snapshot.value as Map<dynamic, dynamic>?;
      values?.forEach((key, value) {
        final json = Map<String, dynamic>.from((value));
        result[key.toString()] = Product.fromJson(json);
      });

      return result;
    });
  }

  @override
  FutureOr<Product?> getProductById(String id) {
    return _firebaseDatabase.ref("products").child(id).once().then((event) {
      final snapshot = event.snapshot;
      if (snapshot.value == null) {
        return null;
      }

      final values = (snapshot.value as Map?);
      final json = Map<String, dynamic>.from(values!);

      return Product.fromJson(json);
    });
  }

  @override
  FutureOr<bool> removeProductById(String id) async {
    final child = _firebaseDatabase.ref("products").child(id);
    final exist = await child
        .once(DatabaseEventType.value)
        .then((value) => value.snapshot.value != null);

    if (exist) {
      await child.remove();
      return true;
    }
    return false;
  }
}
