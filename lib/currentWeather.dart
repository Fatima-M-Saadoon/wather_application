import 'package:flutter/material.dart';
import 'package:tester/weather.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CurrentWeatherPage extends StatefulWidget {
  @override
  _CurrentWeatherPageState createState() => _CurrentWeatherPageState();
}

class _CurrentWeatherPageState extends State<CurrentWeatherPage> {
    Weather _weather;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot ?= null) {
            this._weather = snapshot.data;
            if (this._weather == null) {
              return Text("Error getting weather");
            } else {
              return weatherBox(_weather);
            }
          } else {
            return CircularProgressIndicator();
          }
        },
        future: getCurrentWeather(),
      ),
    ));
  }
}

Widget weatherBox(Weather _weather) {
  return Column(mainAxisSize: MainAxisSize.min,
  decoration: BoxDecoration(
          image: DecorationImage(
            
         
     NetworkImage:Image.network('https://images.pexels.com/photos/209831/pexels-photo-209831.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500')
       fit: BoxFit.cover,
),
   children: <Widget>[
    Container(
        margin: const EdgeInsets.all(10.0),
        child: Text(
          "${_weather.temp}°C",
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 55 ,),
        )
    Row(
      children:[Container(margin: const EdgeInsets.all(8.0), child: Text("${_weather.description}",),style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30,(color: Colors.white),),
    Container(margin: const EdgeInsets.all(8.0), child: Text("Feels:${_weather.feelsLike}°C"),style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30 ,color: Colors.white),),],),
    Row(children:[Container(margin: const EdgeInsets.all(8.0), child: Text("High:${_weather.high}°C Low:${_weather.low}°C"),style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30 ,color: Colors.white),),],);
    ),
    }

Future getCurrentWeather() async {
  Weather weather;
  String city = "Baghdad";
  String apiKey = "my api";
  var url = "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric";

  final response = await http.get(url, _CurrentWeatherPageState);

  if (response.statusCode == 200) {
    weather = Weather.fromJson(jsonDecode(response.body));
  }

  return weather;
}
