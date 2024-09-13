import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pokedex/configs/constants.dart';
import 'package:pokedex/models/pokemon.dart';

class CustomStack extends StatefulWidget {
  const CustomStack({
    super.key,
    required AnimationController controller,
    required this.pokemon,
    required this.isExpanded,
    required this.isImageExpanded,
  }) : _controller = controller;

  final AnimationController _controller;
  final Pokemon pokemon;
  final bool isExpanded;
  final bool isImageExpanded;

  @override
  State<CustomStack> createState() => _CustomStackState();
}

class _CustomStackState extends State<CustomStack>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: widget.pokemon.name! + widget.pokemon.image!,
      child: FadeTransition(
        opacity: Tween<double>(begin: 0, end: 1).animate(_animationController),
        child: Stack(
          alignment: Alignment.center,
          children: [
            if (widget.isExpanded)
              Positioned(
                top: -10,
                right: -40,
                child: RotationTransition(
                  turns: Tween<double>(begin: 0, end: 1)
                      .animate(widget._controller),
                  child: Image.asset(
                    'assets/images/pokeball.png',
                    color: CustomColor.white.withOpacity(0.1),
                    width: 160,
                  ),
                ),
              ),
            if (!widget.isExpanded)
              Positioned(
                bottom: -20,
                child: RotationTransition(
                  turns: Tween<double>(begin: 0, end: 1)
                      .animate(widget._controller),
                  child: Image.asset(
                    'assets/images/pokeball.png',
                    color: CustomColor.white.withOpacity(0.1),
                    width: 230,
                  ),
                ),
              ),
            if (!widget.isImageExpanded)
              Positioned(
                bottom: -12,
                child: Image.network(
                  widget.pokemon.image!,
                  width: 200,
                ),
              ),
            Positioned(
              left: -80,
              top: -80,
              child: Transform.rotate(
                angle: pi / 3,
                child: Container(
                  width: 180,
                  height: 140,
                  decoration: BoxDecoration(
                    color: CustomColor.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            if (!widget.isExpanded)
              Positioned(
                right: 100,
                top: 0,
                child: Column(
                  children: [
                    for (var i = 0; i < 5; i++)
                      Row(
                        children: [
                          for (var j = 0; j < 5; j++)
                            Container(
                              width: 7,
                              height: 7,
                              margin: const EdgeInsets.only(right: 6, top: 6),
                              decoration: BoxDecoration(
                                color: CustomColor.white.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(200),
                              ),
                            ),
                        ],
                      ),
                  ],
                ),
              ),
            if (!widget.isExpanded)
              Positioned(
                top: 90,
                left: 20,
                child: Text(
                  widget.pokemon.name!,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: CustomColor.white, fontSize: 25),
                ),
              ),
            if (!widget.isExpanded)
              Positioned(
                top: 90,
                right: 20,
                child: Text(
                  '#00${widget.pokemon.id}',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: CustomColor.white, fontSize: 14),
                ),
              ),
            if (!widget.isExpanded)
              Positioned(
                top: 135,
                left: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    for (ApiType apiType in widget.pokemon.apiTypes!)
                      Container(
                        height: 20,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: CustomColor.white.withOpacity(0.1),
                        ),
                        child: Center(
                          child: Text(
                            apiType.name!,
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(
                                    color: CustomColor.white, fontSize: 12),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            if (!widget.isExpanded)
              Positioned(
                top: 135,
                right: 20,
                child: Text(
                  'Pokémon ${widget.pokemon.apiTypes!.last.name}',
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .copyWith(color: CustomColor.white, fontSize: 12),
                ),
              )
          ],
        ),
      ),
    );
  }
}
