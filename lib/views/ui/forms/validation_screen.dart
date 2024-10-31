
import 'package:foody/controller/ui/forms/basic_input_controller.dart';
import 'package:foody/controller/ui/forms/validation_controller.dart';
import 'package:foody/helpers/utils/my_shadow.dart';
import 'package:foody/helpers/utils/ui_mixins.dart';
import 'package:foody/helpers/widgets/my_breadcrumb.dart';
import 'package:foody/helpers/widgets/my_breadcrumb_item.dart';
import 'package:foody/helpers/widgets/my_button.dart';
import 'package:foody/helpers/widgets/my_card.dart';
import 'package:foody/helpers/widgets/my_flex.dart';
import 'package:foody/helpers/widgets/my_flex_item.dart';
import 'package:foody/helpers/widgets/my_spacing.dart';
import 'package:foody/helpers/widgets/my_text.dart';
import 'package:foody/helpers/widgets/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:foody/helpers/widgets/responsive.dart';
import 'package:foody/views/layout/layout.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ValidationScreen extends StatefulWidget {
  const ValidationScreen({super.key});

  @override
  State<ValidationScreen> createState() => _ValidationScreenState();
}

class _ValidationScreenState extends State<ValidationScreen>
    with SingleTickerProviderStateMixin, UIMixin {
  late ValidationController controller;
  @override
  late OutlineInputBorder outlineInputBorder;

  @override
  void initState() {
    outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
          width: 1, strokeAlign: 0, color: colorScheme.onSurface.withAlpha(80)),
    );
    controller = ValidationController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: GetBuilder(
        init: controller,
        tag: 'validation_controller',
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: MySpacing.x(flexSpacing),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText.titleMedium("Validation",
                        fontSize: 18, fontWeight: 600),
                    MyBreadcrumb(
                      children: [
                        MyBreadcrumbItem(name: 'Form'),
                        MyBreadcrumbItem(name: 'Validation', active: true)
                      ],
                    ),
                  ],
                ),
              ),
              MySpacing.height(flexSpacing),
              Padding(
                padding: MySpacing.x(flexSpacing / 2),
                child: MyFlex(
                  wrapAlignment: WrapAlignment.start,
                  wrapCrossAlignment: WrapCrossAlignment.start,
                  children: [
                    MyFlexItem(sizes: "lg-6 md-12", child: validation()),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget validation() {
    return MyCard(
      borderRadiusAll: 8,
      shadow: MyShadow(elevation: .5, position: MyShadowPosition.bottom),
      paddingAll: flexSpacing,
      child: Form(
        key: controller.basicValidator.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText.labelMedium(
              "Full Name",
            ),
            MySpacing.height(8),
            CommonValidationForm(
              hintText: "Den Navadiya",
              icon: LucideIcons.user,
              validator: controller.basicValidator.getValidation('full_name'),
              controller: controller.basicValidator.getController('full_name'),
              outlineInputBorder: outlineInputBorder,
            ),
            MySpacing.height(16),
            MyText.labelMedium(
              "Email Address",
            ),
            MySpacing.height(8),
            CommonValidationForm(
              icon: LucideIcons.mail,
              hintText: "demo@getappui.com",
              validator: controller.basicValidator.getValidation('email'),
              controller: controller.basicValidator.getController('email'),
              outlineInputBorder: outlineInputBorder,
            ),
            MySpacing.height(16),
            MyText.labelMedium(
              "Password",
            ),
            MySpacing.height(8),
            CommonValidationForm(
              icon: LucideIcons.lock,
              hintText: "******",
              validator: controller.basicValidator.getValidation('password'),
              controller: controller.basicValidator.getController('password'),
              outlineInputBorder: outlineInputBorder,
            ),
            MySpacing.height(20),
            MyText.labelMedium(
              "Gender",
            ),
            MySpacing.height(8),
            DropdownButtonFormField<Gender>(
                dropdownColor: colorScheme.surface,
                menuMaxHeight: 200,
                items: Gender.values
                    .map((gender) => DropdownMenuItem<Gender>(
                        value: gender,
                        child: MyText.labelMedium(
                          gender.name.capitalize!,
                        )))
                    .toList(),
                icon: Icon(
                  LucideIcons.chevronDown,
                  size: 20,
                ),
                decoration: InputDecoration(
                    hintText: "Select gender",
                    hintStyle: MyTextStyle.bodySmall(xMuted: true),
                    border: outlineInputBorder,
                    enabledBorder: outlineInputBorder,
                    focusedBorder: focusedInputBorder,
                    contentPadding: MySpacing.all(16),
                    isCollapsed: true,
                    floatingLabelBehavior: FloatingLabelBehavior.never),
                onChanged:
                    controller.basicValidator.onChanged<Object?>('gender'),
                validator:
                    controller.basicValidator.getValidation<Gender?>('gender')),
            MySpacing.height(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(
                  onPressed: controller.onResetBasicForm,
                  elevation: 0,
                  padding: MySpacing.xy(20, 16),
                  backgroundColor: contentTheme.secondary,
                  borderRadiusAll: 8,
                  child: MyText.bodySmall(
                    'Clear',
                    color: contentTheme.onSecondary,
                  ),
                ),
                MySpacing.width(16),
                MyButton(
                  onPressed: controller.onSubmitBasicForm,
                  elevation: 0,
                  padding: MySpacing.xy(20, 16),
                  backgroundColor: contentTheme.primary,
                  borderRadiusAll: 8,
                  child: MyText.bodySmall(
                    'Submit',
                    color: contentTheme.onPrimary,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

/* Common Text Field For Validation */
class CommonValidationForm extends StatelessWidget {
  const CommonValidationForm({
    super.key,
    required this.controller,
    required this.outlineInputBorder,
    this.validator,
    this.hintText,
    required this.icon,
  });

  final IconData icon;
  final String? hintText;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final OutlineInputBorder outlineInputBorder;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: MyTextStyle.bodySmall(xMuted: true),
          border: outlineInputBorder,
          enabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder,
          contentPadding: MySpacing.all(16),
          prefixIcon: Icon(icon, size: 20),
          isCollapsed: true,
          floatingLabelBehavior: FloatingLabelBehavior.never),
    );
  }
}
