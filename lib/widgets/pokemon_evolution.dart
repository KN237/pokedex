import 'package:flutter/material.dart';
import 'package:pokedex/configs/constants.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/providers/pokemons_provider.dart';
import 'package:provider/provider.dart';

class PokemonEvolution extends StatelessWidget {
  const PokemonEvolution({super.key, required this.pokemon});
  final Pokemon pokemon;
  @override
  Widget build(BuildContext context) {
    List<Pokemon> descendants = [];
    if (pokemon.apiPreEvolution != null) {
      descendants.add(
        context.watch<PokemonsProvider>().pokemon.firstWhere(
            (elt) => elt.pokedexId == pokemon.apiPreEvolution!.pokedexIdd),
      );

      descendants = [...descendants, pokemon];
    } else {
      descendants = [pokemon];
    }

    if (pokemon.apiEvolutions!.isNotEmpty) {
      for (var element in pokemon.apiEvolutions!) {
        descendants.add(
          context
              .watch<PokemonsProvider>()
              .pokemon
              .firstWhere((elt) => elt.pokedexId == element.pokedexId),
        );
      }
    }

    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Chaîne d\'évolution',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            for (var i = 0; i < descendants.length; i++)
              if (i + 1 < descendants.length)
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/pokeball.png',
                                  width: 100,
                                  color: CustomColor.grey.withOpacity(0.2),
                                ),
                                Image.network(
                                  descendants[i].image!,
                                  width: 120,
                                ),
                              ],
                            ),
                            Text(descendants[i].name!)
                          ],
                        ),
                        const Icon(Icons.arrow_right_alt),
                        Column(
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/pokeball.png',
                                  width: 100,
                                  color: CustomColor.grey.withOpacity(0.2),
                                ),
                                Image.network(
                                  descendants[i + 1].image!,
                                  width: 120,
                                ),
                              ],
                            ),
                            Text(descendants[i + 1].name!)
                          ],
                        ),
                      ],
                    ),
                    Divider(
                      color: CustomColor.grey.withOpacity(0.2),
                    ),
                  ],
                )
          ],
        ),
      ),
    );
  }
}
