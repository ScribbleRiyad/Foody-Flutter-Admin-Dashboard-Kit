import 'package:flutter/material.dart';
import 'package:foody/controller/home_controller.dart';
import 'package:foody/helpers/utils/ui_mixins.dart';
import 'package:foody/helpers/widgets/my_breadcrumb.dart';
import 'package:foody/helpers/widgets/my_breadcrumb_item.dart';
import 'package:foody/helpers/widgets/my_button.dart';
import 'package:foody/helpers/widgets/my_container.dart';
import 'package:foody/helpers/widgets/my_flex.dart';
import 'package:foody/helpers/widgets/my_flex_item.dart';
import 'package:foody/helpers/widgets/my_spacing.dart';
import 'package:foody/helpers/widgets/my_text.dart';
import 'package:foody/helpers/widgets/responsive.dart';
import 'package:foody/views/layout/layout.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin, UIMixin {
  late HomeController controller;

  @override
  void initState() {
    controller = Get.put(HomeController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: GetBuilder(
        init: controller,
        builder: (controller) {
          return Column(
            children: [
              Padding(
                padding: MySpacing.x(flexSpacing),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText.titleMedium(
                      "Home",
                      fontSize: 18,
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: 'Home', active: true),
                      ],
                    ),
                  ],
                ),
              ),
              MySpacing.height(flexSpacing),
              Padding(
                padding: MySpacing.x(flexSpacing / 2),
                child: MyFlex(
                  children: [
                    MyFlexItem(sizes: 'lg-8', child: buildDashboardAD()),
                    MyFlexItem(
                      sizes: 'lg-4',
                      child: buildPremiumContainer(),
                    ),
                    MyFlexItem(
                        child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MyText.bodyMedium(
                              "Menu Category",
                              fontWeight: 600,
                            ),
                            InkWell(
                              onTap: () {},
                              child: MyText.bodyMedium(
                                "View all",
                                fontWeight: 600,
                              ),
                            )
                          ],
                        ),
                        MySpacing.height(16),
                        SizedBox(
                          height: 170,
                          child: ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.categoryList.length,
                            itemBuilder: (context, index) {
                              bool isSelected = controller.selectedId == index;
                              return MyContainer(
                                width: 165,
                                onTap: () {
                                  controller.onSelect(index);
                                },
                                color: isSelected ? contentTheme.primary.withAlpha(40) : null,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset(
                                      controller.categoryList[index]['image'] ?? '',
                                      height: 100,
                                    ),
                                    MySpacing.height(8),
                                    MyText.bodyMedium(
                                      controller.categoryList[index]['name'] ?? '',
                                      color: isSelected ? contentTheme.primary : null,
                                      fontWeight: 600,
                                    ),
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                width: 16,
                              );
                            },
                          ),
                        )
                      ],
                    )),
                    MyFlexItem(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText.bodyLarge(
                            "Restaurant Nearby",
                            fontWeight: 600,
                          ),
                          MySpacing.height(flexSpacing),
                          GridView.builder(
                            shrinkWrap: true,
                            itemCount: controller.restaurant['List'].length,
                            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                              mainAxisExtent: 150,
                              maxCrossAxisExtent: 600,
                              childAspectRatio: 0.6,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                            ),
                            itemBuilder: (context, index) {
                              return MyContainer(
                                child: Row(
                                  children: [
                                    Image.asset(
                                      controller.restaurant['List'][index]['image'],
                                      height: 100,
                                      width: 100,
                                    ),
                                    MySpacing.width(12),
                                    SizedBox(
                                      height: 90,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          MyText.titleMedium(
                                            controller.restaurant['List'][index]['name'],
                                            fontWeight: 600,
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(
                                                    LucideIcons.star,
                                                    color: contentTheme.primary,
                                                    size: 16,
                                                  ),
                                                  MySpacing.width(8),
                                                  MyText.bodySmall(controller.restaurant['List'][index]['star'].toString())
                                                ],
                                              ),
                                              MySpacing.width(12),
                                              MyContainer(
                                                borderRadiusAll: 200,
                                                paddingAll: 6,
                                                color: controller.restaurant['List'][index]['delivery'] == false
                                                    ? contentTheme.danger.withAlpha(40)
                                                    : contentTheme.success.withAlpha(40),
                                                child: MyText.bodySmall(
                                                  controller.restaurant['List'][index]['charges'],
                                                  fontWeight: 600,
                                                  color: controller.restaurant['List'][index]['delivery'] == false
                                                      ? contentTheme.danger
                                                      : contentTheme.success,
                                                ),
                                              )
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(LucideIcons.utensils, size: 16),
                                                  MySpacing.width(8),
                                                  MyText.bodySmall(
                                                    controller.restaurant['List'][index]['title'],
                                                    fontWeight: 600,
                                                    muted: true,
                                                  )
                                                ],
                                              ),
                                              MySpacing.width(12),
                                              Row(
                                                children: [
                                                  Icon(LucideIcons.mapPin, size: 16),
                                                  MySpacing.width(8),
                                                  MyText.bodySmall(
                                                    controller.restaurant['List'][index]['range'],
                                                    fontWeight: 600,
                                                    muted: true,
                                                  )
                                                ],
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buildDashboardAD() {
    return Stack(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      alignment: Alignment.topLeft,
      children: [
        MyContainer(
          height: 280,
          color: contentTheme.primary.withAlpha(40),
        ),
        Positioned(
          width: 250,
          bottom: 100,
          left: -40,
          child: MyContainer.rounded(
            height: 250,
            color: contentTheme.light.withAlpha(100),
          ),
        ),
        Positioned(
          width: 200,
          top: 40,
          left: -120,
          child: MyContainer.rounded(
            height: 250,
            color: contentTheme.light.withAlpha(100),
          ),
        ),
        Positioned(
          right: 50,
          width: 100,
          top: 60,
          child: MyContainer.rounded(
            height: 100,
            color: contentTheme.light.withAlpha(100),
          ),
        ),
        Positioned(
          right: 20,
          width: 100,
          top: 20,
          child: MyContainer.rounded(
            height: 100,
            color: contentTheme.light.withAlpha(100),
          ),
        ),
        Positioned(
          right: 80,
          width: 100,
          top: 20,
          child: MyContainer.rounded(
            height: 100,
            color: contentTheme.light.withAlpha(100),
          ),
        ),
        Positioned(
          height: 200,
          width: 500,
          right: 150,
          bottom: -50,
          child: MyContainer(
            color: contentTheme.light.withAlpha(100),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(200),
              topLeft: Radius.circular(100),
              bottomLeft: Radius.circular(200),
            ),
          ),
        ),
        MyFlex(
          children: [
            MyFlexItem(
                sizes: 'lg-6 mg-6 sm-6 xs-6',
                child: MyContainer.transparent(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText.bodyMedium(
                        "Light In The Stomach, Good\nFor Your Health",
                        fontWeight: 900,
                        maxLines: 4,
                        overflow: TextOverflow.visible,
                        letterSpacing: 5,
                        fontSize: 20,
                      ),
                      MySpacing.height(40),
                      SizedBox(
                        width: 150,
                        child: MyButton.block(
                          onPressed: () {},
                          elevation: 0,
                          backgroundColor: contentTheme.light,
                          child: MyText.bodyMedium(
                            'Order Now',
                            fontWeight: 600,
                            color: contentTheme.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
            MyFlexItem(
                sizes: 'lg-6 mg-6 sm-6 xs-6',
                child: MyContainer.transparent(
                  child: Image.asset(
                    'assets/images/fast_food/delivery_boy.png',
                    height: 250,
                  ),
                )),
          ],
        )
      ],
    );
  }

  Widget buildPremiumContainer() {
    return Container(
      height: 280,
      padding: MySpacing.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          tileMode: TileMode.decal,
          colors: [
            Colors.red.withAlpha(100),
            Colors.pink.withAlpha(100),
            Colors.redAccent.withAlpha(100),
            Colors.purple.withAlpha(100),
          ],
        ),
        color: contentTheme.danger.withAlpha(36),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyText.bodyLarge(
            "You do not have a valid Subscription. Please active your subscription",
            fontSize: 20,
            fontWeight: 600,
            muted: true,
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
          MyButton.block(
              borderRadiusAll: 12,
              elevation: 0,
              backgroundColor: contentTheme.danger.withAlpha(100),
              onPressed: () {},
              child: MyText.bodyMedium(
                'Go to Pro Now!',
                // color: contentTheme.danger,
                fontWeight: 600,
              ))
        ],
      ),
    );
  }
}
