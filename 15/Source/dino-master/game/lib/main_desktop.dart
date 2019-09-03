import 'package:flutter/foundation.dart' show debugDefaultTargetPlatformOverride;
import 'package:flutter/material.dart' show TargetPlatform;

import './main.dart' as game;

main() {
 debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
 game.main();
}
