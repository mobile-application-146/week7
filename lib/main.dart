import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen App',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

// First Screen - Splash
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("My App With Gestures"),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 25),
        backgroundColor: const Color.fromARGB(255, 63, 72, 77),
      ),
      backgroundColor: const Color.fromARGB(255, 67, 137, 193),
      body: Center(
        child: GestureDetector(
          onDoubleTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondScreen()),
            );
          },
          child: Image.asset('images/button.jpeg', width: 150, height: 150),
        ),
      ),
    );
  }
}

// Second Screen - Tabs with info
class SecondScreen extends StatelessWidget {
  final List<Tab> tabs = [
    Tab(icon: Icon(Icons.person), text: "About Me"),
    Tab(icon: Icon(Icons.location_city), text: "Hometown"),
    Tab(icon: Icon(Icons.school), text: "Student Life"),
  ];

  final List<String> tabTexts = [
    "I am a Flutter Developer and student.",
    "My hometown is Rawalpindi.",
    "Studying at Bahria University.",
  ];

  SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 20, 163, 94),
          title: Text("Amber Ali Shah"),
          bottom: TabBar(tabs: tabs),
        ),
        body: TabBarView(
          children: List.generate(tabs.length, (index) {
            return Center(
              child: GestureDetector(
                onLongPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ThirdScreen(index: index),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    tabTexts[index],
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

// Third Screen - Brief -> Detailed info
class ThirdScreen extends StatelessWidget {
  final int index;
  ThirdScreen({super.key, required this.index});

  final List<String> detailedTexts = [
    "I am a passionate competitive programmer. I love solving problems in c++.",
    "Rawalpindi is rich in history, food, and culture.",
    "At Bahria University, I've grown academically and socially.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("More Info"),
        backgroundColor: const Color.fromARGB(255, 136, 179, 72),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            detailedTexts[index],
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
