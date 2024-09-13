import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokedex/configs/theme.dart';
import 'package:pokedex/providers/pokemons_provider.dart';
import 'package:pokedex/screens/pokemons.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    ChangeNotifierProvider(
      create: (context) => PokemonsProvider(),
      builder: (context, child) {
        return MaterialApp(
          title: 'Pokedex',
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          home: const PokemonScreen(),
        );
      },
    ),
  );
}
