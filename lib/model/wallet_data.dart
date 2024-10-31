import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:foody/helpers/services/json_decoder.dart';
import 'package:foody/model/identifier_model.dart';

class WalletData extends IdentifierModel {
  final String assets, type, status;
  final int amount;
  final DateTime date;

  WalletData(
      super.id, this.assets, this.type, this.status, this.amount, this.date);

  static WalletData fromJSON(Map<String, dynamic> json) {
    JSONDecoder decoder = JSONDecoder(json);

    String assets = decoder.getString('assets');
    String type = decoder.getString('type');
    String status = decoder.getString('status');
    int amount = decoder.getInt('amount');
    DateTime date = decoder.getDateTime('date');

    return WalletData(decoder.getId, assets, type, status, amount, date);
  }

  static List<WalletData> listFromJSON(List<dynamic> list) {
    return list.map((e) => WalletData.fromJSON(e)).toList();
  }

  static List<WalletData>? _dummyList;

  static Future<List<WalletData>> get dummyList async {
    if (_dummyList == null) {
      dynamic data = json.decode(await getData());
      _dummyList = listFromJSON(data);
    }

    return _dummyList!.sublist(0, 50);
  }

  static Future<String> getData() async {
    return await rootBundle.loadString('assets/data/wallet.json');
  }
}
