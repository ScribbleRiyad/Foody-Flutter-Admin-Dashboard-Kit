import 'package:flutter/material.dart';
import 'package:foody/controller/ui/setting_controller.dart';
import 'package:foody/helpers/theme/app_style.dart';
import 'package:foody/helpers/utils/my_shadow.dart';
import 'package:foody/helpers/utils/ui_mixins.dart';
import 'package:foody/helpers/widgets/my_breadcrumb.dart';
import 'package:foody/helpers/widgets/my_breadcrumb_item.dart';
import 'package:foody/helpers/widgets/my_button.dart';
import 'package:foody/helpers/widgets/my_card.dart';
import 'package:foody/helpers/widgets/my_container.dart';
import 'package:foody/helpers/widgets/my_flex.dart';
import 'package:foody/helpers/widgets/my_flex_item.dart';
import 'package:foody/helpers/widgets/my_spacing.dart';
import 'package:foody/helpers/widgets/my_text.dart';
import 'package:foody/helpers/widgets/my_text_style.dart';
import 'package:foody/helpers/widgets/responsive.dart';
import 'package:foody/images.dart';
import 'package:foody/views/layout/layout.dart';
import 'package:get/get.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> with SingleTickerProviderStateMixin, UIMixin {
  late SettingController controller;

  @override
  void initState() {
    controller = Get.put(SettingController());
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
                      "Setting",
                      fontSize: 18,
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: 'Admin'),
                        MyBreadcrumbItem(name: 'Setting', active: true),
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
                    MyFlexItem(
                      sizes: "lg-6",
                      child: MyCard(
                        shadow: MyShadow(elevation: 0.5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyContainer.rounded(
                                height: 150,
                                width: 150,
                                paddingAll: 0,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: Image.asset(
                                  Images.avatars[0],
                                  fit: BoxFit.cover,
                                )),
                            MySpacing.height(20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                buildTextField("First Name", "Enter your First Name"),
                                MySpacing.height(20),
                                buildTextField("Last Name", "Enter your Last Name"),
                                MySpacing.height(20),
                                buildTextField("Email Address", "Enter Email Address"),
                                MySpacing.height(20),
                                buildTextField("Contact Number", "Enter Contact Number"),
                                MySpacing.height(20),
                                buildTextField("Address", "Enter Address"),
                                MySpacing.height(16),
                                MyButton(
                                  onPressed: () {},
                                  elevation: 0,
                                  padding: MySpacing.xy(20, 16),
                                  backgroundColor: contentTheme.primary,
                                  borderRadiusAll: AppStyle.buttonRadius.medium,
                                  child: MyText.bodySmall(
                                    'Save',
                                    color: contentTheme.onPrimary,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    MyFlexItem(
                      sizes: "lg-6",
                      child: MyCard(
                        shadow: MyShadow(elevation: 0.5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyText.titleMedium(
                              "Change Password",
                              fontWeight: 600,
                            ),
                            MySpacing.height(20),
                            buildTextField("Current Password", "Current Password"),
                            MySpacing.height(20),
                            buildTextField("New Password", "New Password"),
                            MySpacing.height(20),
                            buildTextField("Confirm Password", "Confirm Password"),
                            MySpacing.height(16),
                            MyButton(
                              onPressed: () {},
                              elevation: 0,
                              padding: MySpacing.xy(20, 16),
                              backgroundColor: contentTheme.primary,
                              borderRadiusAll: AppStyle.buttonRadius.medium,
                              child: MyText.bodySmall(
                                'Conform Password',
                                color: contentTheme.onPrimary,
                              ),
                            ),
                          ],
                        ),
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

  Widget buildTextField(String fieldTitle, String hintText) {
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
