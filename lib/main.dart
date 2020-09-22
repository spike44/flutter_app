import 'package:flutter/material.dart';
import 'package:awesome_button/awesome_button.dart';
import 'package:flutter_app/incoming.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => MyHomePage(title: '신진 텍스 PDA'),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/incoming': (context) => incoming(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            AwesomeButton(
              blurRadius: 10.0,
              splashColor: Color.fromRGBO(255, 255, 255, .4),
              borderRadius: BorderRadius.circular(25.0),
              height: 75.0,
              width: 75.0,
              onTap: () {
                Navigator.pushNamed(context, '/incoming');
              },
              color: Colors.blueAccent,
              child: Text(
                "입고",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
            AwesomeButton(
              blurRadius: 10.0,
              splashColor: Color.fromRGBO(255, 255, 255, .4),
              borderRadius: BorderRadius.circular(25.0),
              height: 75.0,
              width: 75.0,
              onTap: () => print("tapped"),
              color: Colors.redAccent,
              child: Text(
                "출고",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
