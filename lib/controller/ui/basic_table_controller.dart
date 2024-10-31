import 'dart:math';

import 'package:foody/helpers/extention/string.dart';
import 'package:foody/helpers/widgets/my_text_utils.dart';
import 'package:flutter/material.dart';
import 'package:foody/model/visitor_by_channels_model.dart';
import 'package:foody/views/my_controller.dart';
import 'package:foody/views/ui/basic_table_screen.dart';

class BasicTableController extends MyController {
  List<Data> datas = Data.factory();
  DataTableSource? data;
  List<VisitorByChannelsModel> visitorByChannel = [];

  @override
  void onInit() {
    super.onInit();
    VisitorByChannelsModel.dummyList.then((value) {
      visitorByChannel = value;
    data = MyData(datas);
      update();
    });
  }

  void removeData(index) {
    visitorByChannel.removeAt(index);
    update();
  }

  @override
  void onThemeChanged(){
    data  = MyData(datas);
  }
}

class Data {
  final int id, qty;
  final String name;
  final String code;
  final double amount;

  Data(this.id, this.qty, this.name, this.code, this.amount);

  static factory([int seeds = 30]) {
    return List.generate(
        seeds,
        (index) => Data(
            index + 1,
            Random().nextInt(100),
            MyTextUtils.getDummyText(2, withStop: false),
            MyTextUtils.getDummyText(1, withStop: false).toLowerCase(),
            (Random().nextDouble() * 100).toStringAsPrecision(2).toDouble()));
  }
}
