import 'package:flutter/material.dart';

import '../helper/app_colors.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Center(
        child: Icon(Icons.settings),
      ),
    );
  }
}
