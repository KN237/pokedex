import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/widgets/pokemon_properties.dart';

class PokemonDescription extends StatelessWidget {
  const PokemonDescription({super.key, required this.pokemon});

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          PokemonPropertie(propertie: 'Espèce', value: pokemon.name),
          PokemonPropertie(propertie: 'Taille', value: pokemon.name),
          PokemonPropertie(propertie: 'Poids', value: pokemon.name),
          PokemonPropertie(propertie: 'Capacités', value: pokemon.name),
          const Padding(
            padding: EdgeInsets.only(top: 20.0, bottom: 10.0),
            child: Text(
              'Élevage',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          PokemonPropertie(propertie: 'Genre', value: pokemon.name),
          PokemonPropertie(propertie: 'Groupe OV', value: pokemon.name),
          PokemonPropertie(propertie: 'Cycle OV', value: pokemon.name),
          const Padding(
            padding: EdgeInsets.only(top: 20.0, bottom: 10.0),
            child: Text(
              'Entrainement',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const PokemonPropertie(propertie: 'EXP de base', value: '120'),
        ],
      ),
    );
  }
}
