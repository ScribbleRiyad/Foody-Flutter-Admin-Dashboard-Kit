import 'package:flutter/material.dart';
import 'package:foody/helpers/widgets/my_text_utils.dart';
import 'package:foody/model/order_list.dart';
import 'package:foody/views/my_controller.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:foody/views/ui/restaurants/restaurant_detail_screen.dart';

class ChartSampleData {
  ChartSampleData(
      {this.x,
      this.y,
      this.xValue,
      this.yValue,
      this.secondSeriesYValue,
      this.thirdSeriesYValue,
      this.pointColor,
      this.size,
      this.text,
      this.open,
      this.close,
      this.low,
      this.high,
      this.volume});

  final dynamic x;
  final num? y;
  final dynamic xValue;
  final num? yValue;
  final num? secondSeriesYValue;
  final num? thirdSeriesYValue;
  final Color? pointColor;
  final num? size;
  final String? text;
  final num? open;
  final num? close;
  final num? low;
  final num? high;
  final num? volume;
}

class RestaurantsDetailController extends MyController {
  List<OrderList> orderList = [];

  DataTableSource? data;

  List<String> dummyTexts =
      List.generate(12, (index) => MyTextUtils.getDummyText(60));

  String selectedTimeByLocation = "Year";
  String selectedPrice = "Popular";
  String selectedUploadDate = "All";
  String selectedScoreStatus = "Average";
  String selectedCategory = "All";

  void onSelectedTimeByLocation(String time) {
    selectedTimeByLocation = time;
    update();
  }

  void onSelectedPrice(String price) {
    selectedPrice = price;
    update();
  }

  void onSelectedUploadDate(String date) {
    selectedUploadDate = date;
    update();
  }

  void onSelectedScoreStatus(String status) {
    selectedScoreStatus = status;
    update();
  }

  void onSelectedCategory(String category) {
    selectedCategory = category;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    OrderList.dummyList.then((value) {
      orderList = value.sublist(0, 40);
      data = MyData(orderList);
      update();
    });
  }

  final List<ChartSampleData> chartData = [
    ChartSampleData(x: 'Jan', y: 10, yValue: 1000),
    ChartSampleData(x: 'Fab', y: 20, yValue: 2000),
    ChartSampleData(x: 'Mar', y: 15, yValue: 1500),
    ChartSampleData(x: 'Jun', y: 5, yValue: 500),
    ChartSampleData(x: 'Jul', y: 30, yValue: 3000),
    ChartSampleData(x: 'Aug', y: 20, yValue: 2000),
    ChartSampleData(x: 'Sep', y: 40, yValue: 4000),
    ChartSampleData(x: 'Oct', y: 60, yValue: 6000),
    ChartSampleData(x: 'Nov', y: 55, yValue: 5500),
    ChartSampleData(x: 'Dec', y: 38, yValue: 3000),
  ];
  final TooltipBehavior chart = TooltipBehavior(
    enable: true,
    format: 'point.x : point.yValue1 : point.yValue2',
  );

  @override
  void onThemeChanged() {
    data = MyData(orderList);
    update();
  }
}
