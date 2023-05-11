import 'package:arquitetura/app/viewmodels/change_theme_viewmodel.dart';
import 'package:arquitetura/app/sevices/shared_local_storage_service.dart';
import 'package:flutter/material.dart';

class AppController {
  static final AppController instance = AppController._();

  AppController._() {
    changeThemeViewModel.init();
  }

  final ChangeThemeViewModel changeThemeViewModel =
      ChangeThemeViewModel(storage: SharedLocalStorageService());

  bool get isDark => changeThemeViewModel.config.themeSwitch.value;

  ValueNotifier<bool> get themeSwitch =>
      changeThemeViewModel.config.themeSwitch;
}
