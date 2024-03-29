import 'dart:io';

import 'package:ShishaOase/services/app_service.dart';
import 'package:ShishaOase/services/imagepicker_service.dart';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../app/locator.dart';
import '../../../services/navigation_service.dart';

class AddTabaccoViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final ImagePickerService _imagePickerService = locator<ImagePickerService>();
  final AppService _appService = locator<AppService>();

  final formkey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final amountController = TextEditingController();

  File _image;
  String _filepath;
  File get getImage => _image;
  String get getFilepath => _filepath;

  selectPictureForUpload() async {
    _filepath = await _imagePickerService.getImage();
    _image = File(_filepath);
    notifyListeners();
  }

  uploadEntry() async {
    await _appService.uploadNewTabacco(
      nameController.text,
      int.parse(amountController.text),
      _filepath,
    );

    _navigationService.popBack();
  }
}
