import 'package:flutter/material.dart';
import 'package:foody/helpers/widgets/my_text_utils.dart';
import 'package:foody/views/my_controller.dart';

class TabsController extends MyController {
  var defaultIndex = 0,
      fullWidthIndex = 0,
      backgroundIndex = 0,
      borderedIndex = 0,
      softIndex = 0,
      customIndex1 = 0;

  final TickerProvider tickerProvider;

  late TabController defaultTabController = TabController(
      length: 3, vsync: tickerProvider, initialIndex: defaultIndex);
  late TabController fullWidthTabController = TabController(
      length: 3, vsync: tickerProvider, initialIndex: fullWidthIndex);
  late TabController backgroundTabController = TabController(
      length: 3, vsync: tickerProvider, initialIndex: backgroundIndex);
  late TabController borderedTabController = TabController(
      length: 3, vsync: tickerProvider, initialIndex: borderedIndex);
  late TabController softTabController =
      TabController(length: 3, vsync: tickerProvider, initialIndex: softIndex);
  late TabController customTabController1 = TabController(
      length: 3, vsync: tickerProvider, initialIndex: customIndex1);

  List<String> dummyTexts =
      List.generate(12, (index) => MyTextUtils.getDummyText(60));

  TabsController(this.tickerProvider);

  @override
  void onInit() {
    super.onInit();
    defaultTabController.addListener(() {
      if (defaultIndex != defaultTabController.index) {
        defaultIndex = defaultTabController.index;
        update();
      }
    });
    fullWidthTabController.addListener(() {
      if (fullWidthIndex != fullWidthTabController.index) {
        fullWidthIndex = fullWidthTabController.index;
        update();
      }
    });
    backgroundTabController.addListener(() {
      if (backgroundIndex != backgroundTabController.index) {
        backgroundIndex = backgroundTabController.index;
        update();
      }
    });
    borderedTabController.addListener(() {
      if (borderedIndex != borderedTabController.index) {
        borderedIndex = borderedTabController.index;
        update();
      }
    });
    softTabController.addListener(() {
      if (softIndex != softTabController.index) {
        softIndex = softTabController.index;
        update();
      }
    });
    customTabController1.addListener(() {
      if (customIndex1 != customTabController1.index) {
        customIndex1 = customTabController1.index;
        update();
      }
    });
  }
}
