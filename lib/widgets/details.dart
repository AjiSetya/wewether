import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  dynamic weatherData;

  Details(this.weatherData);

  @override
  Widget build(BuildContext context) {
    int tempMax = weatherData['main']['temp_max'].toInt();
    int tempMin = weatherData['main']['temp_min'].toInt();
    int humidity = weatherData['main']['humidity'].toInt();
    double visibilityDouble = weatherData['visibility'].toInt() / 1000;
    int visibility = visibilityDouble.toInt();

    return Container(
      decoration: BoxDecoration(
          color: Color(0x80FFFFFF),
          borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Current details'),
            SizedBox(
              height: 24,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      Text('Temp Max'),
                      Text('Temp Min'),
                      Text('Humidity'),
                      Text('Pressure'),
                      Text('Visibility'),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      Text(tempMax.toString()),
                      Text(tempMin.toString()),
                      Text(humidity.toString() + '%'),
                      Text(weatherData['main']['pressure'].toString()),
                      Text(visibility.toString() + ' km'),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
