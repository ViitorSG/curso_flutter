import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular/app/modules/bas/bas_module.dart';

class AppModule extends Module {

  @override
  final List<Module> imports = [
    BasModule(),
  ];

  @override
  final List<Bind> binds = [
    Bind.instance<String>('Victor'),
  ];
}

