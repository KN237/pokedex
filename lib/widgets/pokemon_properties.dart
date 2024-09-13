import 'package:flutter/material.dart';
import 'package:pokedex/configs/constants.dart';

class PokemonPropertie extends StatelessWidget {
  const PokemonPropertie(
      {super.key, required this.propertie, this.value, this.customWidget});

  final String propertie;
  final String? value;
  final Widget? customWidget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: SizedBox(
        width: 180,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              propertie,
              style: const TextStyle(color: CustomColor.grey, fontSize: 14),
            ),
            Text(
              value!,
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
