import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:foody/helpers/services/json_decoder.dart';
import 'package:foody/model/identifier_model.dart';

class CustomersList extends IdentifierModel {
  final String customerName, email, phone, status;
  final int order;
  final double totalOrders;
  final DateTime customerSince;

  CustomersList(super.id, this.customerName, this.email, this.phone,
      this.status, this.order, this.totalOrders, this.customerSince);

  static CustomersList fromJSON(Map<String, dynamic> json) {
    JSONDecoder decoder = JSONDecoder(json);

    String customerName = decoder.getString('customer_name');
    String email = decoder.getString('email');
    String phone = decoder.getString('phone');
    String status = decoder.getString('status');
    int order = decoder.getInt('order');
    double totalOrders = decoder.getDouble('total_orders');
    DateTime customerSince = decoder.getDateTime('customer_since');

    return CustomersList(decoder.getId, customerName, email, phone, status,
        order, totalOrders, customerSince);
  }

  static List<CustomersList> listFromJSON(List<dynamic> list) {
    return list.map((e) => CustomersList.fromJSON(e)).toList();
  }

  static List<CustomersList>? _dummyList;

  static Future<List<CustomersList>> get dummyList async {
    if (_dummyList == null) {
      dynamic data = json.decode(await getData());
      _dummyList = listFromJSON(data);
    }

    return _dummyList!.sublist(0, 50);
  }

  static Future<String> getData() async {
    return await rootBundle.loadString('assets/data/customers_list.json');
  }
}
