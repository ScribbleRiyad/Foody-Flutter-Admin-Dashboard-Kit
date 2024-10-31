
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:foody/helpers/widgets/my_text_utils.dart';
import 'package:foody/views/my_controller.dart';

class ModalController extends MyController {
  late TickerProvider tickerProvider;
  late AnimationController animationController;
  late Animation<double> animation;
  Curve insetAnimationCurve = Curves.bounceIn;
  late Animation<double> curve;

  ModalController(this.tickerProvider);

  List<String> dummyTexts =
      List.generate(12, (index) => MyTextUtils.getDummyText(60));

  @override
  void onInit() {
    animationController = AnimationController(
        vsync: tickerProvider, duration: Duration(milliseconds: 1200));

    animation =
        Tween<double>(begin: 0.0, end: 1.0).animate(animationController);

    animationController.forward();
    super.onInit();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void onChangeAnimation(Curve value) {
    insetAnimationCurve = value;
    update();
  }
}
