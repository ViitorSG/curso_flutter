import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modular/app/app_module.dart';
import 'package:modular/app/modules/others/others_module.dart';
import 'package:modular_test/modular_test.dart';

void main(){

  initModules([AppModule(), OthersModule()]);

  test('get Controller', () {
    final controller = Modular.get<Controller>();
    controller.printText();
  });
}