import 'package:flutter/material.dart';
import 'package:pokedex/app/common/widgets/loading/page_loading.dart';
import 'package:pokedex/app/pages/details/detail_page.dart';

import '../../../common/errors/failure.dart';
import '../../../common/models/pokemon.dart';
import '../../../common/repository/pokemon_repository.dart';
import '../../../common/widgets/error/error_page.dart';
import 'detail_arguments.dart';

class DetailContainer extends StatefulWidget {
  const DetailContainer({
    Key? key,
    required this.repository,
    required this.arguments,
    required this.onBack,
  }) : super(key: key);

  final IPokemonRepository repository;
  final DetailArguments arguments;
  final VoidCallback onBack;

  @override
  State<DetailContainer> createState() => _DetailContainerState();
}

class _DetailContainerState extends State<DetailContainer> {
  late PageController _controller;
  late Future<List<Pokemon>> _future;
  Pokemon? _pokemon;

  @override
  void initState() {
    _controller = PageController(
        viewportFraction: 0.6, initialPage: widget.arguments.index!);
    _future = widget.repository.getAllPokemons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
      future: _future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const PageLoadingWidget();
        }
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          if (_pokemon == null) {
            _pokemon = widget.arguments.pokemon;
          }
          return DetailPage(
            pokemon: _pokemon!,
            list: snapshot.data!,
            onBack: widget.onBack,
            controller: _controller,
            onPokemonChanged: (Pokemon value) {
              setState(() {
                _pokemon = value;
              });
            },
          );
        }
        if (snapshot.hasError) {
          return ErrorPage(
            error: (snapshot.error as Failure).message!,
          );
        }

        return Container();
      },
    );
  }
}
