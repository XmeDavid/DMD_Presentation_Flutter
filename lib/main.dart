import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_app/slides/live_demo.dart';
import 'package:my_app/slides/title.dart';
import 'package:my_app/slides/title_bullets.dart';

import 'slides/title_code.dart';
import 'values.dart';

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
        floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: dartColorsPrim),
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




