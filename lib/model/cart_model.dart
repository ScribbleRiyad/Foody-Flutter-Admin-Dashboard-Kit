import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:foody/helpers/services/json_decoder.dart';
import 'package:foody/model/identifier_model.dart';

class CartData extends IdentifierModel {
  final String image, name;
  int price, quantity, subTotal;

  CartData(super.id, this.image, this.name, this.price, this.quantity,
      this.subTotal);

  static CartData fromJSON(Map<String, dynamic> json) {
    JSONDecoder decoder = JSONDecoder(json);

    String image = decoder.getString('image');
    String name = decoder.getString('name');
    int price = decoder.getInt('price');
    int quantity = decoder.getInt('quantity');
    int subTotal = decoder.getInt('sub_total');

    return CartData(decoder.getId, image, name, price, quantity, subTotal);
  }

  static List<CartData> listFromJSON(List<dynamic> list) {
    return list.map((e) => CartData.fromJSON(e)).toList();
  }

  static List<CartData>? _dummyList;

  static Future<List<CartData>> get dummyList async {
    if (_dummyList == null) {
      dynamic data = json.decode(await getData());
      _dummyList = listFromJSON(data);
    }

    return _dummyList!.sublist(0, 7);
  }

  static Future<String> getData() async {
    return await rootBundle.loadString('assets/data/cart_data.json');
  }
}
