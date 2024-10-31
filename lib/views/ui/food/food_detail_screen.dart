import 'package:flutter/material.dart';
import 'package:foody/controller/ui/food/food_detail_controller.dart';
import 'package:foody/helpers/theme/app_style.dart';
import 'package:foody/helpers/utils/ui_mixins.dart';
import 'package:foody/helpers/widgets/my_breadcrumb.dart';
import 'package:foody/helpers/widgets/my_breadcrumb_item.dart';
import 'package:foody/helpers/widgets/my_button.dart';
import 'package:foody/helpers/widgets/my_container.dart';
import 'package:foody/helpers/widgets/my_flex.dart';
import 'package:foody/helpers/widgets/my_flex_item.dart';
import 'package:foody/helpers/widgets/my_list_extension.dart';
import 'package:foody/helpers/widgets/my_spacing.dart';
import 'package:foody/helpers/widgets/my_star_rating.dart';
import 'package:foody/helpers/widgets/my_text.dart';
import 'package:foody/helpers/widgets/responsive.dart';
import 'package:foody/model/product_data.dart';
import 'package:foody/views/layout/layout.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

class FoodDetailScreen extends StatefulWidget {
  const FoodDetailScreen({super.key});

  @override
  State<FoodDetailScreen> createState() => _FoodDetailScreenState();
}

class _FoodDetailScreenState extends State<FoodDetailScreen> with SingleTickerProviderStateMixin, UIMixin {
  late FoodDetailController controller;

  @override
  void initState() {
    controller = Get.put(FoodDetailController());
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
                      "Food Detail",
                      fontSize: 18,
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: 'Admin'),
                        MyBreadcrumbItem(name: 'Food Detail', active: true),
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
                    MyFlex(
                      wrapAlignment: WrapAlignment.start,
                      wrapCrossAlignment: WrapCrossAlignment.start,
                      children: [
                        MyFlexItem(
                          sizes: "lg-4 md-12",
                          child: MyContainer(
                            paddingAll: 20,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                MyContainer(
                                  borderRadiusAll: 8,
                                  paddingAll: 0,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: Image.asset(
                                    controller.selectedImage,
                                    fit: BoxFit.fitHeight,
                                    height: 300,
                                  ),
                                ),
                                MySpacing.height(20),
                                Wrap(
                                    runAlignment: WrapAlignment.spaceAround,
                                    alignment: WrapAlignment.spaceAround,
                                    crossAxisAlignment: WrapCrossAlignment.center,
                                    runSpacing: 12,
                                    spacing: 12,
                                    children: controller.images.mapIndexed(
                                      (index, image) {
                                        bool isSelected = image == controller.selectedImage;
                                        return MyContainer.bordered(
                                          onTap: () => controller.onChangeImage(image),
                                          height: 100,
                                          border:
                                              Border.all(color: isSelected ? contentTheme.primary : contentTheme.dark, width: isSelected ? 2 : .3),
                                          borderRadiusAll: 8,
                                          clipBehavior: Clip.antiAliasWithSaveLayer,
                                          child: Image.asset(
                                            image,
                                            fit: BoxFit.fill,
                                          ),
                                        );
                                      },
                                    ).toList()),
                              ],
                            ),
                          ),
                        ),
                        MyFlexItem(
                          sizes: "lg-8 md-12",
                          child: MyContainer(
                            height: 450,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyText.bodySmall(
                                  "Food",
                                  fontSize: 12,
                                  color: contentTheme.primary,
                                ),
                                MySpacing.height(12),
                                MyText.titleMedium(
                                  "Baklava",
                                  fontWeight: 600,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                MySpacing.height(12),
                                Row(
                                  children: [
                                    MyStarRating(
                                      rating: 3,
                                      size: 16,
                                      inactiveColor: contentTheme.secondary,
                                      activeColor: AppColors.star,
                                    ),
                                    MySpacing.width(8),
                                    MyText.bodySmall(
                                      "(485 Customer Reviews)",
                                      color: contentTheme.title,
                                    ),
                                  ],
                                ),
                                MySpacing.height(12),
                                MyText.titleSmall(
                                  "Stock : 15kg",
                                  fontWeight: 600,
                                ),
                                MySpacing.height(12),
                                MyText.titleSmall(
                                  "Description :",
                                  fontWeight: 600,
                                ),
                                MySpacing.height(8),
                                MyText.bodySmall(
                                  controller.dummyTexts[0],
                                  maxLines: 4,
                                  overflow: TextOverflow.ellipsis,
                                  muted: true,
                                ),
                                MySpacing.height(12),
                                Row(
                                  children: [
                                    MyText.titleLarge(
                                      "Price :",
                                      fontWeight: 600,
                                    ),
                                    MySpacing.width(8),
                                    MyText.titleLarge(
                                      "\$ 120",
                                      fontWeight: 600,
                                    )
                                  ],
                                ),
                                Spacer(),
                                Row(
                                  children: [
                                    MyButton(
                                      onPressed: () {},
                                      elevation: 0,
                                      borderColor: contentTheme.primary,
                                      backgroundColor: contentTheme.primary.withAlpha(32),
                                      splashColor: contentTheme.primary.withOpacity(0.2),
                                      borderRadiusAll: AppStyle.buttonRadius.medium,
                                      child: MyText.labelMedium(
                                        'Edit Detail',
                                        fontWeight: 600,
                                        color: contentTheme.primary,
                                      ),
                                    ),
                                    MySpacing.width(12),
                                    MyButton(
                                      onPressed: () {},
                                      elevation: 0,
                                      borderColor: contentTheme.danger,
                                      backgroundColor: contentTheme.danger.withAlpha(32),
                                      splashColor: contentTheme.danger.withOpacity(0.2),
                                      borderRadiusAll: AppStyle.buttonRadius.medium,
                                      child: MyText.bodySmall(
                                        'Delete Detail',
                                        fontWeight: 600,
                                        color: contentTheme.danger,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    MySpacing.height(flexSpacing),
                    Padding(
                      padding: MySpacing.x(flexSpacing / 2),
                      child: SizedBox(
                        height: 200,
                        child: Stack(
                          children: [
                            ListView.separated(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.products.length,
                              itemBuilder: (context, index) {
                                ProductData product = controller.products[index];
                                return MyContainer(
                                  width: 151,
                                  onTap: () {},
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset(
                                        product.image,
                                        height: 60,
                                        fit: BoxFit.cover,
                                      ),
                                      MySpacing.height(12),
                                      MyText.titleMedium(product.name, fontWeight: 600),
                                      MySpacing.height(12),
                                      MyStarRating(
                                        rating: product.star,
                                        size: 16,
                                        inactiveColor: contentTheme.secondary,
                                        activeColor: AppColors.star,
                                      ),
                                      MySpacing.height(12),
                                      MyText.bodySmall("\$${product.price}.00", fontWeight: 600),
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  width: 20,
                                );
                              },
                            ),
                            Positioned(
                              right: 0,
                              bottom: 80,
                              child: MyContainer.rounded(
                                onTap: () {},
                                paddingAll: 8,
                                color: contentTheme.primary,
                                child: Icon(
                                  LucideIcons.arrowRight,
                                  color: contentTheme.onPrimary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
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
