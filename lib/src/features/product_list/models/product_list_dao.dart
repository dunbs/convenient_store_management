import 'dart:typed_data';

import 'package:convenient_store_management/src/models/models.dart';

class ProductListDao {
  final List<Product> products;

  int get count => products.length;

  const ProductListDao({required this.products});
}
