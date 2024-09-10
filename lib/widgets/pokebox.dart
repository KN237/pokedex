import 'package:flutter/material.dart';
import 'package:pokedex/configs/constants.dart';
import 'package:pokedex/models/pokemon.dart';

class PokeBox extends StatelessWidget {
  const PokeBox({
    super.key,
    required this.pokemon,
  });

  final Pokemon pokemon;

  Color getBoxColor() {
    switch (pokemon.apiTypes!.last.name) {
      case "Normal":
        return const Color(0XFFA8A878);
      case "Combat":
        return const Color(0XFFC03028);
      case "Vol":
        return const Color(0XFFA890F0);
      case "Poison":
        return const Color(0XFFA040A0);
      case "Sol":
        return const Color(0XFFE0C068);
      case "Roche":
        return const Color(0XFFB8A038);
      case "Insecte":
        return const Color(0XFFA8B820);
      case "Spectre":
        return const Color(0XFF705898);
      case "Acier":
        return const Color(0XFFB8B8D0);
      case "Feu":
        return const Color(0XFFFA6C6C);
      case "Eau":
        return const Color(0XFF6890F0);
      case "Plante":
        return const Color(0XFF48CFB2);
      case "Électrik":
        return const Color(0XFFFFCE4B);
      case "Psy":
        return const Color(0XFFF85888);
      case "Glace":
        return const Color(0XFF98D8D8);
      case "Dragon":
        return const Color(0XFF7038F8);
      case "Ténèbres":
        return const Color(0XFF705848);
      case "Fée":
        return const Color(0XFFEE99AC);
      default:
        return CustomColor.lilac;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: getBoxColor(),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: -10,
            right: 0,
            child: Image.asset(
              'assets/images/pokeball.png',
              color: Colors.white.withOpacity(0.1),
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
                      color: CustomColor.white, fontWeight: FontWeight.bold),
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
                            .copyWith(color: CustomColor.white, fontSize: 8),
                      ),
                    ),
                  )
              ],
            ),
          )
        ],
      ),
    );
  }
}
