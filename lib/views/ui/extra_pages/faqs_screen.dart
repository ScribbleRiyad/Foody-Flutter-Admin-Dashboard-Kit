import 'package:foody/controller/ui/extra_pages/faqs_controller.dart';
import 'package:foody/helpers/theme/app_themes.dart';
import 'package:foody/helpers/utils/ui_mixins.dart';
import 'package:foody/helpers/widgets/my_breadcrumb.dart';
import 'package:foody/helpers/widgets/my_breadcrumb_item.dart';
import 'package:foody/helpers/widgets/my_container.dart';
import 'package:foody/helpers/widgets/my_spacing.dart';
import 'package:foody/helpers/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:foody/helpers/widgets/responsive.dart';
import 'package:foody/views/layout/layout.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

class FaqsScreen extends StatefulWidget {
  const FaqsScreen({super.key});

  @override
  State<FaqsScreen> createState() => _FaqsScreenState();
}

class _FaqsScreenState extends State<FaqsScreen>
    with SingleTickerProviderStateMixin, UIMixin {
  late FaqsController controller;

  @override
  void initState() {
    controller = FaqsController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: GetBuilder(
        init: controller,
        tag: 'faqs_controller',
        builder: (controller) {
          return Column(
            children: [
              Padding(
                padding: MySpacing.x(flexSpacing),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText.titleMedium("FAQs", fontSize: 18, fontWeight: 600),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: 'Extra'),
                        MyBreadcrumbItem(name: 'FAQs', active: true)
                      ],
                    ),
                  ],
                ),
              ),
              MySpacing.height(flexSpacing),
              Column(
                children: [
                  MyText.displaySmall("Frequently Asked Questions",
                      fontWeight: 600),
                  MySpacing.height(12),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .4,
                    child: MyText.bodyMedium(
                      "Quick answer to questions you may have about Untitled Ui And billing. Can't find what you're looking for? check out our full document",
                      fontWeight: 600,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  MySpacing.height(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      MyContainer(
                        onTap: () {},
                        paddingAll: 0,
                        height: 32,
                        width: 100,
                        color: contentTheme.primary.withAlpha(32),
                        child: Center(
                          child: MyText.bodyMedium("Document",
                              fontWeight: 600, color: contentTheme.primary),
                        ),
                      ),
                      MySpacing.width(12),
                      MyContainer(
                        color: contentTheme.primary,
                        paddingAll: 0,
                        height: 32,
                        width: 150,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(LucideIcons.messageSquare,
                                size: 20, color: contentTheme.onPrimary),
                            MySpacing.width(8),
                            MyText.bodyMedium("Get in touch",
                                fontWeight: 600, color: contentTheme.onPrimary)
                          ],
                        ),
                      )
                    ],
                  ),
                  MySpacing.height(40),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .6,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        ExpansionPanelList(
                          elevation: 0,
                          expandedHeaderPadding: EdgeInsets.all(0),
                          expansionCallback: (int index, bool isExpanded) {
                            setState(() {
                              controller.dataExpansionPanel[index] = isExpanded;
                            });
                          },
                          animationDuration: Duration(milliseconds: 500),
                          children: <ExpansionPanel>[
                            buildExpansion(
                                "What do we do",
                                controller.dummyTexts[0],
                                controller.dataExpansionPanel[0]),
                            buildExpansion(
                                "Getting started with Untitled",
                                controller.dummyTexts[1],
                                controller.dataExpansionPanel[1]),
                            buildExpansion(
                                "Install Untitled",
                                controller.dummyTexts[2],
                                controller.dataExpansionPanel[2]),
                            buildExpansion(
                                "The Messenger",
                                controller.dummyTexts[3],
                                controller.dataExpansionPanel[3]),
                            buildExpansion(
                                "One next-gen inbox",
                                controller.dummyTexts[4],
                                controller.dataExpansionPanel[4]),
                            buildExpansion(
                                "How dose support work?",
                                controller.dummyTexts[5],
                                controller.dataExpansionPanel[5]),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          );
        },
      ),
    );
  }

  ExpansionPanel buildExpansion(String title, description, bool isExpanded) {
    return ExpansionPanel(
        canTapOnHeader: true,
        headerBuilder: (BuildContext context, bool isExpanded) {
          return ListTile(
            title: MyText.titleMedium(title,
                color: isExpanded
                    ? theme.colorScheme.primary
                    : theme.colorScheme.onSurface,
                fontWeight: isExpanded ? 700 : 600),
          );
        },
        body:
            MyContainer(child: MyText.bodySmall(description, fontWeight: 600)),
        isExpanded: isExpanded);
  }
}
