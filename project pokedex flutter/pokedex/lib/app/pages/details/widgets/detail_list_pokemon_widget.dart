import 'package:flutter/material.dart';
import 'package:pokedex/app/common/models/pokemon.dart';

import 'detail_item_list_widget.dart';

class DetailListPokemonWidget extends StatelessWidget {
  const DetailListPokemonWidget({
    Key? key,
    required this.pokemon,
    required this.list,
    required this.controller,
    required this.onPokemonChanged,
  }) : super(key: key);

  final Pokemon pokemon;
  final List<Pokemon> list;
  final PageController controller;
  final ValueChanged<Pokemon> onPokemonChanged;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        color: pokemon.baseColor,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      pokemon.name,
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    '#${pokemon.num}',
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 300,
              width: double.infinity,
              child: PageView(
                onPageChanged: (index) {
                  onPokemonChanged(list[index]);
                },
                controller: controller,
                children: list.map((e) {
                  bool diff = e.name != pokemon.name;
                  return DetailItemListWidget(isDiff: diff, pokemon: e,);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
