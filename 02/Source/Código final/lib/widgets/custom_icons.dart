import 'package:flutter/widgets.dart';

class FlutterTalks {
  FlutterTalks._();

  static const _kFontFam = 'FlutterTalks';

  static const IconData home = const IconData(0xe800, fontFamily: _kFontFam);
  static const IconData search = const IconData(0xe801, fontFamily: _kFontFam);
  static const IconData heart = const IconData(0xe802, fontFamily: _kFontFam);
  static const IconData user = const IconData(0xe803, fontFamily: _kFontFam);
  static const IconData facebook = const IconData(0xf09a, fontFamily: _kFontFam);
  static const IconData plus_squared = const IconData(0xf0fe, fontFamily: _kFontFam);
  static const IconData whatsapp = const IconData(0xf232, fontFamily: _kFontFam);
}

class CustomIcon extends StatelessWidget {

  final IconData icon;
  final Color color;
  final double size;

  CustomIcon({@required this.icon, this.color, @required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      width: 24,
      child: Align(
        alignment: Alignment.center,
        child: Icon(icon, color: color != null ? color : null, size: size),
      ),
    );
  }
}
