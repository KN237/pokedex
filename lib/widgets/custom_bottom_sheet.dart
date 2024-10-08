import 'package:flutter/material.dart';
import 'package:pokedex/configs/constants.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/providers/pokemons_provider.dart';
import 'package:pokedex/screens/pokemon_details.dart';
import 'package:provider/provider.dart';

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({super.key});

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool isFocused = false;
  bool isLoading = false;
  String searchText = '';
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        width: double.infinity,
        height: 200,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: CustomColor.white,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Column(
          children: [
            Container(
              width: 70,
              height: 3,
              margin: const EdgeInsets.only(top: 10, bottom: 20),
              decoration: BoxDecoration(
                color: CustomColor.grey.withOpacity(0.1),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: 50,
                      child: TextField(
                        keyboardType: TextInputType.text,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: CustomColor.grey,
                            ),
                        onChanged: (value) {
                          setState(() {
                            searchText = value;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: 'Search for Pokemon name...',
                          hintStyle:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: CustomColor.grey.withOpacity(0.8),
                                  ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide.none),
                          filled: true,
                          fillColor: CustomColor.grey.withOpacity(0.15),
                          prefixIcon: const Icon(Icons.search),
                        ),
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          setState(() {
                            isFocused = true;
                          });
                          _animationController.forward();
                          FocusScope.of(context).requestFocus();
                        },
                      )),
                ),
                if (isFocused)
                  SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(1, 0),
                      end: const Offset(0, 0),
                    ).animate(
                      CurvedAnimation(
                          parent: _animationController,
                          curve: Curves.decelerate),
                    ),
                    child: InkWell(
                      onTap: () async {
                        setState(() {
                          isLoading = true;
                        });
                        await Future.delayed(
                          const Duration(seconds: 1),
                        );
                        setState(() {
                          isLoading = false;
                        });
                        bool isFound =
                            context.read<PokemonsProvider>().pokemon.any((elt) {
                          return elt.name!.toLowerCase().trim() ==
                              searchText.toLowerCase().trim();
                        });
                        Navigator.of(context).pop();
                        if (isFound == true) {
                          Pokemon temp = context
                              .read<PokemonsProvider>()
                              .pokemon
                              .firstWhere((elt) {
                            return elt.name!.toLowerCase().trim() ==
                                searchText.toLowerCase().trim();
                          });
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => PokemonDetails(
                                pokemon: temp,
                                color: CustomColor.getBoxColor(
                                    temp.apiTypes!.last.name!),
                              ),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).clearSnackBars();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: CustomColor.lilac,
                              content:
                                  Text('An error occured. Try again later !'),
                            ),
                          );
                        }
                      },
                      child: Container(
                        width: 45,
                        height: 45,
                        margin: const EdgeInsets.only(left: 10, top: 3),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: CustomColor.lilac),
                        child: Center(
                          child: isLoading == false
                              ? const Icon(
                                  Icons.send,
                                  color: CustomColor.white,
                                  size: 20,
                                )
                              : const SizedBox(
                                  width: 25,
                                  height: 25,
                                  child: CircularProgressIndicator(
                                    color: CustomColor.white,
                                    strokeWidth: 2,
                                  )),
                        ),
                      ),
                    ),
                  )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
