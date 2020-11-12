import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  final picker = ImagePicker();
  Future getImage() async {
    final pickedFile = await picker.getImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );
    return pickedFile.path;
  }
}
