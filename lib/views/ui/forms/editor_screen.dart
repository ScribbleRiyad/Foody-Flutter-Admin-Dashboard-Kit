import 'package:foody/controller/ui/forms/editor_controller.dart';
import 'package:foody/helpers/utils/ui_mixins.dart';
import 'package:foody/helpers/widgets/my_breadcrumb.dart';
import 'package:foody/helpers/widgets/my_breadcrumb_item.dart';
import 'package:foody/helpers/widgets/my_flex.dart';
import 'package:foody/helpers/widgets/my_flex_item.dart';
import 'package:foody/helpers/widgets/my_spacing.dart';
import 'package:foody/helpers/widgets/my_text.dart';
import 'package:foody/helpers/widgets/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:foody/helpers/widgets/responsive.dart';
import 'package:foody/views/layout/layout.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quill_html_editor/quill_html_editor.dart';

class EditorScreen extends StatefulWidget {
  const EditorScreen({super.key});

  @override
  State<EditorScreen> createState() => _EditorScreenState();
}

class _EditorScreenState extends State<EditorScreen> with SingleTickerProviderStateMixin, UIMixin {
  EditorController controller = EditorController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: GetBuilder(
        init: controller,
        tag: 'editor_controller',
        builder: (controller) {
          return Column(
            children: [
              Padding(
                padding: MySpacing.x(flexSpacing),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText.titleMedium("Editor", fontSize: 18, fontWeight: 600),
                    MyBreadcrumb(
                      children: [MyBreadcrumbItem(name: 'Form'), MyBreadcrumbItem(name: 'Editor', active: true)],
                    ),
                  ],
                ),
              ),
              MySpacing.height(flexSpacing),
              MyFlex(children: [
                MyFlexItem(
                  sizes: "lg-8",
                  child: Column(
                    children: [
                      ToolBar(
                        toolBarColor: contentTheme.background,
                        iconColor: contentTheme.onBackground,
                        padding: EdgeInsets.all(8),
                        iconSize: 20,
                        controller: controller.quillHtmlEditor,
                      ),
                      QuillHtmlEditor(
                        text: "<h1>Hello</h1>This is a quill html editor example 😊",
                        hintText: 'Hint text goes here',
                        controller: controller.quillHtmlEditor,
                        isEnabled: true,
                        minHeight: 300,
                        textStyle: _editorTextStyle,
                        hintTextStyle: MyTextStyle.bodyMedium(),
                        hintTextAlign: TextAlign.start,
                        padding: EdgeInsets.only(left: 10, top: 5),
                        hintTextPadding: EdgeInsets.zero,
                        backgroundColor: contentTheme.background,
                        inputAction: InputAction.newline,
                        onFocusChanged: (hasFocus) => debugPrint('has focus $hasFocus'),
                        onTextChanged: (text) => debugPrint('widget text change $text'),
                        onEditorCreated: () => debugPrint('Editor has been loaded'),
                        onEditingComplete: (s) => debugPrint('Editing completed $s'),
                        onEditorResized: (height) => debugPrint('Editor resized $height'),
                        onSelectionChanged: (sel) => debugPrint('${sel.index},${sel.length}'),
                        loadingBuilder: (context) {
                          return const Center(
                              child: CircularProgressIndicator(
                            strokeWidth: 0.4,
                          ));
                        },
                      ),
                    ],
                  ),
                ),
              ])
            ],
          );
        },
      ),
    );
  }

  final _editorTextStyle = MyTextStyle.bodyMedium(fontWeight: 600, textStyle: GoogleFonts.roboto());
}
