import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex/configs/constants.dart';

final lightTheme = ThemeData.light().copyWith(
  textTheme: GoogleFonts.interTextTheme().copyWith(
    titleLarge: const TextStyle(
        fontSize: 32, color: CustomColor.black, fontWeight: FontWeight.bold),
    bodyLarge: const TextStyle(
        fontSize: 18, color: CustomColor.black, fontWeight: FontWeight.normal),
    bodyMedium: const TextStyle(
        fontSize: 16, color: CustomColor.black, fontWeight: FontWeight.normal),
    bodySmall: const TextStyle(
        fontSize: 14, color: CustomColor.black, fontWeight: FontWeight.normal),
    labelSmall: const TextStyle(
        fontSize: 12, color: CustomColor.black, fontWeight: FontWeight.normal),
  ),
);
