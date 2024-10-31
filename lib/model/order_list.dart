import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:foody/helpers/services/json_decoder.dart';
import 'package:foody/model/identifier_model.dart';

class OrderList extends IdentifierModel {
  final String foodName, status;
  final double rating, amount;
  final int orderId;
  final DateTime dateTime;

  OrderList(super.id, this.foodName, this.rating, this.amount, this.orderId,
      this.dateTime, this.status);

  static OrderList fromJSON(Map<String, dynamic> json) {
    JSONDecoder decoder = JSONDecoder(json);

    String foodName = decoder.getString('food_name');
    String status = decoder.getString('status');
    double rating = decoder.getDouble('rating');
    double amount = decoder.getDouble('amount');
    int orderId = decoder.getInt('order_id');
    DateTime dateTime = decoder.getDateTime('date_time');

    return OrderList(
        decoder.getId, foodName, rating, amount, orderId, dateTime, status);
  }

  static List<OrderList> listFromJSON(List<dynamic> list) {
    return list.map((e) => OrderList.fromJSON(e)).toList();
  }

  static List<OrderList>? _dummyList;

  static Future<List<OrderList>> get dummyList async {
    if (_dummyList == null) {
      dynamic data = json.decode(await getData());
      _dummyList = listFromJSON(data);
    }

    return _dummyList!.sublist(0, 50);
  }

  static Future<String> getData() async {
    return await rootBundle.loadString('assets/data/order_list.json');
  }
}
