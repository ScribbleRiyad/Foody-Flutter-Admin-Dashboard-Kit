import 'package:foody/controller/ui/forms/slider_controller.dart';
import 'package:foody/helpers/utils/my_shadow.dart';
import 'package:foody/helpers/utils/ui_mixins.dart';
import 'package:foody/helpers/widgets/my_breadcrumb.dart';
import 'package:foody/helpers/widgets/my_breadcrumb_item.dart';
import 'package:foody/helpers/widgets/my_card.dart';
import 'package:foody/helpers/widgets/my_flex.dart';
import 'package:foody/helpers/widgets/my_flex_item.dart';
import 'package:foody/helpers/widgets/my_spacing.dart';
import 'package:foody/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:foody/helpers/widgets/responsive.dart';
import 'package:foody/views/layout/layout.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({super.key});

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> with SingleTickerProviderStateMixin, UIMixin {
  late SliderController controller;

  @override
  void initState() {
    controller = SliderController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: GetBuilder(
        init: controller,
        tag: 'slider_controller',
        builder: (controller) {
          return Column(
            children: [
              Padding(
                padding: MySpacing.x(flexSpacing),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText.titleMedium("Slider", fontSize: 18, fontWeight: 600),
                    MyBreadcrumb(
                      children: [MyBreadcrumbItem(name: 'Form'), MyBreadcrumbItem(name: 'Slider', active: true)],
                    ),
                  ],
                ),
              ),
              MySpacing.height(flexSpacing),
              Padding(
                padding: MySpacing.x(flexSpacing / 2),
                child: MyFlex(
                  children: [
                    MyFlexItem(sizes: 'lg-3 md-6', child: _labelSlider()),
                    MyFlexItem(sizes: 'lg-3 md-6', child: _tickSlider()),
                    MyFlexItem(sizes: 'lg-3 md-6', child: _dividerSlider()),
                    MyFlexItem(sizes: 'lg-3 md-6', child: _yearSlider()),
                    MyFlexItem(sizes: 'lg-3 md-6', child: _hourSlider()),
                    MyFlexItem(sizes: 'lg-3 md-6', child: _stepDurationSlider()),
                    MyFlexItem(sizes: 'lg-3 md-6', child: _stepSlider()),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _stepDurationSlider() {
    return MyCard(
      shadow: MyShadow(position: MyShadowPosition.bottom, elevation: .5),
      borderRadiusAll: 8,
      paddingAll: 23,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText.titleMedium(
            "Step Duration Slider",
            fontWeight: 600,
          ),
          SfSliderTheme(
              data: SfSliderThemeData(),
              child: SfSlider(
                min: DateTime(2010, 01, 01),
                max: DateTime(2020, 01, 01),
                showLabels: true,
                interval: 2,
                stepDuration: const SliderStepDuration(years: 2),
                dateFormat: DateFormat.y(),
                labelPlacement: LabelPlacement.onTicks,
                dateIntervalType: DateIntervalType.years,
                showTicks: true,
                value: controller.dateValue,
                onChanged: (dynamic values) {
                  setState(() {
                    controller.dateValue = values as DateTime;
                  });
                },
                enableTooltip: true,
                tooltipTextFormatterCallback: (dynamic actualLabel, String formattedText) {
                  return DateFormat.y().format(actualLabel);
                },
              )),
        ],
      ),
    );
  }

  Widget _stepSlider() {
    return MyCard(
      borderRadiusAll: 8,
      paddingAll: 23,
      shadow: MyShadow(elevation: .5, position: MyShadowPosition.bottom),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText.titleMedium("Step Slider", fontWeight: 600),
          SfSliderTheme(
              data: SfSliderThemeData(),
              child: SfSlider(
                  showLabels: true,
                  interval: 5,
                  min: -10.0,
                  max: 10.0,
                  stepSize: 5,
                  showTicks: true,
                  value: controller.stepSliderValue,
                  onChanged: (dynamic values) {
                    setState(() {
                      controller.stepSliderValue = values as double;
                    });
                  },
                  enableTooltip: true)),
        ],
      ),
    );
  }

  Widget _labelSlider() {
    return MyCard(
      shadow: MyShadow(elevation: .5, position: MyShadowPosition.bottom),
      borderRadiusAll: 8,
      paddingAll: 23,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText.titleMedium(
            "Label Slider",
            fontWeight: 600,
          ),
          SfSliderTheme(
              data: SfSliderThemeData(),
              child: SfSlider(
                showLabels: true,
                interval: 20,
                min: 0.0,
                max: 100.0,
                value: controller.labelSliderValue,
                onChanged: (dynamic values) {
                  setState(() {
                    controller.labelSliderValue = values as double;
                  });
                },
                enableTooltip: true,
                numberFormat: NumberFormat('#'),
              )),
        ],
      ),
    );
  }

  Widget _tickSlider() {
    return MyCard(
      shadow: MyShadow(position: MyShadowPosition.bottom, elevation: .5),
      borderRadiusAll: 8,
      paddingAll: 23,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText.titleMedium("Tick Slider", fontWeight: 600),
          SfSliderTheme(
              data: SfSliderThemeData(),
              child: SfSlider(
                showLabels: true,
                showTicks: true,
                interval: 25,
                min: -50.0,
                max: 50.0,
                value: controller.tickSliderValue,
                onChanged: (dynamic values) {
                  setState(() {
                    controller.tickSliderValue = values as double;
                  });
                },
                enableTooltip: true,
                numberFormat: NumberFormat('#'),
              )),
        ],
      ),
    );
  }

  Widget _dividerSlider() {
    return MyCard(
      borderRadiusAll: 8,
      paddingAll: 23,
      shadow: MyShadow(elevation: .5, position: MyShadowPosition.bottom),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText.titleMedium("Divider Slider", fontWeight: 600),
          SfSliderTheme(
              data: SfSliderThemeData(),
              child: SfSlider(
                interval: 25,
                showDividers: true,
                min: 0.0,
                max: 100.0,
                value: controller.dividerSliderValue,
                onChanged: (dynamic values) {
                  setState(() {
                    controller.dividerSliderValue = values as double;
                  });
                },
                enableTooltip: true,
                numberFormat: NumberFormat('#'),
              )),
        ],
      ),
    );
  }

  Widget _yearSlider() {
    return MyCard(
      shadow: MyShadow(elevation: .5, position: MyShadowPosition.bottom),
      borderRadiusAll: 8,
      paddingAll: 23,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText.titleMedium("Year Slider", fontWeight: 600),
          SfSliderTheme(
              data: SfSliderThemeData(),
              child: SfSlider(
                min: DateTime(2016, 01, 01),
                max: DateTime(2019, 01, 01),
                showLabels: true,
                interval: 1,
                dateFormat: intl.DateFormat.y(),
                labelPlacement: LabelPlacement.onTicks,
                dateIntervalType: DateIntervalType.years,
                showTicks: true,
                value: controller.yearValue,
                onChanged: (dynamic value) {
                  setState(() {
                    controller.yearValue = value as DateTime;
                  });
                },
                enableTooltip: true,
                tooltipTextFormatterCallback: (dynamic actualLabel, String formattedText) {
                  return intl.DateFormat.yMMM().format(actualLabel);
                },
              )),
        ],
      ),
    );
  }

  Widget _hourSlider() {
    return MyCard(
      borderRadiusAll: 8,
      paddingAll: 23,
      shadow: MyShadow(elevation: .5, position: MyShadowPosition.bottom),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText.titleMedium("Hour Slider", fontWeight: 600),
          SfSliderTheme(
              data: SfSliderThemeData(),
              child: SfSlider(
                min: DateTime(2020, 01, 01, 9, 00, 00),
                max: DateTime(2020, 01, 01, 21, 05, 00),
                showLabels: true,
                interval: 4,
                showTicks: true,
                minorTicksPerInterval: 3,
                dateFormat: intl.DateFormat('h a'),
                labelPlacement: LabelPlacement.onTicks,
                dateIntervalType: DateIntervalType.hours,
                value: controller.hourValue,
                onChanged: (dynamic value) {
                  setState(() {
                    controller.hourValue = value as DateTime;
                  });
                },
                enableTooltip: true,
                tooltipTextFormatterCallback: (dynamic actualLabel, String formattedText) {
                  return intl.DateFormat('h:mm a').format(actualLabel);
                },
              )),
        ],
      ),
    );
  }
}
