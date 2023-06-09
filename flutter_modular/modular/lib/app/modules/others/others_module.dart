import 'package:flutter_modular/flutter_modular.dart';

class OthersModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => Controller(i()))
  ];
}

class Controller {

  final String name;
  final bool isInjected;

  Controller(this.name, this.isInjected);

  printText() {
    print('name: $name');
  }
}