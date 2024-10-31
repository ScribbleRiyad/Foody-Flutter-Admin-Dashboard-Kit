import 'package:flutter/material.dart';
import 'package:foody/controller/ui/restaurant/restaurants_detail_controller.dart';
import 'package:foody/helpers/theme/app_themes.dart';
import 'package:foody/helpers/utils/ui_mixins.dart';
import 'package:foody/helpers/utils/utils.dart';
import 'package:foody/helpers/widgets/my_breadcrumb.dart';
import 'package:foody/helpers/widgets/my_breadcrumb_item.dart';
import 'package:foody/helpers/widgets/my_container.dart';
import 'package:foody/helpers/widgets/my_flex.dart';
import 'package:foody/helpers/widgets/my_flex_item.dart';
import 'package:foody/helpers/widgets/my_progress_bar.dart';
import 'package:foody/helpers/widgets/my_spacing.dart';
import 'package:foody/helpers/widgets/my_text.dart';
import 'package:foody/helpers/widgets/responsive.dart';
import 'package:foody/images.dart';
import 'package:foody/model/order_list.dart';
import 'package:foody/views/layout/layout.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class RestaurantDetailScreen extends StatefulWidget {
  const RestaurantDetailScreen({super.key});

  @override
  State<RestaurantDetailScreen> createState() => _RestaurantDetailScreenState();
}

class _RestaurantDetailScreenState extends State<RestaurantDetailScreen> with SingleTickerProviderStateMixin, UIMixin {
  late RestaurantsDetailController controller;

  @override
  void initState() {
    controller = Get.put(RestaurantsDetailController());
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
                      "Restaurants Detail",
                      fontSize: 18,
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: 'Admin'),
                        MyBreadcrumbItem(
                          name: 'Restaurants Detail',
                          active: true,
                        ),
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
                        child: MyContainer(
                      paddingAll: 20,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 300,
                            child: Stack(
                              children: [
                                MyContainer(
                                  width: double.infinity,
                                  paddingAll: 0,
                                  height: 240,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  child: Image.asset(
                                    Images.background,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  left: 50,
                                  child: MyContainer(
                                    paddingAll: 0,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    height: 100,
                                    width: 100,
                                    child: Image.asset(Images.food[0]),
                                  ),
                                ),
                                Positioned(
                                  bottom: 5,
                                  left: 170,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      MyText.bodyMedium("Healthy Feast Corner", fontWeight: 600),
                                      MyText.bodyMedium("Since 2013"),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
                    MyFlexItem(
                        sizes: 'lg-8',
                        child: MyContainer(
                          paddingAll: 20,
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: MyText.bodyMedium("Cost & Usage by instance type", overflow: TextOverflow.ellipsis, fontWeight: 600),
                                  ),
                                  PopupMenuButton(
                                    onSelected: controller.onSelectedTimeByLocation,
                                    itemBuilder: (BuildContext context) {
                                      return ["Year", "Month", "Week", "Day", "Hours"].map((behavior) {
                                        return PopupMenuItem(
                                          value: behavior,
                                          height: 32,
                                          child: MyText.bodySmall(
                                            behavior.toString(),
                                            color: theme.colorScheme.onSurface,
                                            fontWeight: 600,
                                          ),
                                        );
                                      }).toList();
                                    },
                                    color: theme.cardTheme.color,
                                    child: MyContainer.bordered(
                                      padding: MySpacing.xy(12, 8),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          MyText.labelMedium(
                                            controller.selectedTimeByLocation.toString(),
                                            color: theme.colorScheme.onSurface,
                                          ),
                                          Icon(
                                            LucideIcons.chevronDown,
                                            size: 22,
                                            color: theme.colorScheme.onSurface,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              MySpacing.height(20),
                              SfCartesianChart(
                                margin: MySpacing.zero,
                                primaryXAxis: CategoryAxis(),
                                tooltipBehavior: controller.chart,
                                axes: <ChartAxis>[
                                  NumericAxis(
                                      numberFormat: NumberFormat.compact(),
                                      majorGridLines: const MajorGridLines(width: 0),
                                      opposedPosition: true,
                                      name: 'yAxis1',
                                      interval: 1000,
                                      minimum: 0,
                                      maximum: 7000)
                                ],
                                series: [
                                  ColumnSeries<ChartSampleData, String>(
                                      animationDuration: 2000,
                                      width: 0.5,
                                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(4), topRight: Radius.circular(4)),
                                      color: contentTheme.primary,
                                      dataSource: controller.chartData,
                                      xValueMapper: (ChartSampleData data, _) => data.x,
                                      yValueMapper: (ChartSampleData data, _) => data.y,
                                      name: 'Unit Sold'),
                                  LineSeries<ChartSampleData, String>(
                                      animationDuration: 4500,
                                      animationDelay: 2000,
                                      dataSource: controller.chartData,
                                      xValueMapper: (ChartSampleData data, _) => data.x,
                                      yValueMapper: (ChartSampleData data, _) => data.yValue,
                                      yAxisName: 'yAxis1',
                                      markerSettings: const MarkerSettings(isVisible: true),
                                      name: 'Total Transaction')
                                ],
                              ),
                            ],
                          ),
                        )),
                    MyFlexItem(
                      sizes: 'lg-4',
                      child: MyContainer(
                        paddingAll: 0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: MySpacing.only(top: 20, left: 20, bottom: 20),
                              child: MyText.titleMedium("Seller Personal Detail", fontWeight: 600),
                            ),
                            Divider(height: 0),
                            buildSellerDetail("Owner Name :", 'Kinna Troves'),
                            buildSellerDetail("Company Type :", 'Partnership'),
                            buildSellerDetail("Email :", 'kianna.vetrov@mail.com'),
                            buildSellerDetail("Contact No :", '+(123) 456 7890'),
                            buildSellerDetail("Fax :", '+1 453 345 3424'),
                            buildSellerDetail("Location :", 'Canada'),
                          ],
                        ),
                      ),
                    ),
                    MyFlexItem(
                        sizes: 'lg-8',
                        child: MyContainer(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyText.bodyMedium("Product", fontWeight: 600),
                              MySpacing.height(16),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(child: buildSelectItem()),
                                  MyContainer(
                                    paddingAll: 8,
                                    borderRadiusAll: 8,
                                    color: contentTheme.primary,
                                    child: Row(
                                      children: [
                                        Icon(
                                          LucideIcons.plus,
                                          size: 20,
                                          color: contentTheme.onPrimary,
                                        ),
                                        MySpacing.width(8),
                                        MyText.bodyMedium("Add Product", color: contentTheme.onPrimary, fontWeight: 600)
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              if (controller.data != null)
                                PaginatedDataTable(
                                  header: Row(
                                    children: [
                                      MyText.titleMedium(
                                        "Order List",
                                        fontWeight: 600,
                                        fontSize: 20,
                                      ),
                                    ],
                                  ),
                                  source: controller.data!,
                                  columns: [
                                    DataColumn(label: MyText.bodyMedium('Date', fontWeight: 600)),
                                    DataColumn(label: MyText.bodyMedium('OrderID', fontWeight: 600)),
                                    DataColumn(label: MyText.bodyMedium('Menu', fontWeight: 600)),
                                    DataColumn(label: MyText.bodyMedium('Amount', fontWeight: 600)),
                                    DataColumn(label: MyText.bodyMedium('Status', fontWeight: 600)),
                                  ],
                                  columnSpacing: 130,
                                  horizontalMargin: 50,
                                  rowsPerPage: 10,
                                  dataRowMaxHeight: 60,
                                ),
                            ],
                          ),
                        )),
                    MyFlexItem(
                        sizes: 'lg-4',
                        child: MyContainer(
                          paddingAll: 0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: MySpacing.only(top: 20, left: 20, bottom: 10),
                                child: MyText.titleMedium("Customer Reviews", fontWeight: 600),
                              ),
                              Divider(),
                              MyContainer(
                                child: Column(
                                  children: [
                                    buildStars("5", 4),
                                    buildStars("4", 3.5),
                                    buildStars("3", 3),
                                    buildStars("2", 2.2),
                                    buildStars("1", 0.5),
                                    MySpacing.height(12),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                MyText.titleMedium("4.5", fontWeight: 600),
                                                Icon(
                                                  LucideIcons.star,
                                                  size: 16,
                                                  color: contentTheme.primary,
                                                )
                                              ],
                                            ),
                                            MyText.bodySmall(
                                              '100 Reviews',
                                              fontWeight: 600,
                                              xMuted: true,
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            MyText.titleMedium("91%", fontWeight: 600),
                                            MyText.bodySmall('Recommended', fontWeight: 600, xMuted: true)
                                          ],
                                        )
                                      ],
                                    ),
                                    MySpacing.height(20),
                                    buildReviews(),
                                    MySpacing.height(20),
                                    buildReviews()
                                  ],
                                ),
                              ),
                            ],
                          ),
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

  Widget buildReviews() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            MyContainer.rounded(
              height: 40,
              width: 40,
              paddingAll: 0,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image.asset(
                Images.avatars[0],
                fit: BoxFit.cover,
              ),
            ),
            MySpacing.width(8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText.bodyMedium(
                    "Kinna Stanton US",
                    fontWeight: 600,
                    overflow: TextOverflow.ellipsis,
                  ),
                  MyText.bodySmall(
                    "Verified Buyer",
                    fontWeight: 600,
                    overflow: TextOverflow.ellipsis,
                    color: contentTheme.info,
                  ),
                ],
              ),
            ),
            Spacer(),
            Row(
              children: [
                Icon(Icons.star, size: 16, color: contentTheme.primary),
                Icon(Icons.star, size: 16, color: contentTheme.primary),
                Icon(Icons.star, size: 16, color: contentTheme.primary),
                Icon(Icons.star, size: 16, color: contentTheme.primary),
                Icon(Icons.star, size: 16, color: contentTheme.primary),
              ],
            )
          ],
        ),
        MySpacing.height(12),
        MyText.bodyMedium(
          "SO DELICIOUS",
          fontWeight: 600,
        ),
        MySpacing.height(12),
        MyText.bodySmall(
          controller.dummyTexts[4],
          maxLines: 4,
          fontWeight: 600,
          muted: true,
        ),
      ],
    );
  }

  Widget buildStars(String number, double progress) {
    return Row(
      children: [
        MyText.bodyMedium(number),
        MySpacing.width(12),
        Expanded(
          child: MyProgressBar(
            progress: progress,
            height: 4,
            radius: 4,
            inactiveColor: theme.dividerColor,
            activeColor: contentTheme.primary,
          ),
        ),
      ],
    );
  }

  Widget buildSelectItem() {
    return Wrap(
      runSpacing: 20,
      spacing: 20,
      children: [
        SizedBox(
          width: 150,
          child: PopupMenuButton(
            onSelected: controller.onSelectedPrice,
            itemBuilder: (BuildContext context) {
              return ["Popular", "High to Low", "Low to High"].map((behavior) {
                return PopupMenuItem(
                  value: behavior,
                  height: 32,
                  child: MyText.bodySmall(
                    behavior.toString(),
                    color: theme.colorScheme.onSurface,
                    fontWeight: 600,
                  ),
                );
              }).toList();
            },
            color: theme.cardTheme.color,
            child: MyContainer.bordered(
              padding: MySpacing.xy(12, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  MyText.labelMedium(
                    controller.selectedPrice.toString(),
                    color: theme.colorScheme.onSurface,
                  ),
                  Icon(
                    LucideIcons.chevronDown,
                    size: 22,
                    color: theme.colorScheme.onSurface,
                  )
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          width: 150,
          child: PopupMenuButton(
            onSelected: controller.onSelectedUploadDate,
            itemBuilder: (BuildContext context) {
              return ["All", "Newest", "Best Seller", "Oldest"].map((behavior) {
                return PopupMenuItem(
                  value: behavior,
                  height: 32,
                  child: MyText.bodySmall(
                    behavior.toString(),
                    color: theme.colorScheme.onSurface,
                    fontWeight: 600,
                  ),
                );
              }).toList();
            },
            color: theme.cardTheme.color,
            child: MyContainer.bordered(
              padding: MySpacing.xy(12, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  MyText.labelMedium(
                    controller.selectedUploadDate.toString(),
                    color: theme.colorScheme.onSurface,
                  ),
                  Icon(
                    LucideIcons.chevronDown,
                    size: 22,
                    color: theme.colorScheme.onSurface,
                  )
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          width: 150,
          child: PopupMenuButton(
            onSelected: controller.onSelectedScoreStatus,
            itemBuilder: (BuildContext context) {
              return ["Average", "Good", "Best"].map((behavior) {
                return PopupMenuItem(
                  value: behavior,
                  height: 32,
                  child: MyText.bodySmall(
                    behavior.toString(),
                    color: theme.colorScheme.onSurface,
                    fontWeight: 600,
                  ),
                );
              }).toList();
            },
            color: theme.cardTheme.color,
            child: MyContainer.bordered(
              padding: MySpacing.xy(12, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  MyText.labelMedium(
                    controller.selectedScoreStatus.toString(),
                    color: theme.colorScheme.onSurface,
                  ),
                  Icon(
                    LucideIcons.chevronDown,
                    size: 22,
                    color: theme.colorScheme.onSurface,
                  )
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          width: 150,
          child: PopupMenuButton(
            onSelected: controller.onSelectedCategory,
            itemBuilder: (BuildContext context) {
              return ["All", "Beverages", "Wrap", "Pizza", "Bakery"].map((behavior) {
                return PopupMenuItem(
                  value: behavior,
                  height: 32,
                  child: MyText.bodySmall(
                    behavior.toString(),
                    color: theme.colorScheme.onSurface,
                    fontWeight: 600,
                  ),
                );
              }).toList();
            },
            color: theme.cardTheme.color,
            child: MyContainer.bordered(
              padding: MySpacing.xy(12, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  MyText.labelMedium(
                    controller.selectedCategory.toString(),
                    color: theme.colorScheme.onSurface,
                  ),
                  Icon(
                    LucideIcons.chevronDown,
                    size: 22,
                    color: theme.colorScheme.onSurface,
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildSellerDetail(String title, String name) {
    return Padding(
      padding: MySpacing.all(17),
      child: Row(
        children: [
          MyText.bodyMedium(title, fontWeight: 600),
          Spacer(),
          MyText.bodySmall(name),
        ],
      ),
    );
  }
}

class MyData extends DataTableSource with UIMixin {
  List<OrderList> orderList = [];

  MyData(this.orderList);

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => orderList.length;

  @override
  int get selectedRowCount => 0;

  @override
  DataRow getRow(int index) {
    OrderList order = orderList[index];

    return DataRow(
      cells: [
        DataCell(MyText.bodySmall(
          Utils.getDateStringFromDateTime(order.dateTime),
          fontWeight: 600,
        )),
        DataCell(MyText.bodySmall(
          "#${order.orderId}",
          fontWeight: 600,
        )),
        DataCell(Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText.bodySmall(
              order.foodName,
              fontWeight: 600,
            ),
            Row(
              children: [
                Icon(LucideIcons.star, color: contentTheme.primary, size: 16),
                MySpacing.width(8),
                MyText.bodySmall(
                  order.rating.toString(),
                  fontWeight: 600,
                ),
              ],
            )
          ],
        )),
        DataCell(MyText.bodySmall("\$ ${order.amount}")),
        DataCell(
          MyContainer(
            padding: MySpacing.xy(12, 4),
            borderRadiusAll: 100,
            color: order.status == 'Refund'
                ? contentTheme.primary.withAlpha(40)
                : order.status == 'Paid'
                    ? contentTheme.success.withAlpha(40)
                    : order.status == 'Cancel'
                        ? contentTheme.danger.withAlpha(40)
                        : null,
            child: MyText.bodySmall(
              order.status,
              fontWeight: 600,
              color: order.status == 'Refund'
                  ? contentTheme.primary
                  : order.status == 'Paid'
                      ? contentTheme.success
                      : order.status == 'Cancel'
                          ? contentTheme.danger
                          : null,
            ),
          ),
        ),
      ],
    );
  }
}
