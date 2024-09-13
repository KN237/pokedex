import 'package:flutter/material.dart';
import 'package:pokedex/configs/constants.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/screens/pokemon_details.dart';

class PokeBox extends StatelessWidget {
  const PokeBox({
    super.key,
    required this.pokemon,
  });

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => PokemonDetails(
              pokemon: pokemon,
              color: CustomColor.getBoxColor(pokemon.apiTypes!.last.name!),
            ),
          ),
        );
      },
      child: Hero(
        tag: pokemon.name! + pokemon.image!,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: CustomColor.getBoxColor(pokemon.apiTypes!.last.name!),
          ),
          child: Stack(
            children: [
              Positioned(
                bottom: -12,
                right: 0,
                child: Image.asset(
                  'assets/images/pokeball.png',
                  color: Colors.white.withOpacity(0.2),
                  width: 80,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Image.network(
                  pokemon.image!,
                  width: 80,
                ),
              ),
              Positioned(
                top: 20,
                left: 10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      pokemon.name!,
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          color: CustomColor.white,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Positioned(
                top: 40,
                left: 10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    for (ApiType apiType in pokemon.apiTypes!)
                      Container(
                        height: 20,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        margin: const EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: CustomColor.white.withOpacity(0.2),
                        ),
                        child: Center(
                          child: Text(
                            apiType.name!,
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(
                                    color: CustomColor.white, fontSize: 8),
                          ),
                        ),
                      )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
