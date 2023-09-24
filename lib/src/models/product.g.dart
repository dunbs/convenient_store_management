// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Product _$$_ProductFromJson(Map<String, dynamic> json) => _$_Product(
      id: json['id'] as String,
      name: json['name'] as String?,
      costPrice: (json['costPrice'] as num?)?.toDouble(),
      sellingPrice: (json['sellingPrice'] as num).toDouble(),
      quantity: json['quantity'] as int?,
      unit: json['unit'] as String?,
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$$_ProductToJson(_$_Product instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'costPrice': instance.costPrice,
      'sellingPrice': instance.sellingPrice,
      'quantity': instance.quantity,
      'unit': instance.unit,
      'imageUrl': instance.imageUrl,
    };
