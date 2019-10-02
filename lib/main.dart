import 'package:flutter/material.dart';
import 'package:hexClock/hexClock.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return PageBG();
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        PageBG(),
        SimpleClock(),
      ],
    );
  }
}
