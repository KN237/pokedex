import 'package:flutter/material.dart';
import 'package:pokedex/configs/constants.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/widgets/custom_stack.dart';
import 'package:pokedex/widgets/custom_tab_bar.dart';

class PokemonDetails extends StatefulWidget {
  const PokemonDetails({super.key, required this.pokemon, required this.color});
  final Pokemon pokemon;
  final Color color;
  @override
  State<PokemonDetails> createState() => _PokemonDetailsState();
}

class _PokemonDetailsState extends State<PokemonDetails>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late ScrollController _scrollController;
  late TabController _tabController;
  bool isExpanded = false;
  bool isImageExpanded = false;

  @override
  void initState() {
    _scrollController = ScrollController();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _tabController = TabController(length: 4, vsync: this);
    _controller.repeat();
    _scrollController.addListener(loadState);

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  void loadState() {
    if (_scrollController.offset < 100) {
      setState(() {
        isExpanded = false;
      });
    } else {
      isExpanded = true;
    }

    if (_scrollController.offset < 50) {
      setState(() {
        isImageExpanded = false;
      });
    } else {
      isImageExpanded = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            foregroundColor: CustomColor.white,
            backgroundColor: widget.color,
            pinned: true,
            expandedHeight: MediaQuery.of(context).size.height / 2.2,
            centerTitle: true,
            title: isExpanded
                ? Text(
                    widget.pokemon.name!,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: CustomColor.white, fontSize: 25),
                  )
                : null,
            actions: [
              if (isExpanded)
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text(
                    '#00${widget.pokemon.id}',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: CustomColor.white, fontSize: 14),
                  ),
                )
            ],
            flexibleSpace: CustomStack(
              controller: _controller,
              pokemon: widget.pokemon,
              isExpanded: isExpanded,
              isImageExpanded: isImageExpanded,
            ),
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
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: CustomTabBar(
                  tabController: _tabController, pokemon: widget.pokemon),
            ),
          ),
        ],
      ),
    );
  }
}
