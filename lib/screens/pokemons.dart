import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pokedex/configs/constants.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/providers/pokemons_provider.dart';
import 'package:pokedex/widgets/custom_bottom_sheet.dart';
import 'package:pokedex/widgets/pokebox.dart';
import 'package:provider/provider.dart';

class PokemonScreen extends StatefulWidget {
  const PokemonScreen({super.key});

  @override
  State<PokemonScreen> createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationContrller;
  late ScrollController _scrollController;
  late Animation<double> _animation;
  bool isExpanded = false;
  @override
  void initState() {
    context.read<PokemonsProvider>().loadData();
    _animationContrller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _scrollController = ScrollController();
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationContrller, curve: Curves.easeInOut),
    );
    _scrollController.addListener(() {
      if (_scrollController.offset ==
          _scrollController.position.maxScrollExtent) {
        if (!context.read<PokemonsProvider>().isShadowLoading) {
          context.read<PokemonsProvider>().loadMoreData();
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationContrller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -50,
            right: -30,
            child: Image.asset(
              'assets/images/pokeball.png',
              color: CustomColor.black.withOpacity(0.1),
              width: 150,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 65, 10, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pokedex',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 20,
                ),
                context.watch<PokemonsProvider>().isLoading
                    ? SizedBox(
                        height: MediaQuery.of(context).size.height / 1.4,
                        child: Center(
                          child: LottieBuilder.asset(
                            'assets/images/loader.json',
                            width: 150,
                          ),
                        ),
                      )
                    : Expanded(
                        child: SingleChildScrollView(
                          controller: _scrollController,
                          child: Column(
                            children: [
                              GridView(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 08,
                                  crossAxisSpacing: 08,
                                  childAspectRatio: 1.5,
                                ),
                                padding: EdgeInsets.zero,
                                children: [
                                  for (Pokemon pokemon in context
                                      .watch<PokemonsProvider>()
                                      .pokemon)
                                    PokeBox(pokemon: pokemon),
                                ],
                              ),
                              if (context
                                  .watch<PokemonsProvider>()
                                  .isShadowLoading)
                                const Padding(
                                  padding: EdgeInsets.only(top: 10.0),
                                  child: Center(
                                    child: SizedBox(
                                      width: 30,
                                      height: 30,
                                      child: CircularProgressIndicator(),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionBubble(
        items: [
          Bubble(
            icon: Icons.search,
            iconColor: CustomColor.lilac,
            title: 'Search',
            titleStyle: Theme.of(context).textTheme.bodySmall!,
            bubbleColor: CustomColor.white,
            onPress: () {
              setState(() {
                isExpanded = false;
              });

              _animationContrller.reverse();
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) => const CustomBottomSheet(),
              );
            },
          ),
        ],
        onPress: () {
          if (_animationContrller.isCompleted) {
            _animationContrller.reverse();
          } else {
            _animationContrller.forward();
          }
          setState(() {
            isExpanded = !isExpanded;
          });
        },
        iconColor: CustomColor.white,
        iconData: isExpanded ? Icons.close : Icons.list,
        backGroundColor: CustomColor.lilac,
        animation: _animation,
      ),
    );
  }
}
