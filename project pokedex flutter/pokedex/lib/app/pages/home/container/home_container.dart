import 'package:flutter/material.dart';
import 'package:pokedex/app/common/errors/failure.dart';
import 'package:pokedex/app/common/models/pokemon.dart';
import 'package:pokedex/app/common/repository/pokemon_repository.dart';
import 'package:pokedex/app/pages/home/home_error.dart';
import 'package:pokedex/app/pages/home/home_page.dart';
import '../../../common/widgets/loading/page_loading.dart';
import '../../details/container/detail_arguments.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({
    Key? key,
    required this.repository,
    required this.onItemTap,
  }) : super(key: key);
  final IPokemonRepository repository;
  final Function(String, DetailArguments) onItemTap;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
      future: repository.getAllPokemons(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const PageLoadingWidget();
        }
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return HomePage(list: snapshot.data!, onItemTap: onItemTap,);
        }
        if (snapshot.hasError) {
          return HomeError(
            error: (snapshot.error as Failure).message!,
          );
        }

        return Container();
      },
    );
  }
}
