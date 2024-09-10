import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/services/pokemons_services.dart';

class PokemonsProvider extends ChangeNotifier {
  List<Pokemon> pokemon = [];
  bool isLoading = true;
  void loadData() async {
    pokemon = await PokemonServices.fetchAllPokemon();
    isLoading = false;
    notifyListeners();
  }
}
