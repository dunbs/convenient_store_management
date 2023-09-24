import 'dart:async';

import 'package:convenient_store_management/src/controller/product_repository.dart';
import 'package:convenient_store_management/src/exceptions/server_exception.dart';
import 'package:convenient_store_management/src/features/product_list/models/product_list_dao.dart';
import 'package:convenient_store_management/src/features/product_list/models/product_list_filter_args.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_list_controller.g.dart';

@riverpod
class ProductListController extends _$ProductListController {
  ProductListFilterArgs? _filterArgs;

  late ProductListDao productListDao;

  @override
  FutureOr<ProductListDao> build() {
    var productsFuture = ref.watch(productRepositoryProvider.future);

    return productsFuture.then((productMap) {
      var products = productMap.values;
      if (_filterArgs != null) {
        products = products.where((product) =>
            product.name
                ?.toLowerCase()
                .contains(_filterArgs!.name.toLowerCase()) ??
            false);
      }

      productListDao = ProductListDao(
        products: products.toList(growable: false),
      );

      return productListDao;
    }).onError((error, stackTrace) => throw ServerException("Lỗi server!"));
  }

  void filter(ProductListFilterArgs filterArgs) {
    _filterArgs = filterArgs;
    ref.invalidateSelf();
  }
}
