import 'package:flutter/animation.dart';
import 'package:foody/model/order_detail.dart';
import 'package:foody/views/my_controller.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

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

class DashboardController extends MyController {
  late String shaderType;
  late List<Color> colors;

  late List<double> stops;

  List<OrderDetail> ordersDetail = [];

  @override
  void onInit() {
    OrderDetail.dummyList.then((value) {
      ordersDetail = value.sublist(0, 5);
      update();
    });
    super.onInit();
  }

  final List<ChartSampleData> chartData = [
    ChartSampleData(x: 'Jan', y: 10),
    ChartSampleData(x: 'Fab', y: 20),
    ChartSampleData(x: 'Mar', y: 15),
    ChartSampleData(x: 'Apr', y: 22),
    ChartSampleData(x: 'May', y: 10),
    ChartSampleData(x: 'Jun', y: 5),
    ChartSampleData(x: 'Jul', y: 30),
    ChartSampleData(x: 'Aug', y: 20),
    ChartSampleData(x: 'Sep', y: 40),
    ChartSampleData(x: 'Oct', y: 60),
    ChartSampleData(x: 'Nov', y: 55),
    ChartSampleData(x: 'Dec', y: 38),
  ];
  final TooltipBehavior chart = TooltipBehavior(
    enable: true,
    format: 'point.x : point.yValue1 : point.yValue2',
  );
}
