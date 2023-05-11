import 'package:arquitetura/app/app_controller.dart';
import 'package:flutter/material.dart';
import '../../../viewmodels/change_theme_viewmodel.dart';


class CustomSwitchWidget extends StatelessWidget {
  const CustomSwitchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: AppController.instance.themeSwitch,
        builder: (context, isDark, child) {
          return Switch(
              value: AppController.instance.isDark,
              onChanged: (value) {
                AppController.instance.changeThemeViewModel.changedTheme(value);
              });
        });
  }
}
