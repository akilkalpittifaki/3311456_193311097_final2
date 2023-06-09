import 'package:flutter/material.dart';

import 'fl_bar_chart_screen.dart';

/*
void main() {
  runApp(const Grafik());
}
*/

class Grafik extends StatelessWidget {
  const Grafik({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('En Sevilen Filozoflar Anketi'),
      ),
      body: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'FL Bar chart Example',
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
          primarySwatch: Colors.blue,
        ),
        home: BarChartWidget(),
      ),
    );
  }
}
