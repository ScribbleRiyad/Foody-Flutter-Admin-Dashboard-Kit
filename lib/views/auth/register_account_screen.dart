import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:foody/controller/auth/register_account_controller.dart';
import 'package:foody/helpers/theme/app_themes.dart';
import 'package:foody/helpers/utils/ui_mixins.dart';
import 'package:foody/helpers/widgets/my_button.dart';
import 'package:foody/helpers/widgets/my_flex.dart';
import 'package:foody/helpers/widgets/my_flex_item.dart';
import 'package:foody/helpers/widgets/my_responsiv.dart';
import 'package:foody/helpers/widgets/my_screen_media_type.dart';
import 'package:foody/helpers/widgets/my_spacing.dart';
import 'package:foody/helpers/widgets/my_text.dart';
import 'package:foody/helpers/widgets/my_text_style.dart';
import 'package:foody/images.dart';
import 'package:foody/views/layout/auth_layout.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

class RegisterAccountScreen extends StatefulWidget {
  const RegisterAccountScreen({super.key});

  @override
  State<RegisterAccountScreen> createState() => _RegisterAccountScreenState();
}

class _RegisterAccountScreenState extends State<RegisterAccountScreen>
    with SingleTickerProviderStateMixin, UIMixin {
  late RegisterAccountController controller;

  @override
  void initState() {
    controller = Get.put(RegisterAccountController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      child: GetBuilder(
        init: controller,
        builder: (controller) {
          return MyFlex(
              wrapAlignment: WrapAlignment.center,
              wrapCrossAlignment: WrapCrossAlignment.center,
              runAlignment: WrapAlignment.center,
              contentPadding: false,
              children: [
                MyFlexItem(
                  sizes: "lg-6",
                  child: MyResponsive(
                    builder: (_, __, type) {
                      return type == MyScreenMediaType.xxl
                          ? buildAuthSideBar()
                          : type == MyScreenMediaType.xl
                              ? buildAuthSideBar()
                              : type == MyScreenMediaType.lg
                                  ? buildAuthSideBar()
                                  : const SizedBox();
                    },
                  ),
                ),
                MyFlexItem(
                  sizes: "lg-6",
                  child: Padding(
                    padding: MySpacing.only(right: 70, left: 50),
                    child: Form(
                      key: controller.basicValidator.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                              child: MyText.displaySmall(
                            "Register",
                            fontWeight: 600,
                          )),
                          MySpacing.height(10),
                          Center(
                              child: MyText.bodyMedium(
                            "we're excited to have you on board,please activate your account by filling the details below",
                            textAlign: TextAlign.center,
                            fontWeight: 600,
                            muted: true,
                          )),
                          MySpacing.height(45),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  validator: controller.basicValidator
                                      .getValidation('first_name'),
                                  controller: controller.basicValidator
                                      .getController('first_name'),
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    labelText: "First Name",
                                    labelStyle:
                                        MyTextStyle.bodySmall(xMuted: true),
                                    border: outlineInputBorder,
                                    prefixIcon: const Icon(
                                      LucideIcons.user,
                                      size: 20,
                                    ),
                                    contentPadding: MySpacing.all(16),
                                    isCollapsed: true,
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                  ),
                                ),
                              ),
                              MySpacing.width(20),
                              Expanded(
                                child: TextFormField(
                                  validator: controller.basicValidator
                                      .getValidation('last_name'),
                                  controller: controller.basicValidator
                                      .getController('last_name'),
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    labelText: "Last Name",
                                    labelStyle:
                                        MyTextStyle.bodySmall(xMuted: true),
                                    border: outlineInputBorder,
                                    prefixIcon: const Icon(
                                      LucideIcons.user,
                                      size: 20,
                                    ),
                                    contentPadding: MySpacing.all(16),
                                    isCollapsed: true,
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          MySpacing.height(20),
                          TextFormField(
                            validator: controller.basicValidator
                                .getValidation('email'),
                            controller: controller.basicValidator
                                .getController('email'),
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: "Email Address",
                              labelStyle: MyTextStyle.bodySmall(xMuted: true),
                              border: outlineInputBorder,
                              prefixIcon: const Icon(
                                LucideIcons.mail,
                                size: 20,
                              ),
                              contentPadding: MySpacing.all(16),
                              isCollapsed: true,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                            ),
                          ),
                          MySpacing.height(20),
                          TextFormField(
                            validator: controller.basicValidator
                                .getValidation('password'),
                            controller: controller.basicValidator
                                .getController('password'),
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: !controller.showPassword,
                            decoration: InputDecoration(
                                labelText: "Password",
                                labelStyle: MyTextStyle.bodySmall(xMuted: true),
                                border: outlineInputBorder,
                                prefixIcon: const Icon(
                                  LucideIcons.lock,
                                  size: 20,
                                ),
                                suffixIcon: InkWell(
                                  onTap: controller.onChangeShowPassword,
                                  child: Icon(
                                    controller.showPassword
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    size: 20,
                                  ),
                                ),
                                contentPadding: MySpacing.all(16),
                                isCollapsed: true,
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never),
                          ),
                          MySpacing.height(30),
                          Center(
                            child: MyButton.rounded(
                              onPressed: controller.onLogin,
                              elevation: 0,
                              padding: MySpacing.xy(20, 16),
                              backgroundColor: contentTheme.primary,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  controller.loading
                                      ? SizedBox(
                                          height: 14,
                                          width: 14,
                                          child: CircularProgressIndicator(
                                            color: theme.colorScheme.onPrimary,
                                            strokeWidth: 1.2,
                                          ),
                                        )
                                      : Container(),
                                  if (controller.loading) MySpacing.width(16),
                                  MyText.bodySmall(
                                    'Register',
                                    color: contentTheme.onPrimary,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Center(
                            child: MyButton.text(
                              onPressed: controller.gotoLogin,
                              elevation: 0,
                              padding: MySpacing.x(16),
                              splashColor:
                                  contentTheme.secondary.withOpacity(0.1),
                              child: MyText.labelMedium(
                                'Already have account ?',
                                color: contentTheme.secondary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ]);
        },
      ),
    );
  }

  Widget buildAuthSideBar() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 700,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage(Images.authSideImage),
              fit: BoxFit.cover,
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
            blendMode: BlendMode.darken,
            child: Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
            ),
          ),
        ),
        SizedBox(
          height: 700,
          width: 400,
          child: Center(
            child: MyText.displayMedium(
              "${controller.greeting} Welcome",
              textAlign: TextAlign.center,
              color: contentTheme.light,
            ),
          ),
        ),
      ],
    );
  }
}
