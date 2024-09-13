import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/services/pokemons_services.dart';

int counter = 26;

class PokemonsProvider extends ChangeNotifier {
  List<Pokemon> pokemon = [];
  List<Pokemon> _temp = [];
  bool isLoading = true;
  bool isShadowLoading = false;
  int baselimit = counter;
  int limit = 0;
  void loadData() async {
    pokemon = await PokemonServices.fetchAllPokemon(baselimit);
    isLoading = false;
    notifyListeners();
    isShadowLoading = true;
    _temp = await PokemonServices.fetchAllPokemons();
    isShadowLoading = false;
  }

  void loadMoreData() async {
    limit = baselimit + counter;
    pokemon = [
      ...pokemon,
      ..._temp.where(
        (elt) => (elt.pokedexId! > baselimit) && (elt.pokedexId! <= limit),
      ),
    ];
    baselimit = limit;
    notifyListeners();
  }
}
