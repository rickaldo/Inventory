import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as fs;

class FireStorageService {
  fs.FirebaseStorage storage = fs.FirebaseStorage.instance;

  Future<String> uploadPicture(String filePath) async {
    File file = File(filePath);

    try {
      await storage.ref('tobaccoPictures/' + filePath).putFile(file);
      String downloadURL =
          await storage.ref('tobaccoPictures/' + filePath).getDownloadURL();
      return downloadURL;
    } catch (e) {
      print(e);
    }
    return "";
  }
}
