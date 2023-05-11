import 'package:flutter/material.dart';

import '../../../common/models/pokemon.dart';

class DetailItemListWidget extends StatelessWidget {
  const DetailItemListWidget({Key? key, required this.isDiff, required this.pokemon}) : super(key: key);

  final bool isDiff;
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 400),
        opacity: isDiff ? 0.4 : 1.0,
        child: TweenAnimationBuilder<double>(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeIn,
            tween: Tween<double>(
              end: isDiff ? 100 : 300,
              begin: isDiff ? 300 : 100,
            ),
            builder: (BuildContext context, double value,
                Widget? child) {
              return Image.network(
                pokemon.image,
                width: value,
                fit: BoxFit.contain,
                color: isDiff
                    ? Colors.black.withOpacity(0.4)
                    : null,
              );
            }),
      ),
    );
  }
}
