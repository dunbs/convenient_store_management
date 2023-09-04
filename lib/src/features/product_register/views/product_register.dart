import 'package:convenient_store_management/src/controller/controller.dart';
import 'package:convenient_store_management/src/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class ProductRegister extends ConsumerStatefulWidget {
  const ProductRegister({super.key});

  static const routeName = '/product_register';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProductRegisterState();
}

class _ProductRegisterState extends ConsumerState<ProductRegister> {
  String? _productName;
  int? _costPrice;
  int _sellingPrice = 0;
  int? _inStock;

  final _formKey = GlobalKey<FormState>();
  final currencyFormater = CurrencyInputFormatter(
      mantissaLength: 0, trailingSymbol: '₫', useSymbolPadding: true);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () async {
                var product = Product(
                    id: UniqueKey().toString(),
                    name: _productName,
                    costPrice: _costPrice?.roundToDouble(),
                    sellingPrice: _sellingPrice.roundToDouble(),
                    inStock: _inStock);

                var navigator = Navigator.of(context);

                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) {
                    return Container(
                      color: Colors.grey,
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      ),
                    );
                  },
                );

                await ref
                    .read(productRepositoryDemoProvider.notifier)
                    .addOrUpdateProduct(product);

                navigator.pop();
                navigator.pop();
              },
              icon: const Icon(Icons.done),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              const SizedBox(height: 30),
              const _PlaceholderWithText(
                text: "Chụp ảnh",
                height: 300,
              ),
              const SizedBox(height: 30),
              TextFormField(
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Tên sản phẩm ',
                    hintText: '(có thể trống)'),
                onChanged: (newValue) => _productName = newValue,
              ),
              const SizedBox(height: 30),
              TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Giá nhập ',
                  hintText: '(có thể trống)',
                ),
                inputFormatters: [currencyFormater],
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                onChanged: (newValue) =>
                    _costPrice = int.parse(toNumericString(newValue)),
              ),
              const SizedBox(height: 30),
              TextFormField(
                initialValue: '0 ₫',
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Giá bán* ',
                ),
                inputFormatters: [currencyFormater],
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                onChanged: (newValue) {
                  _sellingPrice = newValue.isEmpty
                      ? 0
                      : int.parse(toNumericString(newValue));
                },
              ),
              const SizedBox(height: 30),
              TextFormField(
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Số lượng ',
                    hintText: '(có thể trống)'),
                inputFormatters: [MaskedInputFormatter('000,000,000,000')],
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                // onChanged: (newValue) =>
                //     _inStock = int.parse(toNumericString(newValue)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PlaceholderWithText extends StatelessWidget {
  final double? width;
  final double? height;
  final String text;

  const _PlaceholderWithText(
      // ignore: unused_element
      {super.key,
      // ignore: unused_element
      this.width,
      // ignore: unused_element
      this.height,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Placeholder(),
          Text(text),
        ],
      ),
    );
  }
}

class _CurrencyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    double value = double.parse(newValue.text);

    final formatter = NumberFormat.simpleCurrency(locale: "vi");

    String newText = formatter.format(value);

    return newValue.copyWith(
      text: newText,
    );
  }
}
