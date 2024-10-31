import 'package:foody/controller/ui/tabs_controller.dart';
import 'package:foody/helpers/utils/my_shadow.dart';
import 'package:foody/helpers/widgets/my_breadcrumb.dart';
import 'package:foody/helpers/widgets/my_breadcrumb_item.dart';
import 'package:foody/helpers/widgets/my_card.dart';
import 'package:foody/helpers/widgets/my_flex.dart';
import 'package:foody/helpers/widgets/my_flex_item.dart';
import 'package:foody/helpers/widgets/my_spacing.dart';
import 'package:foody/helpers/widgets/my_tab_indicator_style.dart';
import 'package:foody/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:foody/helpers/widgets/responsive.dart';
import 'package:foody/views/layout/layout.dart';
import 'package:get/get.dart';

import '../../helpers/utils/ui_mixins.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen>
    with TickerProviderStateMixin, UIMixin {
  late TabsController controller;

  @override
  void initState() {
    controller = TabsController(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: GetBuilder(
        init: controller,
        tag: 'tabs_controller',
        builder: (controller) {
          return Column(
            children: [
              Padding(
                padding: MySpacing.x(flexSpacing),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText.titleMedium(
                      "Tabs",
                      fontSize: 18,
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: 'Widget'),
                        MyBreadcrumbItem(name: 'Tabs', active: true),
                      ],
                    ),
                  ],
                ),
              ),
              MySpacing.height(flexSpacing),
              Padding(
                padding: MySpacing.x(flexSpacing / 2),
                child: MyFlex(
                  wrapAlignment: WrapAlignment.start,
                  wrapCrossAlignment: WrapCrossAlignment.start,
                  children: [
                    MyFlexItem(sizes: "lg-6 md-12", child: defaultTabs()),
                    MyFlexItem(sizes: "lg-6 md-12", child: fullWidth()),
                    MyFlexItem(
                        sizes: "lg-6 md-12", child: backgroundIndicator()),
                    MyFlexItem(sizes: "lg-6 md-12", child: borderIndicator()),
                    MyFlexItem(sizes: "lg-6 md-12", child: softIndicator()),
                    MyFlexItem(sizes: "lg-6 md-12", child: customIndicator1()),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget defaultTabs() {
    return MyCard(
        height: 250,
        borderRadiusAll: 8,
        shadow: MyShadow(position: MyShadowPosition.bottom, elevation: .5),
        paddingAll: 23,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText.titleMedium(
              "Default Tabs",
              fontWeight: 600,
            ),
            TabBar(
              controller: controller.defaultTabController,
              isScrollable: true,
              tabs: [
                Tab(
                  icon: MyText.bodyMedium(
                    "Home",
                    fontWeight: controller.defaultIndex == 0 ? 600 : 500,
                    color: controller.defaultIndex == 0
                        ? contentTheme.primary
                        : null,
                  ),
                ),
                Tab(
                  icon: MyText.bodyMedium(
                    "Profile",
                    fontWeight: controller.defaultIndex == 1 ? 600 : 500,
                    color: controller.defaultIndex == 1
                        ? contentTheme.primary
                        : null,
                  ),
                ),
                Tab(
                  icon: MyText.bodyMedium(
                    "Messages",
                    fontWeight: controller.defaultIndex == 2 ? 600 : 500,
                    color: controller.defaultIndex == 2
                        ? contentTheme.primary
                        : null,
                  ),
                ),
              ],
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                  color: contentTheme.primary,
                  backgroundBlendMode: BlendMode.colorDodge),
            ),
            MySpacing.height(16),
            Expanded(
              child: TabBarView(
                controller: controller.defaultTabController,
                children: [
                  MyText.bodySmall(controller.dummyTexts[0],
                      fontWeight: 600, letterSpacing: .3),
                  MyText.bodySmall(controller.dummyTexts[1],
                      fontWeight: 600, letterSpacing: .3),
                  MyText.bodySmall(controller.dummyTexts[2],
                      fontWeight: 600, letterSpacing: .3),
                ],
              ),
            ),
          ],
        ));
  }

  Widget fullWidth() {
    return MyCard(
        height: 250,
        paddingAll: 23,
        borderRadiusAll: 8,
        shadow: MyShadow(position: MyShadowPosition.bottom, elevation: .5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText.titleMedium(
              "Full Width",
              fontWeight: 600,
            ),
            TabBar(
              controller: controller.fullWidthTabController,
              tabs: [
                Tab(
                  icon: MyText.bodyMedium(
                    "Home",
                    fontWeight: controller.fullWidthIndex == 0 ? 600 : 500,
                    color: controller.fullWidthIndex == 0
                        ? contentTheme.primary
                        : null,
                  ),
                ),
                Tab(
                  icon: MyText.bodyMedium(
                    "Profile",
                    fontWeight: controller.fullWidthIndex == 1 ? 600 : 500,
                    color: controller.fullWidthIndex == 1
                        ? contentTheme.primary
                        : null,
                  ),
                ),
                Tab(
                  icon: MyText.bodyMedium(
                    "Messages",
                    fontWeight: controller.fullWidthIndex == 2 ? 600 : 500,
                    color: controller.fullWidthIndex == 2
                        ? contentTheme.primary
                        : null,
                  ),
                ),
              ],
              indicatorSize: TabBarIndicatorSize.tab,
            ),
            MySpacing.height(16),
            Expanded(
              child: TabBarView(
                controller: controller.fullWidthTabController,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                children: [
                  MyText.bodySmall(
                    controller.dummyTexts[0],
                    fontWeight: 600,
                    letterSpacing: .3,
                  ),
                  MyText.bodySmall(
                    controller.dummyTexts[1],
                    fontWeight: 600,
                    letterSpacing: .3,
                  ),
                  MyText.bodySmall(
                    controller.dummyTexts[2],
                    fontWeight: 600,
                    letterSpacing: .3,
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  Widget backgroundIndicator() {
    return MyCard(
        borderRadiusAll: 8,
        height: 250,
        paddingAll: 23,
        shadow: MyShadow(position: MyShadowPosition.bottom, elevation: .5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText.titleMedium(
              "Background Indicator",
              fontWeight: 600,
            ),
            MySpacing.height(20),
            TabBar(
              controller: controller.backgroundTabController,
              isScrollable: true,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: contentTheme.primary),
              tabs: [
                Tab(
                  icon: MyText.bodyMedium(
                    "Home",
                    fontWeight: controller.backgroundIndex == 0 ? 600 : 500,
                    color: controller.backgroundIndex == 0
                        ? contentTheme.onPrimary
                        : null,
                  ),
                ),
                Tab(
                  icon: MyText.bodyMedium(
                    "Profile",
                    fontWeight: controller.backgroundIndex == 1 ? 600 : 500,
                    color: controller.backgroundIndex == 1
                        ? contentTheme.onPrimary
                        : null,
                  ),
                ),
                Tab(
                  icon: MyText.bodyMedium(
                    "Messages",
                    fontWeight: controller.backgroundIndex == 2 ? 600 : 500,
                    color: controller.backgroundIndex == 2
                        ? contentTheme.onPrimary
                        : null,
                  ),
                ),
              ],
              indicatorSize: TabBarIndicatorSize.tab,
            ),
            MySpacing.height(16),
            Expanded(
              child: TabBarView(
                controller: controller.backgroundTabController,
                children: [
                  MyText.bodySmall(controller.dummyTexts[0],
                      fontWeight: 600, letterSpacing: .3),
                  MyText.bodySmall(controller.dummyTexts[1],
                      fontWeight: 600, letterSpacing: .3),
                  MyText.bodySmall(controller.dummyTexts[2],
                      fontWeight: 600, letterSpacing: .3),
                ],
              ),
            ),
          ],
        ));
  }

  Widget borderIndicator() {
    return MyCard(
        borderRadiusAll: 8,
        height: 250,
        paddingAll: 23,
        shadow: MyShadow(position: MyShadowPosition.bottom, elevation: .5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText.titleMedium(
              "Bordered Indicator",
              fontWeight: 600,
            ),
            MySpacing.height(28),
            TabBar(
              controller: controller.borderedTabController,
              isScrollable: true,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: contentTheme.primary, width: 1.2)),
              tabs: [
                Tab(
                  icon: MyText.bodyMedium(
                    "Home",
                    fontWeight: controller.borderedIndex == 0 ? 600 : 500,
                    color: controller.borderedIndex == 0
                        ? contentTheme.primary
                        : null,
                  ),
                ),
                Tab(
                  icon: MyText.bodyMedium(
                    "Profile",
                    fontWeight: controller.borderedIndex == 1 ? 600 : 500,
                    color: controller.borderedIndex == 1
                        ? contentTheme.primary
                        : null,
                  ),
                ),
                Tab(
                  icon: MyText.bodyMedium(
                    "Messages",
                    fontWeight: controller.borderedIndex == 2 ? 600 : 500,
                    color: controller.borderedIndex == 2
                        ? contentTheme.primary
                        : null,
                  ),
                ),
              ],
              indicatorSize: TabBarIndicatorSize.tab,
            ),
            MySpacing.height(16),
            Expanded(
              child: TabBarView(
                controller: controller.borderedTabController,
                children: [
                  MyText.bodySmall(controller.dummyTexts[0],
                      fontWeight: 600, letterSpacing: .3),
                  MyText.bodySmall(controller.dummyTexts[1],
                      fontWeight: 600, letterSpacing: .3),
                  MyText.bodySmall(controller.dummyTexts[2],
                      fontWeight: 600, letterSpacing: .3),
                ],
              ),
            ),
          ],
        ));
  }

  Widget softIndicator() {
    return MyCard(
        borderRadiusAll: 8,
        height: 250,
        paddingAll: 23,
        shadow: MyShadow(position: MyShadowPosition.bottom, elevation: .5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText.titleMedium(
              "Soft Indicator",
              fontWeight: 600,
            ),
            MySpacing.height(20),
            TabBar(
              controller: controller.softTabController,
              isScrollable: true,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: contentTheme.primary.withAlpha(40)),
              tabs: [
                Tab(
                  icon: MyText.bodyMedium(
                    "Home",
                    fontWeight: controller.softIndex == 0 ? 600 : 500,
                    color:
                        controller.softIndex == 0 ? contentTheme.primary : null,
                  ),
                ),
                Tab(
                  icon: MyText.bodyMedium(
                    "Profile",
                    fontWeight: controller.softIndex == 1 ? 600 : 500,
                    color:
                        controller.softIndex == 1 ? contentTheme.primary : null,
                  ),
                ),
                Tab(
                  icon: MyText.bodyMedium(
                    "Messages",
                    fontWeight: controller.softIndex == 2 ? 600 : 500,
                    color:
                        controller.softIndex == 2 ? contentTheme.primary : null,
                  ),
                ),
              ],
              indicatorSize: TabBarIndicatorSize.tab,
            ),
            MySpacing.height(16),
            Expanded(
              child: TabBarView(
                controller: controller.softTabController,
                children: [
                  MyText.bodySmall(controller.dummyTexts[0],
                      fontWeight: 600, letterSpacing: .3),
                  MyText.bodySmall(controller.dummyTexts[1],
                      fontWeight: 600, letterSpacing: .3),
                  MyText.bodySmall(controller.dummyTexts[2],
                      fontWeight: 600, letterSpacing: .3),
                ],
              ),
            ),
          ],
        ));
  }

  Widget customIndicator1() {
    return MyCard(
      borderRadiusAll: 8,
      height: 250,
      paddingAll: 23,
      shadow: MyShadow(position: MyShadowPosition.bottom, elevation: .5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText.titleMedium(
            "Custom Indicator #1",
            fontWeight: 600,
          ),
          MySpacing.height(28),
          TabBar(
            controller: controller.customTabController1,
            isScrollable: true,
            indicator: MyTabIndicator(
              indicatorColor: contentTheme.primary,
              indicatorStyle: MyTabIndicatorStyle.rectangle,
              yOffset: 40,
            ),
            tabs: [
              Tab(
                icon: MyText.bodyMedium(
                  "Home",
                  fontWeight: controller.customIndex1 == 0 ? 600 : 500,
                  color: controller.customIndex1 == 0
                      ? contentTheme.primary
                      : null,
                ),
              ),
              Tab(
                icon: MyText.bodyMedium(
                  "Profile",
                  fontWeight: controller.customIndex1 == 1 ? 600 : 500,
                  color: controller.customIndex1 == 1
                      ? contentTheme.primary
                      : null,
                ),
              ),
              Tab(
                icon: MyText.bodyMedium(
                  "Messages",
                  fontWeight: controller.customIndex1 == 2 ? 600 : 500,
                  color: controller.customIndex1 == 2
                      ? contentTheme.primary
                      : null,
                ),
              ),
            ],
            indicatorSize: TabBarIndicatorSize.tab,
          ),
          MySpacing.height(16),
          Expanded(
            child: TabBarView(
              controller: controller.customTabController1,
              children: [
                MyText.bodySmall(controller.dummyTexts[0],
                    fontWeight: 600, letterSpacing: .3),
                MyText.bodySmall(controller.dummyTexts[1],
                    fontWeight: 600, letterSpacing: .3),
                MyText.bodySmall(controller.dummyTexts[2],
                    fontWeight: 600, letterSpacing: .3),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
