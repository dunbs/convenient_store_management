import 'package:convenient_store_management/src/controller/demo/product_repository_demo.dart';
import 'package:convenient_store_management/src/features/product_register/views/product_register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

class ProductList extends ConsumerWidget {
  const ProductList({super.key});

  static const routeName = '/product_list';

  String _formatNumber(num? number) {
    if (number == null) {
      return '- ₫';
    }

    return toCurrencyString(number.toString(),
        trailingSymbol: " ₫", useSymbolPadding: true, mantissaLength: 0);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var data = ref.watch(productRepositoryDemoProvider);

    return Scaffold(
      body: data.when(
          data: (data) {
            final products = data.entries.map((e) => e.value).toList();
            print(products);
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
                  subtitle:
                      Text("Giá nhập: ${_formatNumber(product.costPrice)}"),
                  trailing: Text(_formatNumber(product.sellingPrice)),
                );
              },
            );
          },
          error: (_, __) => const Center(child: Text("Có lỗi rồi!")),
          loading: () => const Center(
                child: CircularProgressIndicator(),
              )),
      floatingActionButton: data.hasValue
          ? FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () => Navigator.of(context)
                  .restorablePushNamed(ProductRegister.routeName))
          : null,
    );
  }
}
