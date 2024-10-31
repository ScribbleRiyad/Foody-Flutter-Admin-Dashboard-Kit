import 'package:flutter/material.dart';
import 'package:foody/controller/ui/food/food_controller.dart';
import 'package:foody/helpers/utils/ui_mixins.dart';
import 'package:foody/helpers/widgets/my_breadcrumb.dart';
import 'package:foody/helpers/widgets/my_breadcrumb_item.dart';
import 'package:foody/helpers/widgets/my_container.dart';
import 'package:foody/helpers/widgets/my_list_extension.dart';
import 'package:foody/helpers/widgets/my_spacing.dart';
import 'package:foody/helpers/widgets/my_text.dart';
import 'package:foody/helpers/widgets/responsive.dart';
import 'package:foody/images.dart';
import 'package:foody/views/layout/layout.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

class FoodListScreen extends StatefulWidget {
  const FoodListScreen({super.key});

  @override
  State<FoodListScreen> createState() => _FoodListScreenState();
}

class _FoodListScreenState extends State<FoodListScreen> with SingleTickerProviderStateMixin, UIMixin {
  late FoodController controller;

  @override
  void initState() {
    controller = Get.put(FoodController());
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
                      "Food List",
                      fontSize: 18,
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: 'Admin'),
                        MyBreadcrumbItem(name: 'Food List', active: true),
                      ],
                    ),
                  ],
                ),
              ),
              MySpacing.height(flexSpacing),
              Padding(
                padding: MySpacing.x(flexSpacing),
                child: MyContainer(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 250,
                            child: TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(4),
                                    ),
                                  ),
                                  prefixIcon: Icon(LucideIcons.search, size: 20),
                                  hintText: 'Search',
                                  contentPadding: MySpacing.xy(12, 4)),
                            ),
                          ),
                          MyContainer(
                            onTap: () => controller.gotoAddScreen(),
                            paddingAll: 8,
                            color: contentTheme.primary,
                            child: Row(
                              children: [
                                Icon(
                                  LucideIcons.plus,
                                  size: 20,
                                  color: contentTheme.onPrimary,
                                ),
                                MySpacing.width(8),
                                MyText.bodyMedium(
                                  "Add New Food",
                                  color: contentTheme.onPrimary,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: MyContainer.none(
                          borderRadiusAll: 4,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: DataTable(
                              sortAscending: true,
                              onSelectAll: (_) => {},
                              dataRowMaxHeight: 60,
                              columnSpacing: 220,
                              showBottomBorder: true,
                              showCheckboxColumn: true,
                              columns: [
                                DataColumn(
                                    label: MyText.labelLarge(
                                  'Product',
                                )),
                                DataColumn(
                                    label: MyText.labelLarge(
                                  'SKU',
                                )),
                                DataColumn(
                                    label: MyText.labelLarge(
                                  'Price',
                                )),
                                DataColumn(
                                    label: MyText.labelLarge(
                                  'Rating',
                                )),
                                DataColumn(
                                    label: MyText.labelLarge(
                                  'Status',
                                )),
                                DataColumn(
                                    label: MyText.labelLarge(
                                  'Action',
                                )),
                              ],
                              rows: controller.productList
                                  .mapIndexed(
                                    (index, data) => DataRow(
                                      cells: [
                                        DataCell(Row(
                                          children: [
                                            MyContainer.rounded(
                                              paddingAll: 0,
                                              height: 40,
                                              width: 40,
                                              clipBehavior: Clip.antiAliasWithSaveLayer,
                                              child: Image.asset(Images.food[index % Images.food.length]),
                                            ),
                                            MySpacing.width(8),
                                            MyText.bodySmall(
                                              data.name,
                                              fontWeight: 600,
                                            ),
                                          ],
                                        )),
                                        DataCell(MyText.bodySmall(
                                          "SKU-${data.sku}",
                                          fontWeight: 600,
                                        )),
                                        DataCell(MyText.bodySmall(
                                          "\$${data.price}.00",
                                          fontWeight: 600,
                                        )),
                                        DataCell(Row(
                                          children: [
                                            Icon(LucideIcons.star, size: 16, color: contentTheme.primary),
                                            MySpacing.width(8),
                                            MyText.bodySmall(
                                              "${data.rating}",
                                              fontWeight: 600,
                                            ),
                                          ],
                                        )),
                                        DataCell(MyContainer(
                                          padding: MySpacing.xy(12, 4),
                                          color: data.status == "Draft"
                                              ? contentTheme.primary.withAlpha(36)
                                              : data.status == "Publish"
                                                  ? contentTheme.success.withAlpha(36)
                                                  : data.status == "Pending"
                                                      ? contentTheme.danger.withAlpha(36)
                                                      : null,
                                          child: MyText.bodySmall(
                                            data.status,
                                            color: data.status == "Draft"
                                                ? contentTheme.primary
                                                : data.status == "Publish"
                                                    ? contentTheme.success
                                                    : data.status == "Pending"
                                                        ? contentTheme.danger
                                                        : null,
                                            fontWeight: 600,
                                          ),
                                        )),
                                        DataCell(Row(
                                          children: [
                                            InkWell(onTap: () => controller.gotoEditScreen(), child: Icon(LucideIcons.edit, size: 16)),
                                            MySpacing.width(8),
                                            InkWell(onTap: () => controller.gotoDetailScreen(), child: Icon(LucideIcons.eye, size: 16)),
                                          ],
                                        ))
                                      ],
                                    ),
                                  )
                                  .toList()),
                        ),
                      ),
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
}
