

import 'package:flutter/material.dart';

import '../values.dart';
import '../widgets/visualWidgets.dart';

class TitleAndSub extends StatelessWidget {
  final Widget title;
  final Widget subtitle;
  final String author;
  final int page;

  const TitleAndSub({Key? key, required this.title, this.subtitle = const Text(""), required this.author, required this.page}) : super(key: key);

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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                title,
                subtitle,
                const SizedBox(height: 128,),
              ],
            )
          ),
          SizedBox(height: 32,)
        ],
      ),
    );
  }
}
