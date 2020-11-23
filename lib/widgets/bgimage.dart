import 'package:flutter/material.dart';
import 'package:wewether/services/weather_services.dart';

class BgImage extends StatelessWidget {
  String condition;

  BgImage({this.condition});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          color: Colors.blueAccent,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(WeatherServices().getWeatherBackground(condition)))),
    );
  }
}
