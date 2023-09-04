// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_register.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductRegisterArgs _$$_ProductRegisterArgsFromJson(
        Map<String, dynamic> json) =>
    _$_ProductRegisterArgs(
      id: json['id'] as String,
      product: json['product'] == null
          ? null
          : Product.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ProductRegisterArgsToJson(
        _$_ProductRegisterArgs instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product': instance.product?.toJson(),
    };
