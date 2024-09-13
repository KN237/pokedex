import 'package:flutter/material.dart';

class CustomColor {
  static const black = Color(0XFF272727);
  static const white = Color(0XFFFFFFFF);
  static const grey = Color(0XFF919191);
  static const lightGrey = Color(0XFFE7E7E8);
  static const semiGrey = Color(0XFFF4F5F4);
  static const red = Color(0XFFFA6555);
  static const green = Color(0XFF41D168);
  static const blue = Color(0XFF0055D4);
  static const lilac = Color(0XFF6C79DB);
  static Color getBoxColor(String pokemon) {
    switch (pokemon) {
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
}
