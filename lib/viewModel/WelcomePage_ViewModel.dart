import 'package:flutter/material.dart';

class WelcomepageViewmodel extends ChangeNotifier {
  void goToHome(BuildContext context) {
    Navigator.pushNamed(context, '/home');
  }
}
