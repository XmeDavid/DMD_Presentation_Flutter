

import 'package:flutter/material.dart';

import '../values.dart';
import '../widgets/visualWidgets.dart';

class TitleAndBullets extends StatelessWidget {
  final Widget title;
  final List<String> bullets;
  final double bulletSize;
  final Widget image;
  final String author;
  final int page;

  const TitleAndBullets({Key? key, required this.title, required this.bullets, this.bulletSize = 48, required this.image, required this.author, required this.page}) : super(key: key);

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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 64,
                    top: 16,
                    bottom: 32
                  ),
                  child: title,
                ),
                const SizedBox(height: 64,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.7,
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: ListView.builder(
                        itemCount: bullets.length,
                        itemBuilder: (BuildContext context, int index){
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const SizedBox(width: 128,),
                                Circle(color: Colors.white, size: bulletSize/4),
                                const SizedBox(width: 8,),
                                Text(bullets[index],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: bulletSize,
                                  ),
                                )
                              ],
                            ),
                          );
                        }
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(MediaQuery.of(context).size.width * 0.2)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  spreadRadius: 32,
                                  blurRadius: 64,
                              )
                            ]
                          ),
                          //width: MediaQuery.of(context).size.width * 0.4,
                          child: image
                        ),
                      ),
                    )
                  ],
                ),
              ],
            )
          ),
          const SizedBox(height: 32,)
        ],
      ),
    );
  }
}
