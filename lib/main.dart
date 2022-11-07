import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Whack-a-Pumpkin',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.orange,
      ),
      home: const MyHomePage(title: 'Whack-a-Pumpkin'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List visibility = [
    true,
    false,
    false,
    false,
    false,
    true,
    true,
    false,
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orange[100], //background color of scaffold
        appBar: AppBar(
          title: Text(winnerwinneryaygodhelp()), //title of app
          backgroundColor: Colors.redAccent, //background color of app bar
        ),
        body: Container(
            child: Table(
          border: const TableBorder(
            horizontalInside: BorderSide(color: Colors.black),
            verticalInside: BorderSide(color: Colors.black),
          ),
          children: <TableRow>[
            TableRow(children: <Widget>[
              randomVisibility(0),
              randomVisibility(1),
              randomVisibility(2),
              randomVisibility(3),
            ]),
            TableRow(children: <Widget>[
              randomVisibility(4),
              randomVisibility(5),
              randomVisibility(6),
              randomVisibility(7),
            ]),
            TableRow(children: <Widget>[
              randomVisibility(8),
              randomVisibility(9),
              randomVisibility(10),
              randomVisibility(11),
            ]),
            TableRow(children: <Widget>[
              randomVisibility(12),
              randomVisibility(13),
              randomVisibility(14),
              randomVisibility(15),
            ]),
          ],
        )));
  }

  Widget randomVisibility(int place) {
    Random ran = Random();
    return GestureDetector(
        onTap: () {
          setState(() {
            if (visibility[place] == true) {
              int random = ran.nextInt(16);
              while (visibility[random] != false) {
                random = ran.nextInt(16);
              }
              _counter++;
              visibility[place] = false;
              visibility[random] = true;
            }
          });
        },
        child: Visibility(
            visible: visibility[place],
            child: Image.asset('assets/pumpkin.jpeg',
                height: 240, fit: BoxFit.fitWidth)));
  }

  String winnerwinneryaygodhelp() {
    if (_counter >= 10) {
      return ("Whack-a-Mole: Happy Halloween!");
    }
    return ("Whack-a-Mole: $_counter");
  }
}
