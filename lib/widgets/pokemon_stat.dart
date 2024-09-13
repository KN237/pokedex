import 'package:flutter/material.dart';
import 'package:pokedex/configs/constants.dart';

class PokemonStat extends StatelessWidget {
  const PokemonStat(
      {super.key, required this.propertie, required this.value, this.isTotal});

  final String propertie;
  final double value;
  final bool? isTotal;
  @override
  Widget build(BuildContext context) {
    double temp = value;
    if (isTotal == true) {
      temp = (value * 100) / 600;
    }
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: SizedBox(
        width: 350,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 80,
              child: Text(
                propertie,
                style: const TextStyle(color: CustomColor.grey, fontSize: 14),
              ),
            ),
            SizedBox(
              width: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    value.toInt().toString(),
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 150,
                    child: LinearProgressIndicator(
                      value: temp / 100,
                      color: temp < 50 ? CustomColor.red : CustomColor.green,
                      backgroundColor: CustomColor.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
