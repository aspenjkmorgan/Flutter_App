import 'package:flutter/material.dart';
import 'about.dart';
import 'home.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Montana PM2.5 Map',
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(73,114,174,.9)
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    HomePage(),
    const AboutPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(),
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.white,
          backgroundColor: const Color.fromRGBO(73,114,174,.9),
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {_currentIndex = index;});
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.white),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.white,),
              label: 'About',
            ),
          ],
        ),
      ),
    ));
  }
}

// HOME PAGE
class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold), 'MT PM2.5 Map'),
        actions: <Widget>[
          IconButton(icon: Image.asset('assets/twitter.png'), onPressed: () {
            js.context.callMethod('open', ['https://twitter.com/pm25map_mt']);
          } ),
          IconButton(icon: Image.asset('assets/inbre.png'), onPressed: () {
            js.context.callMethod('open', ['https://inbre.montana.edu/']);
          })
        ],),
      body: HomeWidget(),
    );
  }
}

// ABOUT PAGE
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(style: TextStyle(fontSize: 40), 'Montana PM2.5 Concentration Map'),
        actions: <Widget>[
          IconButton(icon: Image.asset('assets/twitter.png'), onPressed: () {
            js.context.callMethod('open', ['https://twitter.com/pm25map_mt']);
          } ),
          IconButton(icon: Image.asset('assets/inbre.png'), onPressed: () {
            js.context.callMethod('open', ['https://inbre.montana.edu/']);
          })
        ],),
      body: const AboutWidget()
    );
  }
}