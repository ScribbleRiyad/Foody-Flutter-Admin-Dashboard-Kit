import 'package:flutter/material.dart';
import 'package:foody/controller/ui/foods_controller.dart';
import 'package:foody/helpers/theme/app_style.dart';
import 'package:foody/helpers/theme/app_themes.dart';
import 'package:foody/helpers/utils/ui_mixins.dart';
import 'package:foody/helpers/widgets/my_breadcrumb.dart';
import 'package:foody/helpers/widgets/my_breadcrumb_item.dart';
import 'package:foody/helpers/widgets/my_container.dart';
import 'package:foody/helpers/widgets/my_flex.dart';
import 'package:foody/helpers/widgets/my_flex_item.dart';
import 'package:foody/helpers/widgets/my_spacing.dart';
import 'package:foody/helpers/widgets/my_star_rating.dart';
import 'package:foody/helpers/widgets/my_text.dart';
import 'package:foody/helpers/widgets/responsive.dart';
import 'package:foody/model/product_data.dart';
import 'package:foody/views/layout/layout.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

class FoodsScreen extends StatefulWidget {
  const FoodsScreen({super.key});

  @override
  State<FoodsScreen> createState() => _FoodsScreenState();
}

class _FoodsScreenState extends State<FoodsScreen>
    with SingleTickerProviderStateMixin, UIMixin {
  late FoodsController controller;

  @override
  void initState() {
    controller = Get.put(FoodsController());
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
                      "Foods",
                      fontSize: 18,
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: 'Foods', active: true),
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
                      sizes: 'lg-3',
                      child: priceRange()),
                  MyFlexItem(
                      sizes: 'lg-9',
                      child: productGrid()),
                ]),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget priceRange(){
    return MyContainer(
      paddingAll: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: MySpacing.xy(12, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText.bodyMedium("Range Price",
                    fontWeight: 600),
                MySpacing.height(12),
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    MyText.bodyLarge(
                      "\$${controller.rangeSlider.start.toString()}",
                      fontWeight: 600,
                    ),
                    MyText.bodyLarge(
                      "\$${controller.rangeSlider.end.toString()}",
                      fontWeight: 600,
                    ),
                  ],
                ),
                RangeSlider(
                  min: 10,
                  max: 100,
                  divisions: 10,
                  labels: RangeLabels(
                      controller.rangeSlider.start
                          .floor()
                          .toString(),
                      controller.rangeSlider.end
                          .floor()
                          .toString()),
                  values: controller.rangeSlider,
                  onChanged: controller.onChangeRangeSlider,
                  activeColor:
                  theme.sliderTheme.activeTrackColor,
                  inactiveColor:
                  theme.sliderTheme.inactiveTrackColor,
                ),
              ],
            ),
          ),
          Divider(),
          Padding(
            padding: MySpacing.xy(12, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText.bodyMedium(
                  "Categories",
                  fontWeight: 600,
                ),
                MySpacing.height(12),
                Column(
                  children: List.generate(
                    controller.checkListItems.length,
                        (index) => CheckboxListTile(
                      controlAffinity:
                      ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.zero,
                      dense: true,
                      title: MyText.bodySmall(
                        controller.checkListItems[index]
                        ['title'],
                        fontWeight: 600,
                      ),
                      value: controller.checkListItems[index]
                      ["value"],
                      onChanged: (value) {
                        setState(() {
                          controller.checkListItems[index]["value"] = value;
                          if (controller.multipleSelected.contains(controller.checkListItems[index])) {
                            controller.multipleSelected.remove(controller.checkListItems[index]);
                          } else {
                            controller.multipleSelected.add(controller.checkListItems[index]);
                          }
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: MySpacing.xy(12, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText.bodyMedium("Rating", fontWeight: 600),
                MySpacing.height(12),
                buildRating(5),
                MySpacing.height(8),
                buildRating(4),
                MySpacing.height(8),
                buildRating(3),
                MySpacing.height(8),
                buildRating(2),
                MySpacing.height(8),
                buildRating(1),
                MySpacing.height(8),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget productGrid(){
    return MyContainer(
      borderRadiusAll: 8,
      paddingAll: 20,
      child
          : Column(
        children: [
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              filled: true,
              hintText: "Search by product name",
              prefixIcon: Icon(
                LucideIcons.search,
                size: 20,
              ),
            ),
          ),
          MySpacing.height(20),
          GridView.builder(
            shrinkWrap: true,
            primary: true,
            itemCount: controller.products.length,
            gridDelegate:
            SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 400,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                mainAxisExtent: 344),
            itemBuilder: (context, index) {
              ProductData product = controller.products[index];
              return StarLike(productData: product);
            },
          )
        ],
      ),
    );
  }

  Widget buildRating(double rating) {
    return MyStarRating(
      rating: rating,
      size: 20,
      spacing: 12,
      inactiveColor: contentTheme.secondary,
      activeColor: AppColors.star,
    );
  }
}

class StarLike extends StatefulWidget {
  final ProductData productData;

  const StarLike({super.key, required this.productData});

  @override
  State<StarLike> createState() => _StarLikeState();
}

class _StarLikeState extends State<StarLike> with UIMixin {
  late ProductData productData;
  bool isLiked = false;

  @override
  void initState() {
    productData = widget.productData;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MyContainer.bordered(
      borderRadiusAll: 8,
      paddingAll: 0,
      child: Column(
        children: [
          Padding(
            padding: MySpacing.xy(12, 12),
            child: Column(
              children: [
                Image.asset(
                  productData.image,
                  fit: BoxFit.cover,
                  height: 100,
                ),
                MySpacing.height(12),
                MyText.bodyLarge(
                  productData.name,
                  fontWeight: 600,
                ),
                MySpacing.height(12),
                MyStarRating(
                  rating: productData.star,
                  size: 20,
                  inactiveColor: contentTheme.secondary,
                  activeColor: AppColors.star,
                ),
                MySpacing.height(12),
                MyText.bodyLarge(
                  "\$${productData.price}.00",
                  fontWeight: 600,
                ),
                MySpacing.height(12),
                MyContainer(
                  onTap: () {},
                  paddingAll: 8,
                  color: contentTheme.primary,
                  child: MyText.bodyMedium(
                    "Add To cart",
                    color: contentTheme.onPrimary,
                    fontWeight: 600,
                  ),
                )
              ],
            ),
          ),
          Divider(),
          Padding(
            padding: MySpacing.only(left: 20, top: 12, right: 20, bottom: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      isLiked = !isLiked;
                    });
                  },
                  child: Icon(
                      !isLiked ? Icons.favorite_outline : Icons.favorite,
                      size: 20,
                      color: contentTheme.primary),
                ),
                MyText.bodyMedium(
                  "In Stock : ${productData.inStock}",
                  fontWeight: 600,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
