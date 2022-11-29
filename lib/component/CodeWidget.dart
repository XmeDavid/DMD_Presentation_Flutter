import 'package:flutter/material.dart';
import 'package:code_text_field/code_text_field.dart';

import 'package:highlight/languages/dart.dart';

import '../widgets/visualWidgets.dart';


class CodeWidget extends StatelessWidget {
  final String code;
  final double width;
  final double height;

  const CodeWidget({Key? key, required this.code, required this.width, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: width,
      child: Column(
        children: [
          Container(
            height: 32,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(30, 40, 50, 1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Row(
              children: const [
                SizedBox(width: 4),
                Circle(color: Colors.red),
                Circle(color: Colors.yellow),
                Circle(color: Colors.green),
                Spacer(),
              ],
            ),
          ),
          Container(
            height: height - 32,
            width: width,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(10, 20, 30, 1),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: CodeField(
              decoration: const BoxDecoration(),
              controller: CodeController(
                text: code,
                language: dart,
              ),
              textStyle: TextStyle(fontFamily: 'SourceCode'),
              enabled: true,
            ),
          ),
        ],
      ),
    );
  }
}

