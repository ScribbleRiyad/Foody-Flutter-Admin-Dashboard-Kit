import 'package:foody/views/my_controller.dart';
import 'package:quill_html_editor/quill_html_editor.dart';

class EditorController extends MyController {
  late QuillEditorController quillHtmlEditor;

  @override
  void onInit() {
    quillHtmlEditor = QuillEditorController();
    super.onInit();
  }
}
