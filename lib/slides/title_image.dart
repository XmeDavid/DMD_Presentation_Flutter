

import 'package:flutter/material.dart';
import 'package:my_app/component/CodeWidget.dart';
import 'package:my_app/values.dart';

import '../widgets/visualWidgets.dart';

class TitleAndImage extends StatelessWidget {
  final Widget title;
  final Widget subtitle;
  final Widget body;
  final Widget image;
  final String author;
  final int page;
  const TitleAndImage({Key? key, required this.title, required this.subtitle, this.body = const Text(""), required this.image, required this.author, required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: dartColorsBg,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Circle(
                    size: 32,
                    color: dartColorsPrim,
                    text: "$page",
                  ),
                ),
                Text(author,
                  style: const TextStyle(
                      color: Colors.white
                  ),
                ),
                const Spacer()
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                SizedBox(width: MediaQuery.of(context).size.width * 0.02,),
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      title,
                      subtitle,
                      body,
                      SizedBox(height: 64,),
                    ],
                  ),
                ),
                Expanded(
                  child: Center(
                    child: image
                  )
                ),
              ],
            ),
          ),
          SizedBox(height: 32,)
        ],
      ),
    );
  }
}