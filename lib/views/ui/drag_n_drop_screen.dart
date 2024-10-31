import 'package:foody/controller/ui/drag_n_drop_controller.dart';
import 'package:foody/helpers/utils/my_shadow.dart';
import 'package:foody/helpers/utils/ui_mixins.dart';
import 'package:foody/helpers/widgets/my_breadcrumb.dart';
import 'package:foody/helpers/widgets/my_breadcrumb_item.dart';
import 'package:foody/helpers/widgets/my_card.dart';
import 'package:foody/helpers/widgets/my_container.dart';
import 'package:foody/helpers/widgets/my_spacing.dart';
import 'package:foody/helpers/widgets/my_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reorderable_grid_view/widgets/reorderable_builder.dart';
import 'package:foody/helpers/widgets/responsive.dart';
import 'package:foody/model/drag_n_drop.dart';
import 'package:foody/views/layout/layout.dart';
import 'package:get/get.dart';

class DragNDropScreen extends StatefulWidget {
  const DragNDropScreen({super.key});

  @override
  State<DragNDropScreen> createState() => _DragNDropScreenState();
}

class _DragNDropScreenState extends State<DragNDropScreen>
    with SingleTickerProviderStateMixin, UIMixin {
  late DragNDropController controller;

  @override
  void initState() {
    controller = Get.put(DragNDropController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: GetBuilder(
        init: controller,
        tag: 'drag_n_drop_controller',
        builder: (controller) {
          final generatedChildren = List.generate(
              controller.contact.length,
              (index) => MyCard(
                    key: Key('$index'),
                    shadow: MyShadow(
                        position: MyShadowPosition.bottom, elevation: .5),
                    borderRadiusAll: 8,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyContainer(
                          width: double.infinity,
                          height: 90,
                          paddingAll: 0,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          borderRadiusAll: 8,
                          child: Image.asset(controller.contact[index].image,
                              fit: BoxFit.cover),
                        ),
                        MySpacing.height(12),
                        MyText.bodySmall(controller.dummyTexts[index],
                            maxLines: 3, fontWeight: 600)
                      ],
                    ),
                  ));
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: MySpacing.x(flexSpacing),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText.titleMedium(
                      "Drag & Drop",
                      fontSize: 18,
                      fontWeight: 600,
                    ),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: 'Widget'),
                        MyBreadcrumbItem(name: 'Drag & Drop', active: true),
                      ],
                    ),
                  ],
                ),
              ),
              MySpacing.height(flexSpacing),
              if (controller.contact.isNotEmpty)
                Padding(
                  padding: MySpacing.x(flexSpacing),
                  child: ReorderableBuilder(
                      scrollController: controller.scrollController,
                      enableLongPress: false,
                      onReorder: (ReorderedListFunction reorderedListFunction) {
                        setState(() {
                          controller.contact =
                              reorderedListFunction(controller.contact)
                                  as List<DragNDropModel>;
                        });
                      },
                      longPressDelay: Duration(milliseconds: 300),
                      builder: (children) {
                        return GridView(
                          shrinkWrap: true,
                          key: controller.gridViewKey,
                          controller: controller.scrollController,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            mainAxisExtent: 200,
                            mainAxisSpacing: 12,
                            crossAxisSpacing: 12,
                          ),
                          children: children,
                        );
                      },
                      children: generatedChildren),
                ),
            ],
          );
        },
      ),
    );
  }
}
