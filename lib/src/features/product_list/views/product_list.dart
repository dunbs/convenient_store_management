import 'package:convenient_store_management/src/controller/product_repository.dart';
import 'package:convenient_store_management/src/features/product_list/controllers/product_list_controller.dart';
import 'package:convenient_store_management/src/features/product_list/models/models.dart';
import 'package:convenient_store_management/src/features/product_register/views/product_register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'dart:math' as math;

class ProductList extends ConsumerWidget {
  const ProductList({super.key});

  static const routeName = '/product_list';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(productRepositoryProvider);

    return Scaffold(
      appBar: const _ProductSearchBar(),
      body: const _ProductListContent(),
      floatingActionButton: data.hasValue
          ? FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () async {
                var navigator = Navigator.of(context);

                final barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
                    '#ff6666', 'Cancel', true, ScanMode.QR);

                var product = await ref
                    .read(productRepositoryProvider.notifier)
                    .getProductById(barcodeScanRes);

                navigator.restorablePushNamed(ProductRegister.routeName,
                    arguments: ProductRegisterArgs(
                            id: barcodeScanRes, product: product)
                        .toJson());
              })
          : null,
    );
  }
}

class _ProductSearchBar extends ConsumerStatefulWidget
    implements PreferredSizeWidget {
  const _ProductSearchBar();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      __ProductSearchBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

const double _kMaxTitleTextScaleFactor = 1.34;

class __ProductSearchBarState extends ConsumerState<_ProductSearchBar> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    Widget searchBar = Padding(
      padding: const EdgeInsets.all(8.0),
      child: SearchBar(
        controller: controller,
        padding: const MaterialStatePropertyAll<EdgeInsets>(
            EdgeInsets.symmetric(horizontal: 16.0)),
        leading: const Icon(Icons.search),
        backgroundColor:
            MaterialStateColor.resolveWith((states) => Colors.white),
        hintText: "Tìm kiếm sản phẩm",
        onChanged: (value) {
          ref.read(productListControllerProvider.notifier).filter(
                ProductListFilterArgs(name: value),
              );
        },
      ),
    );

    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    searchBar = MediaQuery(
      data: mediaQueryData.copyWith(
        textScaleFactor: math.min(
          mediaQueryData.textScaleFactor,
          _kMaxTitleTextScaleFactor,
        ),
      ),
      child: searchBar,
    );

    return Semantics(
      container: true,
      child: SafeArea(
        child: Material(
          child: searchBar,
        ),
      ),
    );
  }
}

class _ProductListContent extends ConsumerWidget {
  const _ProductListContent();

  String _formatNumber(num? number) {
    if (number == null) {
      return '- ₫';
    }

    return toCurrencyString(number.toString(),
        trailingSymbol: " ₫", useSymbolPadding: true, mantissaLength: 0);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(productListControllerProvider);

    return data.when(
        data: (data) {
          final products = data.products;
          return ListView.builder(
            restorationId: 'ProductListListView',
            itemCount: products.length,
            itemBuilder: (context, index) {
              var product = products[index];
              return ListTile(
                leading: Container(
                  width: 50,
                  height: double.infinity,
                  alignment: Alignment.center,
                  child:
                      const AspectRatio(aspectRatio: 1, child: Placeholder()),
                ),
                title: Text(product.name ?? "-"),
                subtitle: Text("Giá nhập: ${_formatNumber(product.costPrice)}"),
                trailing: Text(_formatNumber(product.sellingPrice)),
              );
            },
          );
        },
        error: (_, __) => const Center(child: Text("Có lỗi rồi!")),
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
