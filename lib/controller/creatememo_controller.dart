// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:lesson6/controller/get_photo.dart';
import 'package:lesson6/controller/storage_controller.dart';
import 'package:lesson6/model/photomemo.dart';
import 'package:lesson6/view/creatememo_screen.dart';
import 'package:lesson6/view/show_snackbar.dart';

class CreateMemoController {
  CreateMemoState state;

  CreateMemoController(this.state);

  getPhoto(CameraOrGallery source) async {
    try {
      var (photo, mimeType) = await getPhotoFromDevice(source);
      if (photo == null) return;
      state.callSetState(() {
        state.model.photo = photo;
        state.model.photoMimeType = mimeType;
      });
    } catch (e) {
      print('==== failed to get photo: $e');
      showSnackbar(
        context: state.context,
        message: 'Failed to get photo',
      );
    }
  }

  Future<void> save() async {
    FormState? currentState = state.formKey.currentState;
    if (currentState == null) return;
    if (!currentState.validate()) return;
    if (state.model.photo == null) {
      showSnackbar(
        context: state.context,
        message: 'Photo not selected',
        seconds: 10,
      );
      return;
    }

    try {
      var (filename, downloadURL) = await uploadPhotoFile(
        photo: state.model.photo,
        uid: state.model.user.uid,
        photoMimeType: state.model.photoMimeType,
        listener: (int progress) {
          // print('======== Uploading: $progress %');
          state.callSetState(() {
            if (progress == 100) {
              state.model.progressMessage = null;
            } else {
              state.model.progressMessage = 'Uploading: $progress %';
            }
          });
        },
      );
      print('========= filename: $filename');
      print('======== downloadURL:  $downloadURL');
    } catch (e) {
      print('**************** Save photomemo error: $e');
      showSnackbar(
        context: state.context,
        message: 'Save photomemo error: $e',
        seconds: 10,
      );
    }
  }
}
