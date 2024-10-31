import 'package:flutter/material.dart';
import 'package:foody/controller/layout/auth_layout_controller.dart';
import 'package:foody/helpers/theme/admin_theme.dart';
import 'package:foody/helpers/theme/app_themes.dart';
import 'package:foody/helpers/widgets/my_container.dart';
import 'package:foody/helpers/widgets/my_flex.dart';
import 'package:foody/helpers/widgets/my_flex_item.dart';
import 'package:foody/helpers/widgets/my_responsiv.dart';
import 'package:foody/helpers/widgets/my_spacing.dart';
import 'package:foody/images.dart';
import 'package:get/get.dart';

class AuthLayout extends StatelessWidget {
  final Widget? child;

  final AuthLayoutController controller = AuthLayoutController();

  AuthLayout({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return MyResponsive(builder: (BuildContext context, _, screenMT) {
      return GetBuilder(
          init: controller,
          builder: (controller) {
            return screenMT.isMobile
                ? mobileScreen(context)
                : largeScreen(context);
          });
    });
  }

  Widget mobileScreen(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      body: Container(
        padding: MySpacing.top(MySpacing.safeAreaTop(context) + 20),
        height: MediaQuery.of(context).size.height,
        color: theme.cardTheme.color,
        child: SingleChildScrollView(
          key: controller.scrollKey,
          child: child,
        ),
      ),
    );
  }

  Widget largeScreen(BuildContext context) {
    return Scaffold(
        key: controller.scaffoldKey,
        backgroundColor: Colors.blue,
        body: Stack(
          children: [
            Center(
              child: Image.asset(
                height: double.infinity,
                width: double.infinity,
                Images.background,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: MySpacing.top(100),
              width: MediaQuery.of(context).size.width,
              child: MyFlex(
                wrapAlignment: WrapAlignment.center,
                wrapCrossAlignment: WrapCrossAlignment.start,
                runAlignment: WrapAlignment.center,
                spacing: 0,
                runSpacing: 0,
                children: [
                  MyFlexItem(
                    sizes: "xxl-8 lg-8 md-9 sm-10",
                    child: MyContainer(
                      paddingAll: 0,
                      borderRadiusAll: 12,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: AdminTheme.theme.contentTheme.background
                          .withOpacity(0.95),
                      child: child ?? Container(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
