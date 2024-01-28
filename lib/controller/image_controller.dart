import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';

class ImageController extends GetxController {
  XFile? _image;

  XFile? get image => _image;

  void updateImage(XFile image) {
    _image = image;
    update();
  }
}
