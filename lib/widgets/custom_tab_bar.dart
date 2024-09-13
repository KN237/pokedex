import 'package:flutter/material.dart';
import 'package:pokedex/configs/constants.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/widgets/pokemon_evolution.dart';
import 'package:pokedex/widgets/pokemon_moves.dart';
import 'package:pokedex/widgets/pokemon_stats.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    super.key,
    required TabController tabController,
    required this.pokemon,
  }) : _tabController = tabController;

  final TabController _tabController;
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          indicatorColor: CustomColor.lilac,
          dividerColor: CustomColor.grey.withOpacity(0.2),
          padding: const EdgeInsets.fromLTRB(15, 30, 15, 20),
          labelPadding: const EdgeInsets.only(bottom: 17),
          labelStyle: const TextStyle(
            color: CustomColor.black,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
          unselectedLabelColor: CustomColor.black.withOpacity(0.7),
          tabs: const [
            Text(
              'Description',
            ),
            Text(
              'Evolutions',
            ),
            Text(
              'Stats',
            ),
            Text(
              'Mouvements',
            ),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              const PokemonMoves(),
              PokemonEvolution(pokemon: pokemon),
              PokemonStats(pokemon: pokemon),
              const PokemonMoves(),
            ],
          ),
        )
      ],
    );
  }
}
