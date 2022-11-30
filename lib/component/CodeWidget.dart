import 'package:flutter/material.dart';
import 'package:code_text_field/code_text_field.dart';

import 'package:highlight/languages/dart.dart';

import '../widgets/visualWidgets.dart';


class CodeWidget extends StatelessWidget {
  final String code;
  final double width;
  final double height;
  final bool enabled;

  const CodeWidget({Key? key, required this.code, required this.width, required this.height, required this.enabled}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white,width: 0),
          borderRadius: BorderRadius.all(Radius.circular(16)),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(5, 5)
            )
          ]
      ),
      child: Column(
        children: [
          Container(
            height: 32,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Row(
              children: const [
                SizedBox(width: 4),
                Circle(color: Colors.red,size: 16, padding: 4,),
                Circle(color: Colors.yellow,size: 16, padding: 4,),
                Circle(color: Colors.green,size: 16, padding: 4,),
                Spacer(),
              ],
            ),
          ),
          Container(
            height: height - 32,
            width: width,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: SingleChildScrollView(
              child: CodeField(
                decoration: const BoxDecoration(),
                controller: CodeController(
                  text: code,
                  language: dart,
                ),
                textStyle: TextStyle(
                    fontFamily: 'SourceCode',
                    color: enabled ? Colors.white : Colors.white.withOpacity(0.7)
                ),
                enabled: enabled,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

