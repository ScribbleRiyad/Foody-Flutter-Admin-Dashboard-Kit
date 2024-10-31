import 'package:flutter/material.dart';
import 'package:foody/views/my_controller.dart';

class AddRestaurantController extends MyController {
  int fullWidthIndex = 0;
  final TickerProvider tickerProvider;

  late TabController fullWidthTabController = TabController(
      length: 3, vsync: tickerProvider, initialIndex: fullWidthIndex);

  AddRestaurantController(this.tickerProvider){
    fullWidthTabController.addListener(() {
      fullWidthIndex = fullWidthTabController.index;
      update();
    });
  }


}
