import 'dart:async';
import 'package:flutter/material.dart';

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

// https://stackoverflow.com/questions/50081213/how-do-i-use-hexadecimal-color-strings-in-flutter/53905427#53905427
class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

class PageBG extends StatefulWidget {
  _PageBGState createState() => _PageBGState();
}

class _PageBGState extends State<PageBG> {
  String _now;
  Timer _everySecond;

  @override
  void initState() {
    super.initState();
    _now = _timeToString(DateTime.now());
    _everySecond = Timer.periodic(Duration(seconds: 5), (Timer t) {
      if (!mounted) return;
      setState(() {
        _now = _timeToString(DateTime.now());
      });
    });
  }

  String _timeToString(DateTime now) {
    String timeString =
        "${now.hour.toString().padLeft(2, '0')}${now.minute.toString().padLeft(2, '0')}${now.second.toString().padLeft(2, '0')}";
    return timeString;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      color: HexColor(_now),
      duration: Duration(seconds: 5),
      curve: Curves.decelerate,
    );
  }
}

class SimpleClock extends StatefulWidget {
  _SimpleClockState createState() => _SimpleClockState();
}

class _SimpleClockState extends State<SimpleClock> {
  String _now;
  Timer _everySecond;

  @override
  void initState() {
    super.initState();
    _now = _timeToString(DateTime.now());
    _everySecond = Timer.periodic(Duration(seconds: 1), (Timer t) {
      if (!mounted) return;
      setState(() {
        _now = _timeToString(DateTime.now());
      });
    });
  }

  String _timeToString(DateTime now) {
    String timeString =
        "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}";
    return timeString;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          print("Tap");
        },
        child: Container(
          padding: EdgeInsets.all(50),
          child: Text(
            _now,
            textDirection: TextDirection.ltr,
            style: TextStyle(
              fontSize: 24,
              fontFamily: "Helvetica",
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ),
    );
  }
}
