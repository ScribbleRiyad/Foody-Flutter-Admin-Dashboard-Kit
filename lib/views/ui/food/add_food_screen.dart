import 'package:flutter/material.dart';
import 'package:foody/controller/ui/food/add_food_controller.dart';
import 'package:foody/helpers/utils/ui_mixins.dart';
import 'package:foody/helpers/utils/utils.dart';
import 'package:foody/helpers/widgets/my_breadcrumb.dart';
import 'package:foody/helpers/widgets/my_breadcrumb_item.dart';
import 'package:foody/helpers/widgets/my_container.dart';
import 'package:foody/helpers/widgets/my_dotted_line.dart';
import 'package:foody/helpers/widgets/my_flex.dart';
import 'package:foody/helpers/widgets/my_flex_item.dart';
import 'package:foody/helpers/widgets/my_list_extension.dart';
import 'package:foody/helpers/widgets/my_spacing.dart';
import 'package:foody/helpers/widgets/my_text.dart';
import 'package:foody/helpers/widgets/my_text_style.dart';
import 'package:foody/helpers/widgets/responsive.dart';
import 'package:foody/views/layout/layout.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

class AddFoodScreen extends StatefulWidget {
  const AddFoodScreen({super.key});

  @override
  State<AddFoodScreen> createState() => _AddFoodScreenState();
}

class _AddFoodScreenState extends State<AddFoodScreen> with SingleTickerProviderStateMixin, UIMixin {
  late AddFoodController controller;

  @override
  void initState() {
    controller = Get.put(AddFoodController());
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
                      "Add Food",
                      fontSize: 18,
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: 'Admin'),
                        MyBreadcrumbItem(name: 'Add Food', active: true),
                      ],
                    ),
                  ],
                ),
              ),
              MySpacing.height(flexSpacing),
              Padding(
                padding: MySpacing.x(flexSpacing / 2),
                child: MyFlex(children: [
                  MyFlexItem(
                    sizes: 'lg-6',
                    child: MyContainer(
                      paddingAll: 20,
                      child: Column(
                        children: [
                          buildTextField("Product Name", "Enter Product Name"),
                          MySpacing.height(20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyText.labelMedium(
                                "Description",
                              ),
                              MySpacing.height(12),
                              TextFormField(
                                keyboardType: TextInputType.multiline,
                                maxLines: 3,
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
                          MySpacing.height(20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyText.labelMedium(
                                "Category",
                              ),
                              MySpacing.height(12),
                              DropdownButtonFormField<Category>(
                                dropdownColor: contentTheme.background,
                                isDense: true,
                                items: Category.values
                                    .map(
                                      (category) => DropdownMenuItem<Category>(
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
                                  hintText: "Enter your Category",
                                  hintStyle: MyTextStyle.bodySmall(xMuted: true),
                                  border: outlineInputBorder,
                                  enabledBorder: outlineInputBorder,
                                  focusedBorder: focusedInputBorder,
                                  contentPadding: MySpacing.all(12),
                                  isCollapsed: true,
                                  floatingLabelBehavior: FloatingLabelBehavior.never,
                                ),
                                onChanged: controller.basicValidator.onChanged<Object?>(
                                  'Category',
                                ),
                              )
                            ],
                          ),
                          MySpacing.height(20),
                          buildTextField("Price", "Enter Price"),
                        ],
                      ),
                    ),
                  ),
                  MyFlexItem(
                      sizes: 'lg-6',
                      child: MyContainer(
                        paddingAll: 20,
                        child: Column(
                          children: [
                            buildTextField("Qty", "Enter quantity"),
                            MySpacing.height(20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyText.labelMedium(
                                  "Category",
                                ),
                                MySpacing.height(12),
                                DropdownButtonFormField<Status>(
                                  dropdownColor: contentTheme.background,
                                  isDense: true,
                                  items: Status.values
                                      .map(
                                        (status) => DropdownMenuItem<Status>(
                                          value: status,
                                          child: MyText.labelMedium(
                                            status.name.capitalize!,
                                          ),
                                        ),
                                      )
                                      .toList(),
                                  icon: Icon(
                                    LucideIcons.chevronDown,
                                    size: 20,
                                  ),
                                  decoration: InputDecoration(
                                    hintText: "Enter your Category",
                                    hintStyle: MyTextStyle.bodySmall(xMuted: true),
                                    border: outlineInputBorder,
                                    enabledBorder: outlineInputBorder,
                                    focusedBorder: focusedInputBorder,
                                    contentPadding: MySpacing.all(12),
                                    isCollapsed: true,
                                    floatingLabelBehavior: FloatingLabelBehavior.never,
                                  ),
                                  onChanged: controller.basicValidator.onChanged<Object?>(
                                    'Status',
                                  ),
                                )
                              ],
                            ),
                            MySpacing.height(20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                MyText.bodyMedium(
                                  "Please upload any file to see a previews",
                                  fontSize: 12,
                                  fontWeight: 600,
                                ),
                                MySpacing.height(12),
                                InkWell(
                                  onTap: controller.pickFile,
                                  child: MyDottedLine(
                                    strokeWidth: 0.2,
                                    color: contentTheme.onBackground,
                                    corner: MyDottedLineCorner(
                                      leftBottomCorner: 2,
                                      leftTopCorner: 2,
                                      rightBottomCorner: 2,
                                      rightTopCorner: 2,
                                    ),
                                    child: Center(
                                      heightFactor: 1.5,
                                      child: Padding(
                                        padding: MySpacing.all(8),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            MyContainer(
                                              alignment: Alignment.center,
                                              width: 610,
                                              child: MyText.titleMedium(
                                                "* Recommended resolution is 640*640 with file size",
                                                muted: true,
                                                fontWeight: 500,
                                                fontSize: 16,
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                if (controller.files.isNotEmpty) ...[
                                  MySpacing.height(16),
                                  Wrap(
                                    spacing: 16,
                                    runSpacing: 16,
                                    children: controller.files
                                        .mapIndexed((index, file) => MyContainer.bordered(
                                              paddingAll: 8,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  MyContainer(
                                                    color: contentTheme.onBackground.withAlpha(28),
                                                    paddingAll: 8,
                                                    child: Icon(
                                                      LucideIcons.file,
                                                      size: 20,
                                                    ),
                                                  ),
                                                  MySpacing.width(16),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      MyText.bodyMedium(
                                                        file.name,
                                                        maxLines: 1,
                                                        overflow: TextOverflow.ellipsis,
                                                        fontWeight: 600,
                                                      ),
                                                      MyText.bodySmall(Utils.getStorageStringFromByte(file.bytes?.length ?? 0)),
                                                    ],
                                                  ),
                                                  MySpacing.width(32),
                                                  MyContainer.roundBordered(
                                                    onTap: () => controller.removeFile(file),
                                                    paddingAll: 4,
                                                    child: Icon(
                                                      LucideIcons.x,
                                                      size: 16,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ))
                                        .toList(),
                                  )
                                ],
                              ],
                            ),
                            MySpacing.height(20),
                            Row(
                              children: [
                                MyContainer(
                                  onTap: () {},
                                  color: contentTheme.secondary,
                                  paddingAll: 8,
                                  child: MyText.bodyMedium(
                                    "Cancel",
                                    color: contentTheme.onSecondary,
                                    fontWeight: 600,
                                  ),
                                ),
                                MySpacing.width(20),
                                MyContainer(
                                  paddingAll: 8,
                                  onTap: () {},
                                  color: contentTheme.primary,
                                  child: MyText.bodyMedium(
                                    "Add Product",
                                    fontWeight: 600,
                                    color: contentTheme.onPrimary,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )),
                ]),
              ),
            ],
          );
        },
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
        MyText.labelMedium(
          fieldTitle,
        ),
        MySpacing.height(12),
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
