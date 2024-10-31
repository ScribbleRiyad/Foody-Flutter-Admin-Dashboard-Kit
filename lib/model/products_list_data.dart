import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:foody/helpers/services/json_decoder.dart';
import 'package:foody/model/identifier_model.dart';

class ProductsListData extends IdentifierModel {
  final String name, status;
  final double rating;
  final int sku, price;

  ProductsListData(
      super.id, this.name, this.status, this.rating, this.sku, this.price);

  static ProductsListData fromJSON(Map<String, dynamic> json) {
    JSONDecoder decoder = JSONDecoder(json);

    String name = decoder.getString('product_name');
    String status = decoder.getString('status');
    double rating = decoder.getDouble('rating');
    int sku = decoder.getInt('sku');
    int price = decoder.getInt('price');

    return ProductsListData(decoder.getId, name, status, rating, sku, price);
  }

  static List<ProductsListData> listFromJSON(List<dynamic> list) {
    return list.map((e) => ProductsListData.fromJSON(e)).toList();
  }

  static List<ProductsListData>? _dummyList;

  static Future<List<ProductsListData>> get dummyList async {
    if (_dummyList == null) {
      dynamic data = json.decode(await getData());
      _dummyList = listFromJSON(data);
    }

    return _dummyList!.sublist(0, 50);
  }

  static Future<String> getData() async {
    return await rootBundle.loadString('assets/data/products_list.json');
  }
}
