import 'package:firebase_auth/firebase_auth.dart';
import 'package:lesson6/model/photomemo.dart';

class CreateMemoModel {
  User user;
  dynamic photo; // mobile (File), web (Unit8List)
  String? photoMimeType; // used by web
  late PhotoMemo tempMemo;
  String? progressMessage;

  CreateMemoModel({required this.user}) {
    tempMemo = PhotoMemo(
      createdBy: '',
      memo: '',
      title: '',
      photoFilename: '',
      photoURL: '',
    );
  }
}
