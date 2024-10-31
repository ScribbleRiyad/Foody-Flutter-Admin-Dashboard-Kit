import 'package:flutter/material.dart';
import 'package:foody/controller/ui/restaurant/restaurants_list_controller.dart';
import 'package:foody/helpers/utils/ui_mixins.dart';
import 'package:foody/helpers/widgets/my_breadcrumb.dart';
import 'package:foody/helpers/widgets/my_breadcrumb_item.dart';
import 'package:foody/helpers/widgets/my_container.dart';
import 'package:foody/helpers/widgets/my_flex.dart';
import 'package:foody/helpers/widgets/my_flex_item.dart';
import 'package:foody/helpers/widgets/my_spacing.dart';
import 'package:foody/helpers/widgets/my_text.dart';
import 'package:foody/helpers/widgets/responsive.dart';
import 'package:foody/model/restaurant_data.dart';
import 'package:foody/views/layout/layout.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

class RestaurantsListScreen extends StatefulWidget {
  const RestaurantsListScreen({super.key});

  @override
  State<RestaurantsListScreen> createState() => _RestaurantsListScreenState();
}

class _RestaurantsListScreenState extends State<RestaurantsListScreen> with SingleTickerProviderStateMixin, UIMixin {
  late RestaurantsListController controller;

  @override
  void initState() {
    controller = Get.put(RestaurantsListController());
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
                      "Restaurants List",
                      fontSize: 18,
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: 'Admin'),
                        MyBreadcrumbItem(name: 'Restaurants List', active: true),
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
                                      "Add a new Restaurants",
                                      color: contentTheme.onPrimary,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          MySpacing.height(16),
                          GridView.builder(
                            shrinkWrap: true,
                            primary: false,
                            itemCount: controller.restaurant.length,
                            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 400, crossAxisSpacing: 16, mainAxisSpacing: 16, mainAxisExtent: 340),
                            itemBuilder: (context, index) {
                              RestaurantData data = controller.restaurant[index];
                              return Stack(
                                children: [
                                  MyContainer(
                                    paddingAll: 20,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Center(
                                          child: MyContainer.rounded(
                                            height: 80,
                                            width: 80,
                                            paddingAll: 0,
                                            clipBehavior: Clip.antiAliasWithSaveLayer,
                                            child: Image.asset(
                                              data.image,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        MyText.titleMedium(data.name, textAlign: TextAlign.center, overflow: TextOverflow.ellipsis, fontWeight: 600),
                                        Wrap(
                                          clipBehavior: Clip.antiAliasWithSaveLayer,
                                          runSpacing: 12,
                                          spacing: 12,
                                          runAlignment: WrapAlignment.spaceBetween,
                                          crossAxisAlignment: WrapCrossAlignment.start,
                                          alignment: WrapAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: 128,
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  MyText.bodySmall("Total Product : "),
                                                  MyText.bodySmall(
                                                    data.totalProduct.toString(),
                                                    fontWeight: 600,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 125,
                                              child: Row(
                                                children: [
                                                  MyText.bodySmall("Total Sales : "),
                                                  MyText.bodySmall(
                                                    data.totalSales.toString(),
                                                    fontWeight: 600,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Icon(LucideIcons.mapPin, size: 16),
                                            MySpacing.width(8),
                                            Expanded(
                                              child: MyText.bodySmall(
                                                data.address,
                                                fontWeight: 600,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Icon(LucideIcons.mail, size: 16),
                                            MySpacing.width(8),
                                            Expanded(
                                              child: MyText.bodySmall(
                                                data.email,
                                                fontWeight: 600,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Icon(LucideIcons.phone, size: 16),
                                            MySpacing.width(8),
                                            Expanded(
                                              child: MyText.bodySmall(
                                                data.phoneNumber,
                                                overflow: TextOverflow.ellipsis,
                                                fontWeight: 600,
                                              ),
                                            ),
                                          ],
                                        ),
                                        MyContainer(
                                          onTap: () => controller.gotoRestaurantDetail(),
                                          color: contentTheme.primary,
                                          paddingAll: 8,
                                          child: MyText.labelMedium(
                                            "View Detail",
                                            color: contentTheme.onPrimary,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    right: 20,
                                    top: 20,
                                    child: InkWell(
                                      onTap: () => controller.gotoEditScreen(),
                                      child: Icon(
                                        LucideIcons.edit,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ],
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
}
