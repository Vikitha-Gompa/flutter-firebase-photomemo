import 'package:flutter/widgets.dart';
import 'package:lesson6/controller/auth_controller.dart';
import 'package:lesson6/view/creatememo_screen.dart';
import 'package:lesson6/view/home_screen.dart';

class HomeController {
  HomeState state;
  HomeController(this.state);

  Future<void> signOut() async {
    await firebaseSignOut();
  }

  void gotoCreateMemo() {
    Navigator.pushNamed(state.context, CreateMemoScreen.routeName);
  }
}
