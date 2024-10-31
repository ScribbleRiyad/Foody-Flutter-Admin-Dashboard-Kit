import 'package:foody/controller/ui/error_pages/coming_soon_controller.dart';
import 'package:foody/helpers/utils/ui_mixins.dart';
import 'package:foody/helpers/widgets/my_container.dart';
import 'package:foody/helpers/widgets/my_spacing.dart';
import 'package:foody/helpers/widgets/my_text.dart';
import 'package:foody/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ComingSoonScreen extends StatefulWidget {
  const ComingSoonScreen({super.key});

  @override
  State<ComingSoonScreen> createState() => _ComingSoonScreenState();
}

class _ComingSoonScreenState extends State<ComingSoonScreen>
    with SingleTickerProviderStateMixin, UIMixin {
  late ComingSoonController controller;

  @override
  void initState() {
    controller = ComingSoonController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      tag: 'coming_soon_controller',
      builder: (controller) {
        String strDigits(int n) => n.toString().padLeft(2, '0');
        final days = strDigits(controller.myDuration.inDays);
        final hours = strDigits(controller.myDuration.inHours.remainder(24));
        final minutes =
            strDigits(controller.myDuration.inMinutes.remainder(60));
        final seconds =
            strDigits(controller.myDuration.inSeconds.remainder(60));
        return Scaffold(
          body: Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            children: [
              Stack(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                fit: StackFit.expand,
                children: [
                  Image.asset(Images.background, fit: BoxFit.cover),
                  Container(color: Colors.black.withOpacity(.6))
                ],
              ),
              // Positioned.fill(
              //   child: FloatingBubbles.alwaysRepeating(
              //     noOfBubbles: 100,
              //     colorsOfBubbles: [
              //       Colors.green,
              //       Colors.red,
              //       Colors.lightGreenAccent,
              //     ],
              //     sizeFactor: 0.010,
              //     paintingStyle: PaintingStyle.fill,
              //     shape: BubbleShape.roundedRectangle,
              //     speed: BubbleSpeed.slow,
              //   ),
              // ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MyText.displayMedium("We Are working on something Awesome!",
                      fontWeight: 600,
                      color: contentTheme.onPrimary,
                      textAlign: TextAlign.center),
                  MySpacing.height(40),
                  Wrap(
                    runSpacing: 16,
                    spacing: 16,
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      timerContainer(days),
                      timerContainer(hours),
                      timerContainer(minutes),
                      timerContainer(seconds),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget timerContainer(String timing) {
    return MyContainer(
      height: 80,
      width: 80,
      paddingAll: 0,
      child: Center(
          child: AnimatedSwitcher(
        duration: Duration(milliseconds: 800),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return ScaleTransition(scale: animation, child: child);
        },
        child: MyText.titleLarge(timing, fontSize: 32, key: ValueKey(timing)),
      )),
    );
  }
}
