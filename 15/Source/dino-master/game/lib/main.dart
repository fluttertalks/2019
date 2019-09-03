import 'package:flame/components/animation_component.dart';
import 'package:flame/components/component.dart';
import 'package:flame/components/resizable.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future main() async {
  await Flame.util.setOrientation(DeviceOrientation.landscapeLeft);
  Size size = await Flame.util.initialDimensions();

  MyGame game = MyGame(size);
  runApp(game.widget);
  Flame.util.addGestureRecognizer(TapGestureRecognizer()..onTap = () => game.tap());
}

class Dino extends AnimationComponent {
  static const G = 600.0;
  static const J = -400.0;

  static const S = 3.0;
  static const W = 15.0;
  static const H = 17.0;

  double initialY;
  double ySpeed = 0.0;

  Dino(Size size) : super.sequenced(S * W, S * H, 'dino.png', 6, textureWidth: W, textureHeight: H) {
    x = size.width / 3;
    y = initialY = size.height / 2 - this.height;
  }

  @override
  void update(double t) {
    if (ySpeed != 0.0) {
      y += ySpeed * t - G * t  * t / 2;
      ySpeed += G * t;
    }
    if (y >= initialY) {
      y = initialY;
      ySpeed = 0.0;
    }
    super.update(t);
  }

  void jump() {
    if (ySpeed == 0.0) {
      ySpeed = J;
    }
  }

  @override
  int priority() => 2;
}

class Bg extends Component with Resizable {

  @override
  void render(Canvas c) {
    c.drawRect(Rect.fromLTWH(0.0, 0.0, size.width, size.height / 2), Paint()..color = Color(0xFF5B6EE1));
    c.drawRect(Rect.fromLTWH(0.0, size.height / 2, size.width, size.height), Paint()..color = Color(0xFF6ABE30));
  }

  @override
  void update(double t) {}

  @override
  int priority() => 1;
}

class MyGame extends BaseGame {
  Dino dino;

  MyGame(Size size) {
    this.size = size;
    add(dino = Dino(size));
    add(Bg());
  }

  void tap() {
    dino.jump();
  }
}
