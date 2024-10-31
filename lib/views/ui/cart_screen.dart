import 'package:flutter/material.dart';
import 'package:foody/controller/ui/cart_controller.dart';
import 'package:foody/helpers/utils/ui_mixins.dart';
import 'package:foody/helpers/widgets/my_breadcrumb.dart';
import 'package:foody/helpers/widgets/my_breadcrumb_item.dart';
import 'package:foody/helpers/widgets/my_container.dart';
import 'package:foody/helpers/widgets/my_flex.dart';
import 'package:foody/helpers/widgets/my_flex_item.dart';
import 'package:foody/helpers/widgets/my_spacing.dart';
import 'package:foody/helpers/widgets/my_text.dart';
import 'package:foody/helpers/widgets/responsive.dart';
import 'package:foody/views/layout/layout.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen>
    with SingleTickerProviderStateMixin, UIMixin {
  late CartController controller;

  @override
  void initState() {
    controller = Get.put(CartController());
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
                      "Cart",
                      fontSize: 18,
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: 'Cart', active: true),
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
                        sizes: 'lg-7',
                        child: controller.carts.isNotEmpty
                            ? ListView.separated(
                                shrinkWrap: true,
                                itemCount: controller.carts.length,
                                itemBuilder: (context, index) {
                                  var data = controller.carts[index];
                                  return MyContainer(
                                    child: Row(
                                      children: [
                                        MyContainer(
                                          height: 100,
                                          width: 100,
                                          paddingAll: 0,
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          child: Image.asset(
                                            data.image,
                                          ),
                                        ),
                                        MySpacing.width(16),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            MyText.bodyMedium(
                                              data.name,
                                              fontWeight: 600,
                                            ),
                                            MyText.bodyMedium(
                                              "Price : \$${data.price}",
                                              fontWeight: 600,
                                            ),
                                          ],
                                        ),
                                        Spacer(),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Row(
                                              children: [
                                                MyContainer.rounded(
                                                  onTap: () => controller
                                                      .removeData(data),
                                                  child: Icon(
                                                    LucideIcons.trash,
                                                    size: 20,
                                                    color: contentTheme.danger,
                                                  ),
                                                ),
                                                MyContainer.roundBordered(
                                                  onTap: () {
                                                    controller.decrement(data);
                                                  },
                                                  paddingAll: 4,
                                                  borderRadiusAll: 2,
                                                  child: Icon(
                                                    LucideIcons.minus,
                                                    size: 12,
                                                  ),
                                                ),
                                                MySpacing.width(10),
                                                MyText.bodyMedium(
                                                  data.quantity.toString(),
                                                  fontWeight: 700,
                                                ),
                                                MySpacing.width(10),
                                                MyContainer.roundBordered(
                                                  onTap: () {
                                                    controller.increment(data);
                                                  },
                                                  paddingAll: 4,
                                                  borderRadiusAll: 2,
                                                  child: Icon(
                                                    LucideIcons.plus,
                                                    size: 12,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            MySpacing.height(12),
                                            MyText.bodyMedium(
                                              "Sub Total : \$${data.subTotal}",
                                              fontWeight: 600,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return SizedBox(
                                    height: 12,
                                  );
                                },
                              )
                            : Column(
                                children: [
                                  MyText.titleLarge(
                                    "Data Not Found...",
                                    fontWeight: 600,
                                  ),
                                  MySpacing.height(24),
                                  MyContainer(
                                    onTap: () => controller.gotoExplore(),
                                    child: MyText.bodyLarge(
                                      "Explore Food",
                                      fontWeight: 600,
                                    ),
                                  )
                                ],
                              )),
                    MyFlexItem(
                        sizes: 'lg-5',
                        child: MyContainer(
                          child: buildCard(),
                        )),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buildCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText.bodyLarge(
          'Cart Total',
          fontWeight: 600,
        ),
        MySpacing.height(20),
        buildCardDetail('sub-total', '\$230'),
        MySpacing.height(12),
        buildCardDetail('Delivery', 'Free'),
        MySpacing.height(12),
        buildCardDetail('Discount', '\$20'),
        MySpacing.height(12),
        buildCardDetail('Tax', '\$30.82'),
        MySpacing.height(12),
        Divider(),
        MySpacing.height(12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyText.bodyLarge(
              "Total",
              fontWeight: 600,
            ),
            MyText.bodyLarge(
              "\$280.82",
              fontWeight: 600,
            )
          ],
        ),
        MySpacing.height(12),
        MyContainer(
          onTap: () {},
          width: double.infinity,
          borderRadiusAll: 30,
          paddingAll: 12,
          color: contentTheme.primary,
          child: Center(
              child: MyText.bodyMedium(
            'Proceed to Checkout',
            fontWeight: 600,
            color: contentTheme.onPrimary,
          )),
        ),
        MySpacing.height(20),
        Divider(),
        MySpacing.height(20),
        MyText.bodyLarge(
          'Apply Code',
          fontWeight: 600,
        ),
        MySpacing.height(20),
        TextField(
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              hintText: "Apply Coupon Code"),
        ),
        MySpacing.height(20),
        MyContainer(
          onTap: () {},
          width: double.infinity,
          borderRadiusAll: 30,
          paddingAll: 12,
          color: contentTheme.primary,
          child: Center(
              child: MyText.bodyMedium(
            'Apply Code',
            fontWeight: 600,
            color: contentTheme.onPrimary,
          )),
        ),
      ],
    );
  }

  Widget buildCardDetail(String title, String subTitle) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MyText.bodyMedium(
          title,
          fontWeight: 600,
          muted: true,
        ),
        MyText.bodyMedium(
          subTitle,
          fontWeight: 600,
          muted: true,
        )
      ],
    );
  }
}
