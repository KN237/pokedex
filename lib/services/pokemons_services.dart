import 'dart:convert';

import 'package:http/http.dart';
import 'package:pokedex/models/pokemon.dart';

class PokemonServices {
  static const baseUrl = 'https://pokebuildapi.fr/api/v1/pokemon/';

  static Future<List<Pokemon>> fetchAllPokemon(int limit) async {
    List<Pokemon> temp = [];
    final response = await get(
      Uri.parse('${baseUrl}limit/$limit'),
    );
    if (response.statusCode == 200) {
      for (Map<String, dynamic> element in jsonDecode(response.body)) {
        temp.add(
          Pokemon.fromJson(element),
        );
      }
    }

    return temp;
  }

  static Future<List<Pokemon>> fetchAllPokemons() async {
    List<Pokemon> temp = [];
    final response = await get(
      Uri.parse(baseUrl),
    );

    if (response.statusCode == 200) {
      for (Map<String, dynamic> element in jsonDecode(response.body)) {
        temp.add(
          Pokemon.fromJson(element),
        );
      }
    }

    return temp;
  }
}
