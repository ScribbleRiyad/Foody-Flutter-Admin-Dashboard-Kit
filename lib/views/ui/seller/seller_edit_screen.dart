import 'package:flutter/material.dart';
import 'package:foody/controller/ui/seller/seller_edit_controller.dart';
import 'package:foody/helpers/utils/ui_mixins.dart';
import 'package:foody/helpers/widgets/my_breadcrumb.dart';
import 'package:foody/helpers/widgets/my_breadcrumb_item.dart';
import 'package:foody/helpers/widgets/my_container.dart';
import 'package:foody/helpers/widgets/my_flex.dart';
import 'package:foody/helpers/widgets/my_flex_item.dart';
import 'package:foody/helpers/widgets/my_spacing.dart';
import 'package:foody/helpers/widgets/my_text.dart';
import 'package:foody/helpers/widgets/my_text_style.dart';
import 'package:foody/helpers/widgets/responsive.dart';
import 'package:foody/views/layout/layout.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

class SellerEditScreen extends StatefulWidget {
  const SellerEditScreen({super.key});

  @override
  State<SellerEditScreen> createState() => _SellerEditScreenState();
}

class _SellerEditScreenState extends State<SellerEditScreen> with SingleTickerProviderStateMixin, UIMixin {
  late SellerEditController controller;

  @override
  void initState() {
    controller = Get.put(SellerEditController());
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
                      "Edit Seller",
                      fontSize: 18,
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: 'Admin'),
                        MyBreadcrumbItem(name: 'Edit Detail', active: true),
                      ],
                    ),
                  ],
                ),
              ),
              MySpacing.height(flexSpacing),
              Padding(
                padding: MySpacing.x(flexSpacing),
                child: MyContainer(
                  padding: MySpacing.xy(20, 20),
                  child: Column(
                    children: [
                      MyFlex(
                        children: [
                          MyFlexItem(
                            sizes: "md-6 sm-12",
                            child: buildTextField('First Name', "Enter First Name", controller.basicValidator.getController('first_name')),
                          ),
                          MyFlexItem(
                            sizes: "md-6 sm-12",
                            child: buildTextField("Last Name", "Enter Last Name", controller.basicValidator.getController('last_name')),
                          ),
                          MyFlexItem(
                            sizes: "md-6 sm-12",
                            child: buildTextField('User Name', "Enter User Name", controller.basicValidator.getController('user_name')),
                          ),
                          MyFlexItem(
                            sizes: "md-6 sm-12",
                            child: buildTextField("Email", "Enter Email", controller.basicValidator.getController('email')),
                          ),
                          MyFlexItem(
                            sizes: "md-6 sm-12",
                            child: buildTextField('Phone Number', "Enter Phone Number", controller.basicValidator.getController('phone_number')),
                          ),
                          MyFlexItem(
                              sizes: "md-6 sm-12",
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MyText.labelMedium(
                                    "Country",
                                  ),
                                  MySpacing.height(8),
                                  DropdownButtonFormField<Country>(
                                    dropdownColor: contentTheme.background,
                                    isDense: true,
                                    items: Country.values
                                        .map(
                                          (category) => DropdownMenuItem<Country>(
                                            value: category,
                                            child: MyText.labelMedium(
                                              category.name.capitalize!,
                                            ),
                                          ),
                                        )
                                        .toList(),
                                    icon: Icon(
                                      LucideIcons.chevronDown,
                                      size: 20,
                                    ),
                                    decoration: InputDecoration(
                                      hintText: "Select Country",
                                      hintStyle: MyTextStyle.bodySmall(xMuted: true),
                                      border: outlineInputBorder,
                                      enabledBorder: outlineInputBorder,
                                      focusedBorder: focusedInputBorder,
                                      contentPadding: MySpacing.all(12),
                                      isCollapsed: true,
                                      floatingLabelBehavior: FloatingLabelBehavior.never,
                                    ),
                                    onChanged: controller.basicValidator.onChanged<Object?>(
                                      'Country',
                                    ),
                                  )
                                ],
                              )),
                          MyFlexItem(
                              sizes: "md-6 sm-12",
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MyText.labelMedium(
                                    "State",
                                  ),
                                  MySpacing.height(8),
                                  DropdownButtonFormField<StateName>(
                                    dropdownColor: contentTheme.background,
                                    isDense: true,
                                    items: StateName.values
                                        .map(
                                          (category) => DropdownMenuItem<StateName>(
                                            value: category,
                                            child: MyText.labelMedium(
                                              category.name.capitalize!,
                                            ),
                                          ),
                                        )
                                        .toList(),
                                    icon: Icon(
                                      LucideIcons.chevronDown,
                                      size: 20,
                                    ),
                                    decoration: InputDecoration(
                                      hintText: "Select State",
                                      hintStyle: MyTextStyle.bodySmall(xMuted: true),
                                      border: outlineInputBorder,
                                      enabledBorder: outlineInputBorder,
                                      focusedBorder: focusedInputBorder,
                                      contentPadding: MySpacing.all(12),
                                      isCollapsed: true,
                                      floatingLabelBehavior: FloatingLabelBehavior.never,
                                    ),
                                    onChanged: controller.basicValidator.onChanged<Object?>(
                                      'State',
                                    ),
                                  )
                                ],
                              )),
                          MyFlexItem(
                            sizes: "md-6 sm-12",
                            child: buildTextField('Zip Code', "Enter Zip Code", controller.basicValidator.getController('zip_code')),
                          ),
                          MyFlexItem(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyText.labelMedium(
                                  "Description",
                                ),
                                MySpacing.height(8),
                                TextFormField(
                                  controller: controller.basicValidator.getController('description'),
                                  keyboardType: TextInputType.multiline,
                                  maxLines: 3,
                                  style: MyTextStyle.bodySmall(),
                                  decoration: InputDecoration(
                                    hintText: "It's contains blah blah things",
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
                        ],
                      ),
                      MySpacing.height(20),
                      Padding(
                        padding: MySpacing.right(12),
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
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  buildTextField(String fieldTitle, String hintText, TextEditingController? controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText.labelMedium(
          fieldTitle
        ),
        MySpacing.height(8),
        TextFormField(
          controller: controller,
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
