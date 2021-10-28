import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'currentWeather.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Wrather application',
        theme: ThemeData(
          primarySwatch: Colors.gry,
        ),
        home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(Text: 'Weather Application'),
      body: CurrentWeatherPage(),
    );
  }
}
