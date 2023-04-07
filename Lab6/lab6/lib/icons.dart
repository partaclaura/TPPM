// ignore_for_file: library_private_types_in_public_api

import 'dart:async';
import 'package:flutter/material.dart';
import 'iconPaths.dart';

StatefulWidget pickIcon(String category) {
  print(category);
  if (category == "fruit") {
    return const FruitIcon();
  } else if (category == "drinks") {
    return const DrinksIcon();
  }
  return const DefaultIcon();
}

class FruitIcon extends StatefulWidget {
  const FruitIcon({super.key});

  @override
  _FruitIconState createState() => _FruitIconState();
}

class _FruitIconState extends State<FruitIcon> {
  int _colorIndex = 0;
  final List<Color> _colors = [
    Colors.yellow,
    Colors.green,
  ];

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 5), (timer) {
      setState(() {
        _colorIndex = (_colorIndex + 1) % _colors.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: FruitPainter(color: _colors[_colorIndex]),
      child: const SizedBox(
        width: 30,
        height: 30,
      ),
    );
  }
}

class FruitPainter extends CustomPainter {
  final Color color;

  FruitPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = color;
    Path path = fruitIcon(size);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(FruitPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}

// DEFAULT
class DefaultIcon extends StatefulWidget {
  const DefaultIcon({super.key});

  @override
  _DefaultIconState createState() => _DefaultIconState();
}

class _DefaultIconState extends State<DefaultIcon> {
  int _colorIndex = 0;
  final List<Color> _colors = [
    Colors.blue,
    Colors.purple,
  ];

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 5), (timer) {
      setState(() {
        _colorIndex = (_colorIndex + 1) % _colors.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DefaultPainter(color: _colors[_colorIndex]),
      child: const SizedBox(
        width: 30,
        height: 30,
      ),
    );
  }
}

class DefaultPainter extends CustomPainter {
  final Color color;

  DefaultPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    //IconData icon = Icons.local_florist;
    Paint paint = Paint()..color = color;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);
  }

  @override
  bool shouldRepaint(DefaultPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}

// DRINKS
class DrinksIcon extends StatefulWidget {
  const DrinksIcon({super.key});

  @override
  _DrinksIconState createState() => _DrinksIconState();
}

class _DrinksIconState extends State<DrinksIcon> {
  int _colorIndex = 0;
  final List<Color> _colors = [
    Colors.red,
    Colors.orange,
  ];

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 5), (timer) {
      setState(() {
        _colorIndex = (_colorIndex + 1) % _colors.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DrinksPainter(color: _colors[_colorIndex]),
      child: const SizedBox(
        width: 30,
        height: 30,
      ),
    );
  }
}

class DrinksPainter extends CustomPainter {
  final Color color;

  DrinksPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = color;
    canvas.drawPath(drinksIcon(size), paint);
  }

  @override
  bool shouldRepaint(DrinksPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}
