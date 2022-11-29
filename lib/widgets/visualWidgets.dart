import 'package:flutter/material.dart';

class Circle extends StatelessWidget {
  final Color color;
  const Circle({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Container(width: 16, height: 16, decoration: BoxDecoration(color: color, borderRadius: const BorderRadius.all(Radius.circular(8)))),
    );
  }
}
