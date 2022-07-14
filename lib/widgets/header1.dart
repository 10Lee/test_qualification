import 'package:flutter/material.dart';

class Header1 extends StatelessWidget {
  final String text;
  final Color color;

  const Header1({
    Key? key,
    required this.text,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "$text",
      style:
          TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: color),
    );
  }
}
