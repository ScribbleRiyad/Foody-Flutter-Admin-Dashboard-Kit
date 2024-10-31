import 'package:foody/controller/ui/dialogs_controller.dart';
import 'package:foody/helpers/utils/my_shadow.dart';
import 'package:foody/helpers/utils/ui_mixins.dart';
import 'package:foody/helpers/widgets/my_breadcrumb.dart';
import 'package:foody/helpers/widgets/my_breadcrumb_item.dart';
import 'package:foody/helpers/widgets/my_button.dart';
import 'package:foody/helpers/widgets/my_card.dart';
import 'package:foody/helpers/widgets/my_flex.dart';
import 'package:foody/helpers/widgets/my_flex_item.dart';
import 'package:foody/helpers/widgets/my_spacing.dart';
import 'package:foody/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:foody/helpers/widgets/responsive.dart';
import 'package:foody/views/layout/layout.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

class DialogsScreen extends StatefulWidget {
  const DialogsScreen({super.key});

  @override
  State<DialogsScreen> createState() => _DialogsScreenState();
}

class _DialogsScreenState extends State<DialogsScreen>
    with SingleTickerProviderStateMixin, UIMixin {
  late DialogsController controller;

  @override
  void initState() {
    controller = DialogsController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: GetBuilder(
        init: controller,
        tag: 'dialogs_controller',
        builder: (controller) {
          return Column(
            children: [
              Padding(
                padding: MySpacing.x(flexSpacing),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText.titleMedium(
                      "Dialogs",
                      fontSize: 18,
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: 'Widget'),
                        MyBreadcrumbItem(name: 'Dialogs', active: true),
                      ],
                    ),
                  ],
                ),
              ),
              MySpacing.height(flexSpacing),
              Padding(
                  padding: MySpacing.x(flexSpacing / 2),
                  child: MyFlex(children: [
                    MyFlexItem(sizes: 'lg-3 md-6', child: alertBox()),
                    MyFlexItem(sizes: 'lg-3 md-6', child: standardBox()),
                    MyFlexItem(sizes: 'lg-3 md-6', child: fullWidget()),
                    MyFlexItem(sizes: 'lg-3 md-6', child: leftPosition()),
                    MyFlexItem(sizes: 'lg-3 md-6', child: rightPosition()),
                    MyFlexItem(sizes: 'lg-3 md-6', child: topPosition()),
                    MyFlexItem(sizes: 'lg-3 md-6', child: bottomPosition()),
                    MyFlexItem(sizes: 'lg-3 md-6', child: staticBox()),
                  ])),
            ],
          );
        },
      ),
    );
  }

  Widget alertBox() {
    return MyCard(
      height: 150,
      shadow: MyShadow(position: MyShadowPosition.bottom, elevation: .5),
      borderRadiusAll: 8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MyText.titleMedium("Alert Box", fontWeight: 600),
          MySpacing.height(12),
          MyText.bodySmall("Simple default Alert Example", fontWeight: 600),
          MySpacing.height(12),
          MyButton(
            onPressed: _showAlertDialog,
            elevation: 0,
            padding: MySpacing.xy(24, 20),
            backgroundColor: contentTheme.primary,
            borderRadiusAll: 8,
            child: MyText.bodySmall('Alert',
                fontWeight: 600, color: contentTheme.onPrimary),
          ),
        ],
      ),
    );
  }

  Widget standardBox() {
    return MyCard(
      borderRadiusAll: 8,
      height: 150,
      shadow: MyShadow(elevation: .5, position: MyShadowPosition.bottom),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MyText.titleMedium("Standard Box", fontWeight: 600),
          MyText.bodySmall("Alert with Header and Footer buttons",
              fontWeight: 600),
          MyButton(
            onPressed: _showStandardDialog,
            elevation: 0,
            padding: MySpacing.xy(24, 20),
            backgroundColor: contentTheme.success,
            borderRadiusAll: 8,
            child: MyText.bodySmall('Standard',
                fontWeight: 600, color: contentTheme.onSuccess),
          ),
        ],
      ),
    );
  }

  Widget fullWidget() {
    return MyCard(
      height: 150,
      shadow: MyShadow(elevation: .5, position: MyShadowPosition.bottom),
      borderRadiusAll: 8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MyText.titleMedium("Full Widget", fontWeight: 600),
          MyText.bodySmall("Alert with full width covers most of the screen",
              fontWeight: 600),
          MyButton(
            onPressed: _showFullWidthDialog,
            elevation: 0,
            padding: MySpacing.xy(24, 20),
            backgroundColor: contentTheme.warning,
            borderRadiusAll: 8,
            child: MyText.bodySmall('Full Width',
                fontWeight: 600, color: contentTheme.onWarning),
          ),
        ],
      ),
    );
  }

  Widget leftPosition() {
    return MyCard(
      height: 150,
      shadow: MyShadow(elevation: .5, position: MyShadowPosition.bottom),
      borderRadiusAll: 8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MyText.titleMedium("Left Position", fontWeight: 600),
          MyText.bodySmall("Left Positioned Alert", fontWeight: 600),
          MyButton(
            onPressed: _showLeftDialog,
            elevation: 0,
            padding: MySpacing.xy(24, 20),
            backgroundColor: contentTheme.primary,
            borderRadiusAll: 8,
            child: MyText.bodySmall('Left',
                fontWeight: 600, color: contentTheme.onPrimary),
          ),
        ],
      ),
    );
  }

  Widget rightPosition() {
    return MyCard(
      height: 150,
      shadow: MyShadow(elevation: .5, position: MyShadowPosition.bottom),
      borderRadiusAll: 8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MyText.titleMedium("Right Position", fontWeight: 600),
          MyText.bodySmall("Right Positioned Alert", fontWeight: 600),
          MyButton(
            onPressed: _showRightDialog,
            elevation: 0,
            padding: MySpacing.xy(24, 20),
            backgroundColor: contentTheme.warning,
            borderRadiusAll: 8,
            child: MyText.bodySmall('Right',
                fontWeight: 600, color: contentTheme.onWarning),
          ),
        ],
      ),
    );
  }

  Widget topPosition() {
    return MyCard(
      borderRadiusAll: 8,
      height: 150,
      shadow: MyShadow(position: MyShadowPosition.bottom, elevation: .5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MyText.titleMedium("Top Position", fontWeight: 600),
          MyText.bodySmall("Top Positioned Alert", fontWeight: 600),
          MyButton(
            onPressed: _showTopDialog,
            elevation: 0,
            padding: MySpacing.xy(24, 20),
            backgroundColor: contentTheme.success,
            borderRadiusAll: 8,
            child: MyText.bodySmall('Top',
                fontWeight: 600, color: contentTheme.onSuccess),
          ),
        ],
      ),
    );
  }

  Widget bottomPosition() {
    return MyCard(
      height: 150,
      shadow: MyShadow(elevation: .5, position: MyShadowPosition.bottom),
      borderRadiusAll: 8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MyText.titleMedium("Bottom Position", fontWeight: 600),
          MyText.bodySmall("Bottom Positioned Alert", fontWeight: 600),
          MyButton(
            onPressed: _showBottomDialog,
            elevation: 0,
            padding: MySpacing.xy(24, 20),
            backgroundColor: contentTheme.info,
            borderRadiusAll: 8,
            child: MyText.bodySmall(
              'Bottom',
              fontWeight: 600,
              color: contentTheme.onInfo,
            ),
          ),
        ],
      ),
    );
  }

  Widget staticBox() {
    return MyCard(
      height: 150,
      borderRadiusAll: 8,
      shadow: MyShadow(position: MyShadowPosition.bottom, elevation: .5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MyText.titleMedium("Static", fontWeight: 600),
          MyText.bodySmall(
              "Static Positioned Alert which doesn't close when backdrop is tapped/clicked",
              fontWeight: 600,
              textAlign: TextAlign.center),
          MyButton(
            onPressed: _showStaticDialog,
            elevation: 0,
            padding: MySpacing.xy(24, 20),
            backgroundColor: contentTheme.primary,
            borderRadiusAll: 8,
            child: MyText.bodySmall('Static',
                fontWeight: 600, color: contentTheme.onPrimary),
          ),
        ],
      ),
    );
  }

  void _showAlertDialog() {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            actionsPadding: MySpacing.only(bottom: 16, right: 23),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none),
            title: MyText.labelLarge("confirmation?"),
            content: MyText.bodySmall(
                "Are you sure, you want to delete history?",
                fontWeight: 600),
            actions: [
              MyButton(
                onPressed: () => Get.back(),
                borderRadiusAll: 8,
                elevation: 0,
                padding: MySpacing.xy(20, 16),
                backgroundColor: colorScheme.secondaryContainer,
                child: MyText.labelMedium(
                  "Close",
                  fontWeight: 600,
                  color: colorScheme.onSecondaryContainer,
                ),
              ),
              MyButton(
                onPressed: () => Get.back(),
                elevation: 0,
                borderRadiusAll: 8,
                padding: MySpacing.xy(20, 16),
                backgroundColor: colorScheme.primary,
                child: MyText.labelMedium(
                  "Save",
                  fontWeight: 600,
                  color: colorScheme.onPrimary,
                ),
              ),
            ],
          );
        });
  }

  void _showStandardDialog() {
    showDialog(
        context: context,
        builder: (_) {
          return Dialog(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none),
            child: SizedBox(
              width: 400,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: MySpacing.all(16),
                    child: MyText.labelLarge('Dialog Title', fontWeight: 600),
                  ),
                  Divider(height: 0, thickness: 1),
                  Padding(
                    padding: MySpacing.all(16),
                    child: MyText.bodySmall(controller.dummyTexts[0],
                        fontWeight: 600),
                  ),
                  Divider(height: 0, thickness: 1),
                  Padding(
                    padding: MySpacing.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        MyButton(
                          onPressed: () => Get.back(),
                          elevation: 0,
                          borderRadiusAll: 8,
                          padding: MySpacing.xy(20, 16),
                          backgroundColor: colorScheme.secondaryContainer,
                          child: MyText.labelMedium(
                            "Close",
                            fontWeight: 600,
                            color: colorScheme.onSecondaryContainer,
                          ),
                        ),
                        MySpacing.width(16),
                        MyButton(
                          onPressed: () => Get.back(),
                          elevation: 0,
                          borderRadiusAll: 8,
                          padding: MySpacing.xy(20, 16),
                          backgroundColor: colorScheme.primary,
                          child: MyText.labelMedium(
                            "Save",
                            fontWeight: 600,
                            color: colorScheme.onPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void _showFullWidthDialog() {
    showDialog(
        context: context,
        builder: (_) {
          return Dialog(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: MySpacing.all(16),
                  child: MyText.labelLarge('Dialog Title', fontWeight: 600),
                ),
                Divider(height: 0, thickness: 1),
                Padding(
                  padding: MySpacing.all(16),
                  child: MyText.bodySmall(controller.dummyTexts[1],
                      fontWeight: 600),
                ),
                Divider(height: 0, thickness: 1),
                Padding(
                  padding: MySpacing.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MyButton(
                        onPressed: () => Get.back(),
                        elevation: 0,
                        borderRadiusAll: 8,
                        padding: MySpacing.xy(20, 16),
                        backgroundColor: colorScheme.secondaryContainer,
                        child: MyText.labelMedium(
                          "Close",
                          fontWeight: 600,
                          color: colorScheme.onSecondaryContainer,
                        ),
                      ),
                      MySpacing.width(16),
                      MyButton(
                        onPressed: () => Get.back(),
                        elevation: 0,
                        borderRadiusAll: 8,
                        padding: MySpacing.xy(20, 16),
                        backgroundColor: colorScheme.primary,
                        child: MyText.labelMedium(
                          "Save",
                          fontWeight: 600,
                          color: colorScheme.onPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  void _showRightDialog() {
    showDialog(
        context: context,
        builder: (_) {
          return Dialog(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none),
            insetPadding: MySpacing.fromLTRB(
                MediaQuery.of(context).size.width - 350, 0, 0, 0),
            child: SizedBox(
              width: 300,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: MySpacing.all(16),
                    child: MyText.labelLarge('Right Dialog', fontWeight: 600),
                  ),
                  Divider(height: 0, thickness: 1),
                  Padding(
                    padding: MySpacing.all(16),
                    child: MyText.bodySmall(
                      controller.dummyTexts[2],
                      fontWeight: 600,
                      maxLines: 6,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Divider(height: 0, thickness: 1),
                  Padding(
                    padding: MySpacing.only(right: 20, bottom: 12, top: 14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        MyButton(
                          onPressed: () => Get.back(),
                          elevation: 0,
                          borderRadiusAll: 8,
                          padding: MySpacing.xy(20, 16),
                          backgroundColor: colorScheme.secondaryContainer,
                          child: MyText.labelMedium(
                            "Close",
                            fontWeight: 600,
                            color: colorScheme.onSecondaryContainer,
                          ),
                        ),
                        MySpacing.width(16),
                        MyButton(
                          onPressed: () => Get.back(),
                          elevation: 0,
                          borderRadiusAll: 8,
                          padding: MySpacing.xy(20, 16),
                          backgroundColor: colorScheme.primary,
                          child: MyText.labelMedium(
                            "Save",
                            fontWeight: 600,
                            color: colorScheme.onPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void _showBottomDialog() {
    showDialog(
        context: context,
        builder: (_) {
          return Dialog(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none),
            insetPadding: MySpacing.fromLTRB(
                0, MediaQuery.of(context).size.height - 350, 0, 0),
            child: SizedBox(
              width: 300,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: MySpacing.all(16),
                    child: MyText.labelLarge('Bottom Dialog', fontWeight: 600),
                  ),
                  Divider(height: 0, thickness: 1),
                  Padding(
                    padding: MySpacing.all(16),
                    child: MyText.bodySmall(
                      controller.dummyTexts[3],
                      maxLines: 6,
                      fontWeight: 600,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Divider(height: 0, thickness: 1),
                  Padding(
                    padding: MySpacing.only(right: 20, bottom: 12, top: 14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        MyButton(
                          onPressed: () => Get.back(),
                          elevation: 0,
                          borderRadiusAll: 8,
                          padding: MySpacing.xy(20, 16),
                          backgroundColor: colorScheme.secondaryContainer,
                          child: MyText.labelMedium(
                            "Close",
                            fontWeight: 600,
                            color: colorScheme.onSecondaryContainer,
                          ),
                        ),
                        MySpacing.width(16),
                        MyButton(
                          onPressed: () => Get.back(),
                          elevation: 0,
                          borderRadiusAll: 8,
                          padding: MySpacing.xy(20, 16),
                          backgroundColor: colorScheme.primary,
                          child: MyText.labelMedium(
                            "Save",
                            fontWeight: 600,
                            color: colorScheme.onPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void _showTopDialog() {
    showDialog(
        context: context,
        builder: (_) {
          return Dialog(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none),
            insetPadding: MySpacing.fromLTRB(
                0, 0, 0, MediaQuery.of(context).size.height - 350),
            child: SizedBox(
              width: 300,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: MySpacing.all(16),
                    child: MyText.labelLarge('Top Dialog', fontWeight: 600),
                  ),
                  Divider(height: 0, thickness: 1),
                  Padding(
                    padding: MySpacing.all(16),
                    child: MyText.bodySmall(
                      controller.dummyTexts[4],
                      fontWeight: 600,
                      maxLines: 6,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Divider(height: 0, thickness: 1),
                  Padding(
                    padding: MySpacing.only(right: 20, bottom: 12, top: 14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        MyButton(
                          onPressed: () => Get.back(),
                          elevation: 0,
                          borderRadiusAll: 8,
                          padding: MySpacing.xy(20, 16),
                          backgroundColor: colorScheme.secondaryContainer,
                          child: MyText.labelMedium(
                            "Close",
                            fontWeight: 600,
                            color: colorScheme.onSecondaryContainer,
                          ),
                        ),
                        MySpacing.width(16),
                        MyButton(
                          onPressed: () => Get.back(),
                          elevation: 0,
                          borderRadiusAll: 8,
                          padding: MySpacing.xy(20, 16),
                          backgroundColor: colorScheme.primary,
                          child: MyText.labelMedium(
                            "Save",
                            fontWeight: 600,
                            color: colorScheme.onPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void _showLeftDialog() {
    showDialog(
        context: context,
        builder: (_) {
          return Dialog(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none),
            insetPadding: MySpacing.fromLTRB(
                0, 0, MediaQuery.of(context).size.width - 350, 0),
            child: SizedBox(
              width: 300,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: MySpacing.all(16),
                    child: MyText.labelLarge('Left Dialog', fontWeight: 600),
                  ),
                  Divider(height: 0, thickness: 1),
                  Padding(
                    padding: MySpacing.all(16),
                    child: MyText.bodySmall(
                      controller.dummyTexts[5],
                      fontWeight: 600,
                      maxLines: 6,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Divider(height: 0, thickness: 1),
                  Padding(
                    padding: MySpacing.only(right: 20, bottom: 12, top: 14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        MyButton(
                          onPressed: () => Get.back(),
                          elevation: 0,
                          padding: MySpacing.xy(20, 16),
                          borderRadiusAll: 8,
                          backgroundColor: colorScheme.secondaryContainer,
                          child: MyText.labelMedium(
                            "Close",
                            fontWeight: 600,
                            color: colorScheme.onSecondaryContainer,
                          ),
                        ),
                        MySpacing.width(16),
                        MyButton(
                          onPressed: () => Get.back(),
                          elevation: 0,
                          borderRadiusAll: 8,
                          padding: MySpacing.xy(20, 16),
                          backgroundColor: colorScheme.primary,
                          child: MyText.labelMedium(
                            "Save",
                            fontWeight: 600,
                            color: colorScheme.onPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void _showStaticDialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return Dialog(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none),
            child: SizedBox(
              width: 400,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: MySpacing.all(16),
                    child: Row(
                      children: [
                        Expanded(
                            child: MyText.labelLarge('Static Dialog',
                                fontWeight: 600)),
                        InkWell(
                            onTap: () => Navigator.pop(context),
                            child: Icon(
                              LucideIcons.x,
                              size: 20,
                              color: colorScheme.onSurface.withOpacity(0.5),
                            ))
                      ],
                    ),
                  ),
                  Divider(height: 0, thickness: 1),
                  Padding(
                    padding: MySpacing.all(16),
                    child: MyText.bodySmall(controller.dummyTexts[0],
                        fontWeight: 600),
                  ),
                  Divider(height: 0, thickness: 1),
                  Padding(
                    padding: MySpacing.only(right: 20, bottom: 12, top: 14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        MyButton(
                          onPressed: () => Get.back(),
                          elevation: 0,
                          borderRadiusAll: 8,
                          padding: MySpacing.xy(20, 16),
                          backgroundColor: colorScheme.secondaryContainer,
                          child: MyText.labelMedium(
                            "Close",
                            fontWeight: 600,
                            color: colorScheme.onSecondaryContainer,
                          ),
                        ),
                        MySpacing.width(16),
                        MyButton(
                          onPressed: () => Get.back(),
                          elevation: 0,
                          borderRadiusAll: 8,
                          padding: MySpacing.xy(20, 16),
                          backgroundColor: colorScheme.primary,
                          child: MyText.labelMedium(
                            "Save",
                            fontWeight: 600,
                            color: colorScheme.onPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
