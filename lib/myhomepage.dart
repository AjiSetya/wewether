import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:wewether/widgets/bgimage.dart';
import 'package:wewether/widgets/myappbar.dart';

import 'widgets/details.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({this.weather});

  final weather;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  dynamic weatherData;

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
                    BgImage(condition : weatherData['weather'][0]['main'].toString()),
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
                              // Image.network("https://www.flaticon.com/svg/static/icons/svg/615/615500.svg")
                              // Text("☁️", style: TextStyle(fontSize: 100),)
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
              child: MyAppbar(weatherData)),
        ],
      ),
    );
  }
}
