import 'package:flutter/material.dart';
import 'search.dart'; // import search box from here
import 'map.dart'; // import map from here

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});
  @override
  State<HomeWidget> createState() => _DrawerExampleState();
}

class _DrawerExampleState extends State<HomeWidget> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  void _openDrawer() {
    _scaffoldKey.currentState!.openDrawer();
  }
  void _closeDrawer() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body:
        Stack(
          alignment: Alignment.topRight,
          children: <Widget> [
            MapWidget(),
            Container(
              padding: const EdgeInsets.fromLTRB(0, 10, 10, 0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, 
                  foregroundColor: Colors.white),
              onPressed: _openDrawer, 
              child: const Text('Legend'))),
        ]
        ),
      drawer: Drawer(
          width: 250,
          backgroundColor: const Color.fromARGB(255, 176, 218, 227),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
                const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 30, 0, 0), 
                      child: SearchBarApp())],),
                const Padding(padding: EdgeInsets.only(top: 20), 
                    child: Column(children: [
                      DialogHealthy(),
                    DialogModerate(),
                    DialogUnhealthy1(),
                    DialogUnhealthy2(),
                    DialogVeryUnhealthy(),
                    DialogHazardous(),
                  ])),
                Column(
                  children: [
                    Padding(padding: const EdgeInsets.only(top: 50), 
                    child: ElevatedButton(
                      onPressed: _closeDrawer,
                      child: const Icon(Icons.close_outlined),
                    ),)
                  ]
                )
            ]
          )
        )
      );
  }
}

class DialogHealthy extends StatelessWidget {
  const DialogHealthy({super.key});
  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 113, 224, 117),
          minimumSize: const Size(200, 50)),
        onPressed: () => showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            surfaceTintColor: Colors.white,
            title: const Text('Healthy'),
            content: const Text('PM2.5 ug/m^3: 0-12.0'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Icon(Icons.close_sharp),
              ),
            ],
          ),
        ),
        child: const Text('Healthy'),
      );
    }
}

class DialogModerate extends StatelessWidget {
  const DialogModerate({super.key});
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 238, 243, 112),
        minimumSize: const Size(200, 50)),
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          surfaceTintColor: Colors.white,
          title: const Text('Moderate'),
          content: const Text('PM2.5 ug/m^3: 12.1-35.5'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Icon(Icons.close_sharp),
            ),
          ],
        ),
      ),
      child: const Text('Moderate'),
    );
  }
}

class DialogUnhealthy1 extends StatelessWidget {
  const DialogUnhealthy1({super.key});
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 229, 183, 59),
        minimumSize: Size(200, 50)),
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          surfaceTintColor: Colors.white,
          title: const Text('Unhealthy for certain groups'),
          content: const Text('PM2.5 ug/m^3: 35.51-55.5'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Icon(Icons.close_sharp),
            ),
          ],
        ),
      ),
      child: const Text('Unhealthy*'),
    );
  }
}

class DialogUnhealthy2 extends StatelessWidget {
  const DialogUnhealthy2({super.key});
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 240, 78, 78),
        minimumSize: Size(200, 50)),
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          surfaceTintColor: Colors.white,
          title: const Text('Unhealthy'),
          content: const Text('PM2.5 ug/m^3: 55.51-150.0'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Icon(Icons.close_sharp),
            ),
          ],
        ),
      ),
      child: const Text('Unhealthy'),
    );
  }
}

class DialogVeryUnhealthy extends StatelessWidget {
  const DialogVeryUnhealthy({super.key});
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 211, 136, 172),
        minimumSize: Size(200, 50)),
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          surfaceTintColor: Colors.white,
          title: const Text('Very Unhealthy'),
          content: const Text('PM2.5 ug/m^3: 150.1-200.0'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Icon(Icons.close_sharp),
            ),
          ],
        ),
      ),
      child: const Text('Very Unhealthy'),
    );
  }
}

class DialogHazardous extends StatelessWidget {
  const DialogHazardous({super.key});
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 160, 163, 160),
        minimumSize: Size(200, 50)),
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          surfaceTintColor: Colors.white,
          title: const Text('Hazardous'),
          content: const Text('PM2.5 ug/m^3: 200.1+'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Icon(Icons.close_sharp),
            ),
          ],
        ),
      ),
      child: const Text('Hazardous'),
    );
  }
}