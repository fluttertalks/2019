import 'package:flutter/material.dart';

final ThemeData appTheme = buildTheme();

ThemeData buildTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    typography: Typography(
      platform: TargetPlatform.android,
      englishLike: Typography.englishLike2018,
      dense: Typography.dense2018,
      tall: Typography.tall2018,
    ),
  );
}