import 'package:flutter/material.dart';
import 'package:foody/controller/ui/restaurant/add_restaurant_controller.dart';
import 'package:foody/helpers/utils/ui_mixins.dart';
import 'package:foody/helpers/widgets/my_breadcrumb.dart';
import 'package:foody/helpers/widgets/my_breadcrumb_item.dart';
import 'package:foody/helpers/widgets/my_container.dart';
import 'package:foody/helpers/widgets/my_flex.dart';
import 'package:foody/helpers/widgets/my_flex_item.dart';
import 'package:foody/helpers/widgets/my_responsiv.dart';
import 'package:foody/helpers/widgets/my_spacing.dart';
import 'package:foody/helpers/widgets/my_text.dart';
import 'package:foody/helpers/widgets/my_text_style.dart';
import 'package:foody/helpers/widgets/responsive.dart';
import 'package:foody/views/layout/layout.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

class AddRestaurantScreen extends StatefulWidget {
  const AddRestaurantScreen({super.key});

  @override
  State<AddRestaurantScreen> createState() => _AddRestaurantScreenState();
}

class _AddRestaurantScreenState extends State<AddRestaurantScreen> with SingleTickerProviderStateMixin, UIMixin {
  late AddRestaurantController controller;

  @override
  void initState() {
    controller = Get.put(AddRestaurantController(this));
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
                      "Add Restaurant",
                      fontSize: 18,
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: 'Admin'),
                        MyBreadcrumbItem(name: 'Add Restaurant', active: true),
                      ],
                    ),
                  ],
                ),
              ),
              MySpacing.height(flexSpacing),
              Padding(
                padding: MySpacing.x(flexSpacing / 2),
                child: Column(
                  children: [
                    TabBar(
                      isScrollable: false,
                      controller: controller.fullWidthTabController,
                      indicator: BoxDecoration(borderRadius: BorderRadius.circular(20), color: contentTheme.primary.withAlpha(40)),
                      splashBorderRadius: BorderRadius.circular(20),
                      tabs: [
                        Tab(
                          child: MyText.labelMedium(
                            "Business Detail",
                            fontWeight: controller.fullWidthIndex == 0 ? 600 : 500,
                            color: controller.fullWidthIndex == 0 ? contentTheme.primary : null,
                          ),
                        ),
                        Tab(
                          child: MyText.labelMedium(
                            "Restaurant Detail",
                            fontWeight: controller.fullWidthIndex == 1 ? 600 : 500,
                            color: controller.fullWidthIndex == 1 ? contentTheme.primary : null,
                          ),
                        ),
                        Tab(
                          child: MyText.labelMedium(
                            "Bank Detail",
                            fontWeight: controller.fullWidthIndex == 2 ? 600 : 500,
                            color: controller.fullWidthIndex == 2 ? contentTheme.primary : null,
                          ),
                        ),
                      ],
                      indicatorSize: TabBarIndicatorSize.tab,
                    ),
                    MySpacing.height(flexSpacing),
                    MyResponsive(
                      builder: (_, __, type) {
                        return type == MyScreenMediaType.xxl || type == MyScreenMediaType.xl || type == MyScreenMediaType.lg
                            ? SizedBox(
                                height: 680,
                                child: buildTabBarView(),
                              )
                            : type == MyScreenMediaType.md || type == MyScreenMediaType.sm || type == MyScreenMediaType.xs
                                ? SizedBox(
                                    height: 1180,
                                    child: buildTabBarView(),
                                  )
                                : const SizedBox();
                      },
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

  Widget buildTabBarView() {
    return TabBarView(
      controller: controller.fullWidthTabController,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      children: [
        buildBusinessDetail(),
        buildPersonalDetail(),
        buildBankDetail(),
      ],
    );
  }

  Widget buildBusinessDetail() {
    return MyContainer(
      paddingAll: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText.bodyMedium(
            "Step 1 : ",
            fontWeight: 700,
          ),
          MySpacing.height(20),
          MyFlex(
            children: [
              MyFlexItem(
                sizes: 'lg-6',
                child: buildTextField(
                  "First Name",
                  "Enter your First Name",
                ),
              ),
              MyFlexItem(
                sizes: 'lg-6',
                child: buildTextField(
                  "Last Name",
                  "Enter your Last Name",
                ),
              ),
              MyFlexItem(
                sizes: 'lg-6',
                child: buildTextField(
                  "Contact Number",
                  "Enter your Contact Number",
                ),
              ),
              MyFlexItem(
                sizes: 'lg-6',
                child: buildTextField(
                  "Phone Number",
                  "Enter your Phone Number",
                ),
              ),
              MyFlexItem(
                sizes: 'lg-6',
                child: buildTextField(
                  "Email",
                  "Enter your Email",
                ),
              ),
              MyFlexItem(
                sizes: 'lg-6',
                child: buildTextField(
                  "Birth of Date",
                  "Enter Birth of Date",
                ),
              ),
              MyFlexItem(
                sizes: 'lg-4',
                child: buildTextField(
                  "City",
                  "Enter Your city",
                ),
              ),
              MyFlexItem(
                sizes: 'lg-4',
                child: buildTextField(
                  "Country",
                  "Enter Your Country",
                ),
              ),
              MyFlexItem(
                sizes: 'lg-4',
                child: buildTextField(
                  "Zip Code",
                  "Enter Your Zip Code",
                ),
              ),
              MyFlexItem(
                sizes: 'lg-12',
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText.bodyMedium(
                      "Description",
                      fontWeight: 600,
                      muted: true,
                    ),
                    MySpacing.height(8),
                    TextFormField(
                      keyboardType: TextInputType.multiline,
                      maxLines: 5,
                      style: MyTextStyle.bodySmall(),
                      decoration: InputDecoration(
                        hintText: "Enter Your Description",
                        hintStyle: MyTextStyle.bodySmall(xMuted: true),
                        border: outlineInputBorder,
                        enabledBorder: outlineInputBorder,
                        focusedBorder: focusedInputBorder,
                        contentPadding: MySpacing.all(16),
                        isCollapsed: true,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                      ),
                    ),
                  ],
                ),
              ),
              MyFlexItem(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MySpacing.height(12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MyContainer(
                        paddingAll: 8,
                        color: contentTheme.secondary,
                        onTap: () {},
                        child: Row(
                          children: [
                            Icon(LucideIcons.x, size: 16, color: contentTheme.onSecondary),
                            MySpacing.width(8),
                            MyText.bodyMedium(
                              "Close",
                              color: contentTheme.onSecondary,
                              fontWeight: 600,
                            )
                          ],
                        ),
                      ),
                      MySpacing.width(12),
                      MyContainer(
                        paddingAll: 8,
                        onTap: () {},
                        color: contentTheme.primary.withAlpha(40),
                        child: Row(
                          children: [
                            Icon(LucideIcons.save, size: 16, color: contentTheme.primary),
                            MySpacing.width(8),
                            MyText.bodyMedium("Save", fontWeight: 600, color: contentTheme.primary)
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ))
            ],
          ),
        ],
      ),
    );
  }

  Widget buildPersonalDetail() {
    return MyContainer(
      paddingAll: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText.bodyMedium(
            "Step 2 : ",
            fontWeight: 700,
          ),
          MySpacing.height(20),
          MyFlex(
            children: [
              MyFlexItem(
                sizes: 'lg-6',
                child: buildTextField("Company Name", "Enter your Company Name"),
              ),
              MyFlexItem(
                sizes: 'lg-6',
                child: buildTextField("Company Type", "Enter Company Type"),
              ),
              MyFlexItem(sizes: 'lg-6', child: buildTextField("PAN Card Number", "Enter PAN Card Number")),
              MyFlexItem(
                sizes: 'lg-6',
                child: buildTextField("Fax Number", "Enter Fax Number"),
              ),
              MyFlexItem(
                sizes: 'lg-6',
                child: buildTextField("Website", "Enter website.com"),
              ),
              MyFlexItem(
                sizes: 'lg-6',
                child: buildTextField("Email", "Enter Email"),
              ),
              MyFlexItem(
                sizes: 'lg-6',
                child: buildTextField("Number", "Enter Number"),
              ),
              MyFlexItem(
                sizes: 'lg-6',
                child: buildTextField("Company Logo", "No file Choose"),
              ),
              MyFlexItem(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MyContainer(
                    paddingAll: 8,
                    color: contentTheme.secondary,
                    onTap: () {},
                    child: Row(
                      children: [
                        Icon(LucideIcons.x, size: 16, color: contentTheme.onSecondary),
                        MySpacing.width(8),
                        MyText.bodyMedium(
                          "Close",
                          color: contentTheme.onSecondary,
                          fontWeight: 600,
                        )
                      ],
                    ),
                  ),
                  MySpacing.width(12),
                  MyContainer(
                    paddingAll: 8,
                    onTap: () {},
                    color: contentTheme.primary.withAlpha(40),
                    child: Row(
                      children: [
                        Icon(LucideIcons.save, size: 16, color: contentTheme.primary),
                        MySpacing.width(8),
                        MyText.bodyMedium("Save", fontWeight: 600, color: contentTheme.primary)
                      ],
                    ),
                  ),
                ],
              ))
            ],
          ),
        ],
      ),
    );
  }

  Widget buildBankDetail() {
    return MyContainer(
      paddingAll: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText.bodyMedium(
            "Step 3 : ",
            fontWeight: 700,
          ),
          MySpacing.height(20),
          MyFlex(
            children: [
              MyFlexItem(
                sizes: 'lg-6',
                child: buildTextField("Bank Name", "Enter your Bank Name"),
              ),
              MyFlexItem(
                sizes: 'lg-6',
                child: buildTextField("Branch", "Enter Your Branch"),
              ),
              MyFlexItem(
                child: buildTextField("Account Holder Name", "Enter Your Account Holder Name"),
              ),
              MyFlexItem(
                sizes: 'lg-6',
                child: buildTextField("Account Number", "Enter Account Number"),
              ),
              MyFlexItem(
                sizes: 'lg-6',
                child: buildTextField("IFSC Code", "Enter IFSC Code"),
              ),
              MyFlexItem(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MyContainer(
                    paddingAll: 8,
                    color: contentTheme.secondary,
                    onTap: () {},
                    child: Row(
                      children: [
                        Icon(LucideIcons.x, size: 16, color: contentTheme.onSecondary),
                        MySpacing.width(8),
                        MyText.bodyMedium(
                          "Close",
                          color: contentTheme.onSecondary,
                          fontWeight: 600,
                        )
                      ],
                    ),
                  ),
                  MySpacing.width(12),
                  MyContainer(
                    paddingAll: 8,
                    onTap: () {},
                    color: contentTheme.primary.withAlpha(40),
                    child: Row(
                      children: [
                        Icon(LucideIcons.save, size: 16, color: contentTheme.primary),
                        MySpacing.width(8),
                        MyText.bodyMedium("Save", fontWeight: 600, color: contentTheme.primary)
                      ],
                    ),
                  ),
                ],
              ))
            ],
          ),
        ],
      ),
    );
  }

  buildTextField(
    String fieldTitle,
    String hintText,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText.labelMedium(fieldTitle),
        MySpacing.height(8),
        TextFormField(
          style: MyTextStyle.bodySmall(),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: MyTextStyle.bodySmall(xMuted: true),
            border: outlineInputBorder,
            contentPadding: MySpacing.all(16),
            isCollapsed: true,
            floatingLabelBehavior: FloatingLabelBehavior.never,
          ),
        ),
      ],
    );
  }
}
