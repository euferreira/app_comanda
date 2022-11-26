import 'package:flutter/material.dart';

import 'app.colors.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    appBarTheme: const  AppBarTheme(
      actionsIconTheme: IconThemeData(color: AppColors.light100),
      backgroundColor: AppColors.blue950,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: AppColors.light100,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        fontFamily: "Roboto Condensed",
      ),
    ),
    scaffoldBackgroundColor: AppColors.light100,
    textTheme: const TextTheme(
      labelLarge: TextStyle(
        fontWeight: FontWeight.w600,
      ),
    ),
    fontFamily: "Roboto Condensed",
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: const TextStyle(
        color: AppColors.blue950,
        fontWeight: FontWeight.w600,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: AppColors.blue950,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: AppColors.blue950,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: AppColors.blue950,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: AppColors.red950,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: AppColors.red950,
        ),
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData.dark(useMaterial3: true);
}