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
    switch (pokemon.apiTypes!.first.name) {
      case "Normal":
        return CustomColor.black;
      case "Combat":
        return CustomColor.black;
      case "Vol":
        return CustomColor.black;
      case "Poison":
        return CustomColor.black;
      case "Sol":
        return CustomColor.black;
      case "Roche":
        return CustomColor.black;
      case "Insecte":
        return CustomColor.black;
      case "Spectre":
        return CustomColor.grey;
      case "Acier":
        return CustomColor.lightGrey;
      case "Feu":
        return CustomColor.red;
      case "Eau":
        return CustomColor.blue;
      case "Plante":
        return CustomColor.green;
      case "Électrik":
        return CustomColor.black;
      default:
        return CustomColor.lilac;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: getBoxColor().withOpacity(0.8),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: -15,
            right: 0,
            child: Image.asset(
              'assets/images/pokeball.png',
              color: Colors.white.withOpacity(0.1),
              width: 90,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.network(
              pokemon.image!,
              width: 90,
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
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: CustomColor.white,
                      ),
                )
              ],
            ),
          ),
          Positioned(
            top: 40,
            left: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                for (ApiType apiType in pokemon.apiTypes!)
                  Container(
                    width: 60,
                    height: 25,
                    margin: const EdgeInsets.only(top: 05),
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
                            .copyWith(color: CustomColor.white, fontSize: 10),
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
