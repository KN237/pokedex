import 'package:flutter/material.dart';
import 'package:pokedex/configs/constants.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/widgets/pokemon_stat.dart';

class PokemonStats extends StatelessWidget {
  const PokemonStats({
    super.key,
    required this.pokemon,
  });

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PokemonStat(propertie: 'HP', value: pokemon.stats!.hp ?? 0),
          PokemonStat(propertie: 'Attaque', value: pokemon.stats!.attack ?? 0),
          PokemonStat(propertie: 'Défense', value: pokemon.stats!.defense ?? 0),
          PokemonStat(
              propertie: 'Spé. Atq', value: pokemon.stats!.specialAttack ?? 0),
          PokemonStat(
              propertie: 'Spé. Def', value: pokemon.stats!.specialDefense ?? 0),
          PokemonStat(propertie: 'Rapidité', value: pokemon.stats!.speed ?? 0),
          PokemonStat(
            propertie: 'Total',
            value: pokemon.stats!.sumAll(),
            isTotal: true,
          ),
          const Padding(
            padding: EdgeInsets.only(
              top: 20.0,
            ),
            child: Text(
              'Type de défenses',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 10.0),
            child: Text(
              'Efficacité de chaque type sur ${pokemon.name}',
              style: TextStyle(
                fontSize: 14,
                color: CustomColor.grey.withOpacity(0.8),
              ),
            ),
          ),
          SizedBox(
            height: 50,
            child: Wrap(
              spacing: 5,
              runSpacing: 10,
              children: [
                for (ApiResistance resistance in pokemon.apiResistances!)
                  Container(
                    width: ((resistance.name!.length + 3) <= 6) ? 70 : 90,
                    height: 30,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: CustomColor.getBoxColor(resistance.name!)
                          .withOpacity(0.4),
                    ),
                    child: Center(
                      child: Text(
                        '${resistance.name!} ${resistance.damageMultiplier!.toInt()}x',
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: CustomColor.getBoxColor(resistance.name!),
                            ),
                      ),
                    ),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
