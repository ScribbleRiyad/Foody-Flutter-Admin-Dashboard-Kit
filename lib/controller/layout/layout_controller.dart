import 'package:flutter/material.dart';
import 'package:foody/helpers/theme/theme_customizer.dart';
import 'package:foody/views/my_controller.dart';

class LayoutController extends MyController {
  ThemeCustomizer themeCustomizer = ThemeCustomizer();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  final GlobalKey<State<StatefulWidget>> scrollKey = GlobalKey();
  
  @override
  void onReady() {
    super.onReady();
    ThemeCustomizer.addListener(onChangeTheme);
  }

  void onChangeTheme(ThemeCustomizer oldVal, ThemeCustomizer newVal) {
    themeCustomizer = newVal;
    update();

    if (newVal.rightBarOpen) {
      scaffoldKey.currentState?.openEndDrawer();
    } else {
      scaffoldKey.currentState?.closeEndDrawer();
    }
  }

  @override
  void dispose() {
    super.dispose();
    ThemeCustomizer.removeListener(onChangeTheme);
  }
}
