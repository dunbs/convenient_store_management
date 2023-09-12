import 'package:convenient_store_management/src/controller/controller.dart';
import 'package:convenient_store_management/src/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'product_register.freezed.dart';
part 'product_register.g.dart';

@freezed
class ProductRegisterArgs with _$ProductRegisterArgs {
  const factory ProductRegisterArgs({required String id, Product? product}) =
      _ProductRegisterArgs;

  factory ProductRegisterArgs.fromJson(Map<String, dynamic> json) =>
      _$ProductRegisterArgsFromJson(json);
}

class ProductRegister extends ConsumerStatefulWidget {
  final String id;
  final Product? product;
  const ProductRegister({super.key, required this.id, this.product});
  ProductRegister.fromArgs({super.key, required ProductRegisterArgs args})
      : id = args.id,
        product = args.product;
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
  void initState() {
    super.initState();

    _productName = widget.product?.name;
    _costPrice = widget.product?.costPrice?.round();
    _sellingPrice = widget.product?.sellingPrice.round() ?? 0;
    _inStock = widget.product?.inStock?.round();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () async {
                final product = Product(
                    id: widget.id,
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
                    .read(productRepositoryProvider.notifier)
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
                initialValue: _productName,
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Tên sản phẩm ',
                    hintText: '(có thể trống)'),
                onChanged: (newValue) => _productName = newValue,
              ),
              const SizedBox(height: 30),
              TextFormField(
                initialValue: _costPrice?.toCurrencyString(
                    mantissaLength: 0,
                    trailingSymbol: '₫',
                    useSymbolPadding: true),
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
                initialValue: _sellingPrice.toCurrencyString(
                    mantissaLength: 0,
                    trailingSymbol: '₫',
                    useSymbolPadding: true),
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
                initialValue: _inStock.toString().toCurrencyString(),
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Số lượng ',
                    hintText: '(có thể trống)'),
                inputFormatters: [CurrencyInputFormatter(mantissaLength: 0)],
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
