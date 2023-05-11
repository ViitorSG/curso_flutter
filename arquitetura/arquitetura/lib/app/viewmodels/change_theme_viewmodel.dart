import 'package:arquitetura/app/interfaces/local_storage_interface.dart';
import '../models/appconfig_model.dart';

class ChangeThemeViewModel {
  final ILocalStorage storage;

  final AppConfigModel config = AppConfigModel();

  ChangeThemeViewModel({required this.storage});

  Future init() async{
    await storage.get('isDark').then((value) {
      if (value != null) config.themeSwitch.value = value;
    });
  }

  changedTheme(bool value) {
    // For save the changed when the app close/set offline we can use this codes
    //sharedPreferences
    //hive
    //sqlite
    config.themeSwitch.value = value;
    storage.put('isDark', value);
  }
}
