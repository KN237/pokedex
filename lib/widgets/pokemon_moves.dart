import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pokedex/configs/constants.dart';

class PokemonMoves extends StatelessWidget {
  const PokemonMoves({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Lottie.asset('assets/images/loader2.json', width: 150),
        Center(
          child: Text(
            'Disponible bientot...',
            style: TextStyle(
              color: CustomColor.grey.withOpacity(0.7),
            ),
          ),
        ),
      ],
    );
  }
}
