import 'package:accountant_calendar/pages/main_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

int? selectedMonthIndex;

String? selectedMonth;

DateTime year = DateTime.now();

String mainText = 'Test';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Accountant Calendar',
      theme: ThemeData(
          primarySwatch: MaterialColor(
        const Color.fromRGBO(217, 4, 41, 1).value,
        const <int, Color>{
          50: Color.fromRGBO(217, 4, 41, 0.1),
          100: Color.fromRGBO(217, 4, 41, 0.2),
          200: Color.fromRGBO(217, 4, 41, 0.3),
          300: Color.fromRGBO(217, 4, 41, 0.4),
          400: Color.fromRGBO(217, 4, 41, 0.5),
          500: Color.fromRGBO(217, 4, 41, 0.6),
          600: Color.fromRGBO(217, 4, 41, 0.7),
          700: Color.fromRGBO(217, 4, 41, 0.8),
          800: Color.fromRGBO(217, 4, 41, 0.9),
          900: Color.fromRGBO(217, 4, 41, 1),
        },
      )),
      home: MainPage(),
    );
  }
}
