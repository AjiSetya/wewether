import 'package:flutter/material.dart';

import 'services/weather_services.dart';
import 'widgets/details.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({this.weather});

  final weather;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  dynamic weatherData;
  String cityName;

  @override
  void initState() {
    weatherData = widget.weather;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int temperature = weatherData['main']['temp'].toInt();

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(WeatherServices()
                              .getWeatherBackground(weatherData['weather'][0]
                                      ['main']
                                  .toString())),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 140, left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Sunday, 22 Nov",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(temperature.toString(),
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 100)),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 16.0),
                                    child: Text("°C",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 32)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Text(
                            weatherData['weather'][0]['main'],
                            style: TextStyle(color: Colors.white, fontSize: 28),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Details(weatherData),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 32, left: 8, right: 8),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      icon: Icon(
                        Icons.menu,
                        color: Colors.transparent,
                      ),
                      onPressed: null),
                  Text(
                    weatherData['name'],
                    style: TextStyle(color: Colors.white, fontSize: 26),
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.location_on,
                        color: Colors.white,
                      ),
                      onPressed: () => _showDialogEditLocation(context)),
                ],
              )),
        ],
      ),
    );
  }

  _showDialogEditLocation(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Ubah Lokasi"),
            content: TextField(
              onChanged: (value) {
                cityName = value;
              },
              decoration: InputDecoration(hintText: "Lokasi"),
            ),
            actions: <Widget>[
              new FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: new Text("Batal")),
              new FlatButton(
                  onPressed: () => Navigator.pop(context, () {
                        setState(() async {
                          weatherData =
                              await WeatherServices().getCityWeather(cityName);
                        });
                      }),
                  child: new Text("Ok")),
            ],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
          );
        });
  }
}
