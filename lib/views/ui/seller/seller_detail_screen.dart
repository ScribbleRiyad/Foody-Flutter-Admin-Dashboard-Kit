import 'package:flutter/material.dart';
import 'package:foody/controller/ui/seller/seller_detail_controller.dart';
import 'package:foody/helpers/utils/ui_mixins.dart';
import 'package:foody/helpers/utils/utils.dart';
import 'package:foody/helpers/widgets/my_breadcrumb.dart';
import 'package:foody/helpers/widgets/my_breadcrumb_item.dart';
import 'package:foody/helpers/widgets/my_container.dart';
import 'package:foody/helpers/widgets/my_flex.dart';
import 'package:foody/helpers/widgets/my_flex_item.dart';
import 'package:foody/helpers/widgets/my_list_extension.dart';
import 'package:foody/helpers/widgets/my_spacing.dart';
import 'package:foody/helpers/widgets/my_text.dart';
import 'package:foody/helpers/widgets/responsive.dart';
import 'package:foody/images.dart';
import 'package:foody/views/layout/layout.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

class SellerDetailScreen extends StatefulWidget {
  const SellerDetailScreen({super.key});

  @override
  State<SellerDetailScreen> createState() => _SellerDetailScreenState();
}

class _SellerDetailScreenState extends State<SellerDetailScreen> with SingleTickerProviderStateMixin, UIMixin {
  late SellerDetailController controller;

  @override
  void initState() {
    controller = Get.put(SellerDetailController());
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
                      "Seller Detail",
                      fontSize: 18,
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: 'Admin'),
                        MyBreadcrumbItem(name: 'Seller Detail', active: true),
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
                      sizes: 'lg-3 md-6',
                      child: MyContainer(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                MyContainer.rounded(
                                  paddingAll: 0,
                                  height: 60,
                                  width: 60,
                                  child: Image.asset(
                                    Images.avatars[1],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                MySpacing.width(12),
                                MyText.bodyLarge("Den", fontWeight: 600),
                              ],
                            ),
                            Divider(height: 40),
                            buildProfileDetail('Email', "demo@gmail.com"),
                            MySpacing.height(20),
                            buildProfileDetail('Number', "+880 321654654"),
                            MySpacing.height(20),
                            buildProfileDetail('Gender', "Male"),
                            MySpacing.height(20),
                            buildProfileDetail('Birthday', "xx/xx/xxx"),
                            MySpacing.height(20),
                            buildProfileDetail('Registered Since', "xx/xx/xxx"),
                            MySpacing.height(20),
                            buildProfileDetail('Favourite Branch', "Branch A"),
                            MySpacing.height(20),
                            buildProfileDetail('Favourite Item', "Pizza"),
                          ],
                        ),
                      )),
                  MyFlexItem(
                    sizes: 'lg-9 md-6',
                    child: MyFlex(
                      contentPadding: false,
                      children: [
                        MyFlexItem(
                          sizes: 'lg-4',
                          child: buildProfileOverView(
                            contentTheme.info,
                            LucideIcons.percent,
                            "Total Sales",
                            "150",
                          ),
                        ),
                        MyFlexItem(
                          sizes: 'lg-4',
                          child: buildProfileOverView(
                            contentTheme.success,
                            LucideIcons.shoppingCart,
                            "Listed Products",
                            "30",
                          ),
                        ),
                        MyFlexItem(
                          sizes: 'lg-4',
                          child: buildProfileOverView(
                            contentTheme.primary,
                            LucideIcons.star,
                            "Selling Rating",
                            "30",
                          ),
                        ),
                        MyFlexItem(
                          child: MyContainer(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyText.bodyLarge(
                                  "All Orders",
                                  fontWeight: 600,
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: MyContainer.none(
                                    borderRadiusAll: 4,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    child: DataTable(
                                        sortAscending: true,
                                        onSelectAll: (_) => {},
                                        dataRowMaxHeight: 52,
                                        columnSpacing: 170,
                                        showBottomBorder: true,
                                        showCheckboxColumn: true,
                                        columns: [
                                          DataColumn(
                                              label: MyText.labelLarge(
                                            'Name',
                                          )),
                                          DataColumn(
                                              label: MyText.labelLarge(
                                            'Order No',
                                          )),
                                          DataColumn(
                                              label: MyText.labelLarge(
                                            'Transaction',
                                          )),
                                          DataColumn(
                                              label: MyText.labelLarge(
                                            'Delivery Status',
                                          )),
                                          DataColumn(
                                              label: MyText.labelLarge(
                                            'Time',
                                          )),
                                        ],
                                        rows: controller.ordersDetail
                                            .mapIndexed(
                                              (index, data) => DataRow(
                                                cells: [
                                                  DataCell(MyText.bodySmall(
                                                    data.name,
                                                    fontWeight: 600,
                                                  )),
                                                  DataCell(MyText.bodySmall(
                                                    "# ${data.orderNo}",
                                                    fontWeight: 600,
                                                  )),
                                                  DataCell(MyText.bodySmall(
                                                    data.transaction,
                                                    fontWeight: 600,
                                                  )),
                                                  DataCell(MyContainer(
                                                    padding: MySpacing.xy(12, 4),
                                                    color: data.deliveryStatus == "On The Way"
                                                        ? contentTheme.primary.withAlpha(36)
                                                        : data.deliveryStatus == "Delivered"
                                                            ? contentTheme.success.withAlpha(36)
                                                            : data.deliveryStatus == "Pending"
                                                                ? contentTheme.danger.withAlpha(36)
                                                                : null,
                                                    child: MyText.bodySmall(
                                                      data.deliveryStatus,
                                                      color: data.deliveryStatus == "On The Way"
                                                          ? contentTheme.primary
                                                          : data.deliveryStatus == "Delivered"
                                                              ? contentTheme.success
                                                              : data.deliveryStatus == "Pending"
                                                                  ? contentTheme.danger
                                                                  : null,
                                                      fontWeight: 600,
                                                    ),
                                                  )),
                                                  DataCell(MyText.bodySmall(
                                                    Utils.getTimeStringFromDateTime(data.time),
                                                    fontWeight: 600,
                                                  )),
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
                    ),
                  ),
                ]),
              )
            ],
          );
        },
      ),
    );
  }

  Widget buildProfileDetail(String title, String subTitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText.bodyMedium(title, fontWeight: 600),
        MyText.bodySmall(subTitle, fontWeight: 600, xMuted: true),
      ],
    );
  }

  Widget buildProfileOverView(Color color, IconData icon, String title, String subTitle) {
    return MyContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              MyContainer.rounded(
                color: color,
                child: Icon(icon, size: 20, color: contentTheme.onPrimary),
              ),
              Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  MyText.bodyMedium(title, fontWeight: 600),
                  MyText.bodyLarge(subTitle, fontWeight: 600),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
