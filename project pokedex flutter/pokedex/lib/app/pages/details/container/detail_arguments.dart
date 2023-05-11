import 'package:pokedex/app/common/models/pokemon.dart';

class DetailArguments {
  DetailArguments({
    this.index = 0,
    required this.pokemon,
  });

  final Pokemon pokemon;
  final int? index;
}
