import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:foody/helpers/services/json_decoder.dart';
import 'package:foody/images.dart';
import 'package:foody/model/identifier_model.dart';

class RestaurantData extends IdentifierModel {
  final String name, address, email, phoneNumber, image;
  final int totalProduct, totalSales;

  RestaurantData(super.id, this.name, this.address, this.email,
      this.phoneNumber, this.totalProduct, this.totalSales, this.image);

  static RestaurantData fromJSON(Map<String, dynamic> json) {
    JSONDecoder decoder = JSONDecoder(json);

    String name = decoder.getString('name');
    String address = decoder.getString('address');
    String email = decoder.getString('email');
    String phoneNumber = decoder.getString('phone_number');
    int totalProduct = decoder.getInt('total_product');
    int totalSales = decoder.getInt('total_sales');
    String image = Images.randomImage(Images.restaurantLogo);

    return RestaurantData(decoder.getId, name, address, email, phoneNumber,
        totalProduct, totalSales, image);
  }

  static List<RestaurantData> listFromJSON(List<dynamic> list) {
    return list.map((e) => RestaurantData.fromJSON(e)).toList();
  }

  static List<RestaurantData>? _dummyList;

  static Future<List<RestaurantData>> get dummyList async {
    if (_dummyList == null) {
      dynamic data = json.decode(await getData());
      _dummyList = listFromJSON(data);
    }

    return _dummyList!.sublist(0, 50);
  }

  static Future<String> getData() async {
    return await rootBundle.loadString('assets/data/restaurant_data.json');
  }
}
