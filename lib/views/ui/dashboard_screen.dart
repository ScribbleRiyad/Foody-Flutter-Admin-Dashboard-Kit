import 'package:flutter/material.dart';
import 'package:foody/controller/ui/dashboard_controller.dart';
import 'package:foody/helpers/utils/ui_mixins.dart';
import 'package:foody/helpers/widgets/my_breadcrumb.dart';
import 'package:foody/helpers/widgets/my_breadcrumb_item.dart';
import 'package:foody/helpers/widgets/my_container.dart';
import 'package:foody/helpers/widgets/my_flex.dart';
import 'package:foody/helpers/widgets/my_flex_item.dart';
import 'package:foody/helpers/widgets/my_list_extension.dart';
import 'package:foody/helpers/widgets/my_spacing.dart';
import 'package:foody/helpers/widgets/my_text.dart';
import 'package:foody/helpers/widgets/my_text_style.dart';
import 'package:foody/helpers/widgets/responsive.dart';
import 'package:foody/views/layout/layout.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:ui' as ui;

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> with SingleTickerProviderStateMixin, UIMixin {
  late DashboardController controller;

  @override
  void initState() {
    controller = Get.put(DashboardController());
    _initializeVariables();
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
                      "Dashboard",
                      fontSize: 18,
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: 'Admin'),
                        MyBreadcrumbItem(name: 'Dashboard', active: true),
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
                    MyFlexItem(sizes: 'lg-2 md-6', child: buildExploreCategories(LucideIcons.flame, "Popular", "656+ Option", contentTheme.primary)),
                    MyFlexItem(sizes: 'lg-2 md-6', child: buildExploreCategories(LucideIcons.bike, 'Fast Delivery', '1,231', contentTheme.danger)),
                    MyFlexItem(
                        sizes: 'lg-2 md-6', child: buildExploreCategories(LucideIcons.utensils, 'Dine in', "182+ Option", contentTheme.purple)),
                    MyFlexItem(sizes: 'lg-2 md-6', child: buildExploreCategories(LucideIcons.wallet2, 'High Class', '25+ Option', contentTheme.red)),
                    MyFlexItem(sizes: 'lg-2 md-6', child: buildExploreCategories(LucideIcons.home, "PickUp", "1,654 Option", contentTheme.success)),
                    MyFlexItem(sizes: 'lg-2 md-6', child: buildExploreCategories(LucideIcons.map, "Nearest", "55+ Option", contentTheme.info)),
                    MyFlexItem(
                        child: MyContainer(
                      paddingAll: 20,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText.titleMedium("Revenue", fontWeight: 600),
                          MySpacing.height(20),
                          SfCartesianChart(
                            margin: EdgeInsets.zero,
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
                                  color: contentTheme.primary,
                                  animationDuration: 2000,
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
                      sizes: 'lg-8',
                      child: MyContainer(
                        paddingAll: 20,
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MyText.bodyMedium(
                                  "Order Report",
                                  fontWeight: 600,
                                ),
                                MyContainer(
                                  onTap: () {},
                                  paddingAll: 4,
                                  color: contentTheme.primary.withAlpha(32),
                                  child: MyText.labelMedium(
                                    "View all",
                                    color: contentTheme.primary,
                                    fontWeight: 600,
                                  ),
                                )
                              ],
                            ),
                            MySpacing.height(16),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: MyContainer.none(
                                borderRadiusAll: 4,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: DataTable(
                                    sortAscending: true,
                                    onSelectAll: (_) => {},
                                    dataRowMaxHeight: 60,
                                    showBottomBorder: true,
                                    showCheckboxColumn: true,
                                    columnSpacing: 200,
                                    columns: [
                                      DataColumn(label: MyText.labelLarge('Name', fontWeight: 600)),
                                      DataColumn(label: MyText.labelLarge('Order No', fontWeight: 600)),
                                      DataColumn(label: MyText.labelLarge('Transaction', fontWeight: 600)),
                                      DataColumn(label: MyText.labelLarge('Delivery Status', fontWeight: 600)),
                                    ],
                                    rows: controller.ordersDetail
                                        .mapIndexed(
                                          (index, data) => DataRow(
                                            cells: [
                                              DataCell(MyText.bodyMedium(
                                                data.name,
                                                fontWeight: 600,
                                              )),
                                              DataCell(MyText.bodyMedium(
                                                "# ${data.orderNo}",
                                                fontWeight: 600,
                                              )),
                                              DataCell(MyText.bodyMedium(
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
                                                child: MyText.bodyMedium(
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
                    MyFlexItem(
                      sizes: 'lg-4',
                      child: MyContainer(
                        child: Padding(
                          padding: MySpacing.xy(12, 12),
                          child: SizedBox(height: 400, child: _buildDefaultPieChart()),
                        ),
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

  Widget buildExploreCategories(IconData icon, String title, String subTitle, Color color) {
    return MyContainer(
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyContainer.rounded(
            color: color.withAlpha(40),
            child: Icon(
              icon,
              color: color,
            ),
          ),
          MyText.titleMedium(
            title,
            fontWeight: 600,
          ),
          MyText.bodyMedium(subTitle, fontWeight: 600, xMuted: true),
        ],
      ),
    );
  }

  Widget buildMyOrders(String image, String name, String quantity, String price) {
    return Row(
      children: [
        MyContainer.rounded(
          height: 100,
          width: 100,
          child: Image.asset(
            image,
            fit: BoxFit.cover,
          ),
        ),
        MySpacing.width(12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText.bodyMedium(name, fontWeight: 600),
            MyText.bodyMedium(quantity),
          ],
        ),
        Spacer(),
        MyText.bodyMedium(price, fontWeight: 600),
      ],
    );
  }

  Widget buildCard() {
    return MyContainer(
      paddingAll: 0,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          MyContainer(
            marginAll: 32,
            height: 250,
            borderRadiusAll: 8,
            color: contentTheme.danger.withAlpha(160),
          ),
          MyContainer(
            marginAll: 18,
            height: 247,
            borderRadiusAll: 8,
            color: contentTheme.danger,
          ),
          MyContainer(
            paddingAll: 0,
            height: 247,
            borderRadiusAll: 8,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            color: contentTheme.danger,
            child: Stack(
              children: [
                Positioned(
                  left: -60,
                  top: -100,
                  height: 200,
                  width: 200,
                  child: MyContainer.rounded(
                    height: 200,
                    color: contentTheme.light.withAlpha(100),
                  ),
                ),
                Positioned(
                  bottom: -100,
                  left: -80,
                  height: 200,
                  width: 400,
                  child: MyContainer(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(100)),
                    color: contentTheme.light.withAlpha(100),
                  ),
                ),
                Positioned(
                  top: -100,
                  right: -150,
                  height: 200,
                  width: 400,
                  child: MyContainer(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100)),
                    color: contentTheme.light.withAlpha(100),
                  ),
                ),
                MyContainer.transparent(
                  paddingAll: 20,
                  width: double.infinity,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  borderRadiusAll: 8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyText.bodyLarge(
                                "Current Balance",
                                fontWeight: 600,
                                xMuted: true,
                              ),
                              MyText.titleLarge(
                                "\$ 78,984",
                                fontWeight: 700,
                                letterSpacing: 2,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Stack(
                                children: [
                                  MyContainer.rounded(
                                    color: contentTheme.light,
                                  ),
                                  Positioned(
                                    child: MyContainer.rounded(
                                      width: 70,
                                      color: contentTheme.red,
                                    ),
                                  ),
                                ],
                              ),
                              MySpacing.height(4),
                              Padding(
                                padding: MySpacing.right(20),
                                child: MyText.bodySmall(
                                  'mastercard',
                                  fontWeight: 600,
                                  muted: true,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: MyText.titleLarge(
                              "8432 6594 6547",
                              fontWeight: 700,
                              letterSpacing: 2,
                              muted: true,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          MyText.bodyMedium(
                            "08/27",
                            fontWeight: 600,
                            muted: true,
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _initializeVariables() {
    controller.colors = const <Color>[
      Color.fromRGBO(96, 87, 234, 1),
      Color.fromRGBO(59, 141, 236, 1),
      Color.fromRGBO(112, 198, 129, 1),
      Color.fromRGBO(237, 241, 81, 1)
    ];
    controller.stops = <double>[0.25, 0.5, 0.75, 1];
    controller.shaderType = 'sweep';
  }

  SfCircularChart _buildDefaultPieChart() {
    return SfCircularChart(
      onCreateShader: (ChartShaderDetails chartShaderDetails) {
        if (controller.shaderType == 'linear') {
          return ui.Gradient.linear(
              chartShaderDetails.outerRect.topRight, chartShaderDetails.outerRect.centerLeft, controller.colors, controller.stops);
        } else if (controller.shaderType == 'radial') {
          return ui.Gradient.radial(chartShaderDetails.outerRect.center, chartShaderDetails.outerRect.right - chartShaderDetails.outerRect.center.dx,
              controller.colors, controller.stops);
        } else {
          return ui.Gradient.sweep(chartShaderDetails.outerRect.center, controller.colors, controller.stops, TileMode.clamp, _degreeToRadian(0),
              _degreeToRadian(360), _resolveTransform(chartShaderDetails.outerRect, TextDirection.LTR));
        }
      },
      title: ChartTitle(text: 'Sales by Restaurant', textStyle: MyTextStyle.bodySmall()),
      legend: Legend(
        isVisible: true,
        position: LegendPosition.bottom,
      ),
      series: _getDefaultPieSeries(),
    );
  }

  List<PieSeries<ChartSampleData, String>> _getDefaultPieSeries() {
    final List<ChartSampleData> pieData = <ChartSampleData>[
      ChartSampleData(x: 'Take It Cheesy', y: 17, text: 'Take It Cheesy \n 17%'),
      ChartSampleData(x: 'Wingman’s Pub', y: 20, text: 'Wingman’s Pub \n 20%'),
      ChartSampleData(x: 'Lettuce Eat Bistro ', y: 25, text: 'Lettuce Eat Bistro  \n 25%'),
      ChartSampleData(x: 'Haute Dog Diner', y: 38, text: 'Haute Dog Diner \n 38%')
    ];
    return <PieSeries<ChartSampleData, String>>[
      PieSeries<ChartSampleData, String>(
          dataSource: pieData,
          explodeAll: true,
          explodeOffset: '3%',
          explode: true,
          strokeColor: Theme.of(context).brightness == Brightness.light ? Colors.black.withOpacity(0.3) : Colors.white.withOpacity(0.3),
          strokeWidth: 1.5,
          dataLabelSettings: DataLabelSettings(
            isVisible: true,
            textStyle: MyTextStyle.bodyMedium(),
          ),
          xValueMapper: (ChartSampleData data, _) => data.x as String,
          yValueMapper: (ChartSampleData data, _) => data.y,
          dataLabelMapper: (ChartSampleData data, _) => data.text),
    ];
  }

  dynamic _resolveTransform(Rect bounds, TextDirection textDirection) {
    final GradientTransform transform = GradientRotation(_degreeToRadian(-90));
    return transform.transform(bounds)!.storage;
  }

  double _degreeToRadian(int deg) => deg * (3.141592653589793 / 180);
}
