// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_register.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductRegisterArgs _$ProductRegisterArgsFromJson(Map<String, dynamic> json) {
  return _ProductRegisterArgs.fromJson(json);
}

/// @nodoc
mixin _$ProductRegisterArgs {
  String get id => throw _privateConstructorUsedError;
  Product? get product => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductRegisterArgsCopyWith<ProductRegisterArgs> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductRegisterArgsCopyWith<$Res> {
  factory $ProductRegisterArgsCopyWith(
          ProductRegisterArgs value, $Res Function(ProductRegisterArgs) then) =
      _$ProductRegisterArgsCopyWithImpl<$Res, ProductRegisterArgs>;
  @useResult
  $Res call({String id, Product? product});

  $ProductCopyWith<$Res>? get product;
}

/// @nodoc
class _$ProductRegisterArgsCopyWithImpl<$Res, $Val extends ProductRegisterArgs>
    implements $ProductRegisterArgsCopyWith<$Res> {
  _$ProductRegisterArgsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? product = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res>? get product {
    if (_value.product == null) {
      return null;
    }

    return $ProductCopyWith<$Res>(_value.product!, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ProductRegisterArgsCopyWith<$Res>
    implements $ProductRegisterArgsCopyWith<$Res> {
  factory _$$_ProductRegisterArgsCopyWith(_$_ProductRegisterArgs value,
          $Res Function(_$_ProductRegisterArgs) then) =
      __$$_ProductRegisterArgsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, Product? product});

  @override
  $ProductCopyWith<$Res>? get product;
}

/// @nodoc
class __$$_ProductRegisterArgsCopyWithImpl<$Res>
    extends _$ProductRegisterArgsCopyWithImpl<$Res, _$_ProductRegisterArgs>
    implements _$$_ProductRegisterArgsCopyWith<$Res> {
  __$$_ProductRegisterArgsCopyWithImpl(_$_ProductRegisterArgs _value,
      $Res Function(_$_ProductRegisterArgs) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? product = freezed,
  }) {
    return _then(_$_ProductRegisterArgs(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProductRegisterArgs implements _ProductRegisterArgs {
  const _$_ProductRegisterArgs({required this.id, this.product});

  factory _$_ProductRegisterArgs.fromJson(Map<String, dynamic> json) =>
      _$$_ProductRegisterArgsFromJson(json);

  @override
  final String id;
  @override
  final Product? product;

  @override
  String toString() {
    return 'ProductRegisterArgs(id: $id, product: $product)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductRegisterArgs &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.product, product) || other.product == product));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, product);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductRegisterArgsCopyWith<_$_ProductRegisterArgs> get copyWith =>
      __$$_ProductRegisterArgsCopyWithImpl<_$_ProductRegisterArgs>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductRegisterArgsToJson(
      this,
    );
  }
}

abstract class _ProductRegisterArgs implements ProductRegisterArgs {
  const factory _ProductRegisterArgs(
      {required final String id,
      final Product? product}) = _$_ProductRegisterArgs;

  factory _ProductRegisterArgs.fromJson(Map<String, dynamic> json) =
      _$_ProductRegisterArgs.fromJson;

  @override
  String get id;
  @override
  Product? get product;
  @override
  @JsonKey(ignore: true)
  _$$_ProductRegisterArgsCopyWith<_$_ProductRegisterArgs> get copyWith =>
      throw _privateConstructorUsedError;
}
