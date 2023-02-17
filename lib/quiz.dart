import 'package:flutter/material.dart';
import 'subjectButton.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter App",
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.cyan,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Class quiz"),
          backgroundColor: Colors.white12,
          iconTheme: const IconThemeData(color: Colors.red),
          titleTextStyle: const TextStyle(color: Colors.black54, fontSize: 25)
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.black54,
        // decoration: const BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage("assets/images/homePage.jpg"),
            // fit: BoxFit.cover,
          // ),
        // ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const <Widget>[
            SubjectButton(subject: "Math", imagePath: "assets/images/math.jpg"),
            SubjectButton(subject: "Programming", imagePath: "assets/images/programming.jpg"),
            SubjectButton(subject: "Physics", imagePath: "assets/images/physics.jpg"),
          ],
        ),
      ),
    );
  }
}


