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

    Future.delayed(Duration(seconds: 3)).then((value) => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MyHomePage(weather: weatherData))));


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage("https://image.winudf.com/v2/image/Y29tLnR1bXBlbmduZXQud2FsbHBhcGVyY2xvdWRfc2NyZWVuc2hvdHNfNl9iNjEyZmZiYw/screen-6.jpg?fakeurl=1&type=.jpg")),
          ),
        child: Center(
          child: Text("WeWeather", style: TextStyle(color: Colors.white, fontSize: 32),),
        ),
        ),
      );
  }
}
