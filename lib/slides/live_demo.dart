

import 'package:flutter/material.dart';

import '../values.dart';
import '../widgets/visualWidgets.dart';

class LiveDemo extends StatelessWidget {
  final String author;
  final int page;

  const LiveDemo({Key? key, required this.author, required this.page}) : super(key: key);

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
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Live Demo",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 160
                      ),
                    ),
                  ),
                  SizedBox(width: 16,),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: LiveCircle(),
                  )
                ],
              ),
            )
          ),
          const SizedBox(height: 32,)
        ],
      ),
    );
  }
}
class LiveCircle extends StatefulWidget {
  const LiveCircle({super.key});

  @override
  LiveCircleState createState() => LiveCircleState();
}

class LiveCircleState extends State<LiveCircle> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animationController.repeat(reverse: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animationController,
      child: const Circle(
        color: Colors.red,
        size: 128,
        shadow: true,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}