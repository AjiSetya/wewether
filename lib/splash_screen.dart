import 'package:flutter/material.dart';
import 'package:wewether/myhomepage.dart';
import 'package:wewether/services/weather_services.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    var weatherData = await WeatherServices().getCityWeather("Bogor");
    print(weatherData.toString());

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MyHomePage(weather: weatherData)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('🌤'),
      ),
    );
  }
}
