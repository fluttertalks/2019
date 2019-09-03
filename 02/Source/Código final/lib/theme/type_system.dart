import 'package:flutter/material.dart';

import 'colors.dart';

TextTheme buildTextTheme(TextTheme base) {
  return base.copyWith(
    title: base.title.copyWith(
      fontWeight: FontWeight.bold,
      color: kText,
    ),
    button: base.button.copyWith(
      fontWeight: FontWeight.bold,
    ),
    body1: base.body1.copyWith(
      color: kText60,
    ),
    body2: base.body2.copyWith(
      color: kText60,
    ),
    caption: base.caption.copyWith(
      color: kText60,
    ),
  ).apply(
    fontFamily: 'Nunito',
  );
}