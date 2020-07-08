import 'package:flutter/material.dart';
import 'input_page.dart';
import 'package:flutter/services.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF8E7596),
        scaffoldBackgroundColor: Color(0xFF4A195A),
      ),
      home: InputPage(),
    );
  }
}


