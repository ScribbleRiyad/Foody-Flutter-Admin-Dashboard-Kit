import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:foody/helpers/services/json_decoder.dart';
import 'package:foody/model/identifier_model.dart';

class ProductData extends IdentifierModel {
  final String image, name;
  final int price, inStock;
  final double star;

  ProductData(
      super.id, this.image, this.name, this.price, this.inStock, this.star);

  static ProductData fromJSON(Map<String, dynamic> json) {
    JSONDecoder decoder = JSONDecoder(json);

    String image = decoder.getString('image');
    String name = decoder.getString('name');
    int price = decoder.getInt('price');
    int inStock = decoder.getInt('inStock');
    double star = decoder.getDouble('star');

    return ProductData(decoder.getId, image, name, price, inStock, star);
  }

  static List<ProductData> listFromJSON(List<dynamic> list) {
    return list.map((e) => ProductData.fromJSON(e)).toList();
  }

  static List<ProductData>? _dummyList;

  static Future<List<ProductData>> get dummyList async {
    if (_dummyList == null) {
      dynamic data = json.decode(await getData());
      _dummyList = listFromJSON(data);
    }

    return _dummyList!.sublist(0, 15);
  }

  static Future<String> getData() async {
    return await rootBundle.loadString('assets/data/product_data.json');
  }
}
