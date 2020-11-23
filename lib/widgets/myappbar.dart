import 'package:flutter/material.dart';

class MyAppbar extends StatelessWidget {
  dynamic weatherData;

  MyAppbar(this.weatherData);

  @override
  Widget build(BuildContext context) {
    return Row(
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
              onPressed: null),
        ]);
  }
}