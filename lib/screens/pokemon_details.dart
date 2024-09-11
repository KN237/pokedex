import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pokedex/configs/constants.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/widgets/custom_stack.dart';

class PokemonDetails extends StatefulWidget {
  const PokemonDetails({super.key, required this.pokemon, required this.color});
  final Pokemon pokemon;
  final Color color;
  @override
  State<PokemonDetails> createState() => _PokemonDetailsState();
}

class _PokemonDetailsState extends State<PokemonDetails>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            foregroundColor: CustomColor.white,
            backgroundColor: widget.color,
            pinned: true,
            expandedHeight: MediaQuery.of(context).size.height / 2.2,
            flexibleSpace: CustomStack(controller: _controller, widget: widget),
          ),
          SliverAppBar(
            automaticallyImplyLeading: false,
            backgroundColor: widget.color,
            pinned: true,
            expandedHeight: MediaQuery.of(context).size.height / 1.2,
            //elevation: 10,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                color: CustomColor.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
