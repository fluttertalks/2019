import 'package:flutter/material.dart';
import 'package:flutter_talks/theme/type_system.dart';

import 'colors.dart';

final ThemeData appTheme = buildTheme();

ThemeData buildTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(

    accentColor: kPrimary,
    accentColorBrightness: Brightness.dark,
    backgroundColor: kBackground,
    brightness: Brightness.dark,
    colorScheme: ColorScheme(
      background: kBackground,
      primary: kPrimary,
      primaryVariant: kPrimaryDark,
      onPrimary: kWhite,
      secondary: kText,
      secondaryVariant: kTextDark,
      surface: kWhite,
      onSecondary: kWhite,
      onSurface: kText,
      onBackground: kText,
      error: Colors.red,
      onError: kWhite,
      brightness: Brightness.dark,
    ),
    cursorColor: kWhite,
    focusColor: kWhite70,
    highlightColor: kPrimary12,
    hintColor: kWhite50,
    indicatorColor: kWhite,
    primaryColor: kPrimary,
    primaryColorBrightness: Brightness.dark,
    primaryColorDark: kPrimaryDark,
    primaryColorLight: kPrimary12,
    selectedRowColor: kPrimary,
    scaffoldBackgroundColor: kBackground,
    splashColor: kPrimary12,
    textSelectionColor: kTextDark,
    textSelectionHandleColor: kTextDark,
    toggleableActiveColor: kPrimary,
    unselectedWidgetColor: kText38,

    // CONFIGURAÇÃO DOS CARDS
    cardTheme: CardTheme(
        elevation: 0,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            side: BorderSide(
                color: kDividerOnLight,
                width: 1,
                style: BorderStyle.solid
            )
        )
    ),

    // CONFIGURAÇÃO DOS CHIPS
    chipTheme: ChipThemeData(
      backgroundColor: kBackground,
      brightness: Brightness.light,
      labelStyle: TextStyle(color: kText60),
      disabledColor: kText12,
      labelPadding: EdgeInsets.only(left: 12, right: 12),
      selectedColor: kPrimary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        side: BorderSide(
            color: kDividerOnLight,
            width: 1,
            style: BorderStyle.solid
        ),
      ),
      padding: EdgeInsets.zero,
      secondaryLabelStyle: TextStyle(color: kWhite),
      secondarySelectedColor: kPrimary,
    ),

    // CONFIGURAÇÃO DOS BOTÕES
    buttonColor: kPrimary,
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(18))),
      colorScheme: ColorScheme(
          primary: kPrimary,
          primaryVariant: kPrimaryDark,
          secondary: kPrimary,
          secondaryVariant: kPrimaryDark,
          surface: kWhite,
          background: kBackground,
          error: Colors.red,
          onPrimary: kWhite,
          onSecondary: kWhite,
          onSurface: kText,
          onBackground: kText,
          onError: kWhite,
          brightness: Brightness.light
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: kPrimary,
      elevation: 0,
      focusElevation: 0,
      highlightElevation: 0,
      hoverElevation: 0,
    ),

    // CONFIGURAÇÃO DOS TEXTFIELDS
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(6), borderSide: BorderSide(color: kWhite50)),
      fillColor: kDividerOnDark,
      filled: true,
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(6), borderSide: BorderSide(color: kWhite)),
      focusColor: kWhite,
      helperStyle: TextStyle(color: kWhite70),
      hintStyle: TextStyle(color: kWhite50),
      labelStyle: TextStyle(color: kWhite70, fontWeight: FontWeight.normal),
    ),

    textTheme: buildTextTheme(base.textTheme),
    typography: Typography(
      platform: TargetPlatform.android,
      englishLike: Typography.englishLike2018,
      dense: Typography.dense2018,
      tall: Typography.tall2018,
    ),
  );
}