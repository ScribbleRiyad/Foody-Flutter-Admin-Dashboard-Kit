import 'package:file_picker/file_picker.dart';
import 'package:foody/views/my_controller.dart';

class FileUploadController extends MyController {
  List<PlatformFile> files = [];
  List<PlatformFile> multipleFiles = [];
  bool selectMultipleFile = false;
  FileType type = FileType.any;

  Future<void> pickFiles() async {
    var result = await FilePicker.platform
        .pickFiles(allowMultiple: selectMultipleFile, type: type);
    if (result?.files.isNotEmpty ?? false) {
      files.addAll(result!.files);
    }
    update();
  }

  void onSelectMultipleFile(value) {
    selectMultipleFile = value ?? selectMultipleFile;
    update();
  }

  void removeFile(PlatformFile file) {
    files.remove(file);
    update();
  }
}
