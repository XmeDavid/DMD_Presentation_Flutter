import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My App",
      home: HomePage(),
      theme: ThemeData(
        backgroundColor: Colors.black,
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int slideIndex = 0;
  List<Widget> slides = [
    TitleScreen(
      page: 1,
      title: "Flutter",
      author: "David Simões Batista",
    ),
  ];

  var floatingIcon = Icons.navigate_next;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: Center(
        child: slides[slideIndex],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            if(floatingIcon == Icons.restart_alt){
              slideIndex = 0;
              floatingIcon = Icons.navigate_next;
              return;
            }
            slideIndex < slides.length-1 ? slideIndex++ : null;
            slideIndex == slides.length-1 ? (floatingIcon = Icons.restart_alt) : null;
          });
        },
        child: Icon(floatingIcon),
      ),
    );
  }
}


class TitleScreen extends StatelessWidget {
  final String title;
  final String author;
  final int page;
  const TitleScreen({Key? key, required this.title, required this.author, required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(30, 40, 50, 1),
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
                    color: Colors.blue,
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
                Expanded(
                    child: Center(
                      child: Text("$title\n\n\n",
                        style: TextStyle(
                          fontSize: 72,
                          color: Colors.white,
                        ),
                      ),
                    )
                ),
                Expanded(child: Center()),
              ],
            ),
          )
        ],
      ),
    );
  }
}


class Circle extends StatelessWidget {
  final Color color;
  final double size;
  final String text;
  const Circle({Key? key, required this.color, required this.size, this.text = ""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(size/2)),
        color: color
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
    );
  }
}
