import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_app/component/CodeWidget.dart';

import 'slides/live_demo.dart';
import 'slides/title.dart';
import 'slides/title_bullets.dart';
import 'slides/title_code.dart';

/**
 * All the fields in this file you can change to personalize your presentation
 */

/** YOUR NAME */
String author = "David Simões Batista";

/** THEME COLORS */
Color dartColorsBg = const Color.fromRGBO(24, 48, 64, 1);
Color dartColorsPrim = const Color.fromRGBO(48, 176, 255, 1);
Color dartColorsSec = const Color.fromRGBO(8, 92, 160, 1);



/** YOUR SLIDES */

List<Widget> slides = [
  /** TITLE PAGE */
  TitleAndCode(
    page: 1,
    title: flutterTitle(),
    subtitle: flutterSubTitle(),
    code: firstPageSampleCode,
    author: author,
  ),
  /** AGENDA */
  TitleAndBullets(
      title: const Text("Agenda",
        style: TextStyle(
            color: Colors.white,
            fontSize: 96
        ),
      ),
      bullets: const [
        "What is Dart?",
        "Why choose Dart?",
        "Dart Features",
        "Dart Syntax",
        "Live Demo"
      ],
      bulletSize: 64,
      image: Image.asset("/images/agenda.png"),
      author: author,
      page: 2
  ),
  /** WHAT IS DART */
  TitleAndBullets(
    page: 3,
    title: const Text("What is Dart?",
      style: TextStyle(
          color: Colors.white,
          fontSize: 96
      ),
    ),
    bullets: const [
      "Developer-friendly language",
      "Object Oriented",
      "Developed by Google",
      "Launched in 2011",
      "Not exclusively used in Flutter",
      "Syntax Similar to JavaScript, Java and C++",
    ],
    image: SvgPicture.asset("/svg/dart_white.svg"),
    author: author,
  ),
  /** WHY CHOOSE DART */
  TitleAndBullets(
    page: 4,
    title: const Text("Why choose Dart?",
      style: TextStyle(
          color: Colors.white,
          fontSize: 96
      ),
    ),
    bullets: const [
      "Flutter", //Flutter is a great Cross platform development framework
      "Compiles to native code", //So it's faster
      "Doesn't use native components", //So it always looks the same
      "Targets various environments", //Can both run on web, server, or any mobile device thanks to flutter
      "Comfortable and fast development process", //It was built with the developer in mind, trying to make the process of developing as easy as possible, while maintaining max speed
      "Great tooling", //Again with the developer in mind, there are great tools to help develop
      "Compilers are quick and reliable", //
      "Direct browser support", // thanks to built in dart2js
      "Strong developer community",
    ],
    image: CodeWidget(
      width: 400,
      height: 512,
      enabled: false,
      code: syntaxComparison,
    ),
    author: author,
  ),
  TitleAndBullets(
      title: const Text("Features",
        style: TextStyle(
            color: Colors.white,
            fontSize: 96
        ),
      ),
      bullets: const[
        "Open Source",
        "Platform Independent",
        "Object-Oriented",
        "Concurrency",
        "Extensive Libraries", //pub
        "Flexible Compilation",
        "Type Safe",
      ],
      bulletSize: 52,
      image: const SizedBox(),
      author: author,
      page: 5
  ),
  TitleAndSub(
    title: const Text("Syntax",
      style: TextStyle(
          color: Colors.white,
          fontSize: 96
      ),
    ),
    author: author,
    page: 6,
  ),
  TitleAndCode(
    title: const Text("Basic\nOperations",
      style: TextStyle(
        color: Colors.white,
        fontSize: 96
      ),
    ),
    subtitle: Text(""),
    code: basicOperations,
    author: author,
    page: 7,
    enabled: true
  ),
  LiveDemo(author: author, page: 8),
];



/** Personalized widgets */

Widget flutterTitle(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: const [
      FlutterLogo(size: 92,),
      Text("Flutter & Dart",
        style: TextStyle(
          fontSize: 96,
          color: Colors.white,
        ),
      ),
       Spacer()
    ],
  );
}

Widget flutterSubTitle(){
  return Row(
    children: const [
      SizedBox(width: 96,),
      SizedBox(
        width: 512,
        child: Text("A technical view of flutter and its programming language",
          style: TextStyle(
            color: Colors.white,
            fontSize: 32,
          ),
        ),
      ),
      Spacer()
    ],
  );
}

/** Other Variables Strings*/

String firstPageSampleCode = '''
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
  ''';

String syntaxComparison = '''
//Dart
    class Segment {
      int links = 4;
      toString() => "I have Slinks links".
    }
    
//Kotlin
    class Seament {
      var links: Int = 4
      override fun toString()= "I have Slinks links"
    }
    
//Swift
    class Segment: CustomStringConvertible {
      var links: Int = 4
      public var description: String {
        return "I have \\(links) links"
      }
    }

//TypeScript
    class Segment {
      links: number = 4
      public toString = () : string => { 
        return 'I have S‹this links} links");
      };
    }
    
// Transcribed from dart.dev - https://dart.dev/assets/dash/svg/1-3%20familiar%20syntax.svg
''';

String basicOperations = '''
  int a = 10;
''';
