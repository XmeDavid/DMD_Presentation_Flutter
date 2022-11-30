import 'package:flutter/material.dart';


class Circle extends StatelessWidget {
  final Color color;
  final double size;
  final String text;
  final double padding;
  final bool shadow;
  const Circle({Key? key, required this.color, required this.size, this.text = "", this.padding = 0, this.shadow = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(size/2)),
            color: color,
            boxShadow: shadow ? [
              BoxShadow(
                  color: color,
                  spreadRadius: size/8,
                  blurRadius: size/2,
              )
            ] : null
        ),
        width: size,
        height: size,
        child: Center(
            child: Text(text,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold
              ),
            )
        ),
      ),
    );
  }
}
