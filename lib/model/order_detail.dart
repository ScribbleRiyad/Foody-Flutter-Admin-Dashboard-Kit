import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:foody/helpers/services/json_decoder.dart';
import 'package:foody/model/identifier_model.dart';

class OrderDetail extends IdentifierModel {
  final String name, transaction, deliveryStatus;
  final int orderNo;
  final DateTime time;

  OrderDetail(super.id, this.name, this.transaction, this.deliveryStatus,
      this.orderNo, this.time);

  static OrderDetail fromJSON(Map<String, dynamic> json) {
    JSONDecoder decoder = JSONDecoder(json);

    String name = decoder.getString('name');
    String transaction = decoder.getString('transaction');
    String deliveryStatus = decoder.getString('delivery_status');
    int orderNo = decoder.getInt('order_no');
    DateTime time = decoder.getDateTime('time');

    return OrderDetail(
        decoder.getId, name, transaction, deliveryStatus, orderNo, time);
  }

  static List<OrderDetail> listFromJSON(List<dynamic> list) {
    return list.map((e) => OrderDetail.fromJSON(e)).toList();
  }

  static List<OrderDetail>? _dummyList;

  static Future<List<OrderDetail>> get dummyList async {
    if (_dummyList == null) {
      dynamic data = json.decode(await getData());
      _dummyList = listFromJSON(data);
    }

    return _dummyList!.sublist(0, 30);
  }

  static Future<String> getData() async {
    return await rootBundle.loadString('assets/data/order_detail.json');
  }
}
