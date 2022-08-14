import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_model/weather_model.dart';
import 'package:weather_app/view/core/constants.dart';
import 'package:weather_app/view/forecast/widgets/forecast_inherited_widget.dart';

class ForecastWidget extends StatelessWidget {
  final String? weatherDate;
  final List<ListDatas>? dailyForecastList;
  final int index;

  const ForecastWidget({
    Key? key,
    required this.index,
    this.weatherDate,
    this.dailyForecastList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ListDatas forecastList;
    if (dailyForecastList != null) {
      forecastList = dailyForecastList![index];
    } else {
      forecastList = ForecastInheritedWidget.of(context)!.forecastList[index];
    }

    // Get the time of weather
    String weatherTime = forecastList.dtTxt!.substring(
        forecastList.dtTxt!.indexOf(' ') + 1, forecastList.dtTxt!.length);
    final time = weatherTime.substring(0, 5);

// Get the Daily Forecast List

    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(colors: [
              Color.fromARGB(255, 98, 72, 232),
              Color.fromARGB(255, 83, 55, 218),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Column(
          children: [
            weatherDate != null
                ? Text(
                    weatherDate!,
                    style: whiteTxt14,
                  )
                : Text(
                    time,
                    style: whiteTxt18,
                  ),
            const Divider(
              color: blackClr45,
            ),
            sbHeight20,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text('${forecastList.main!.humidity}', style: whiteTxt20),
                    const Text(
                      'Humidity',
                      style: whiteTxt18,
                    )
                  ],
                ),
                sbHeight10,
                Column(
                  children: [
                    Text('${forecastList.main!.temp}°C', style: whiteTxt20),
                    sbHeight10,
                    Text(
                      forecastList.weather![0].main.toString(),
                      style: whiteTxt22,
                    ),
                  ],
                ),
                sbHeight10,
                Column(
                  children: [
                    Text(
                      '${forecastList.wind!.speed} m/s',
                      style: whiteTxt20,
                    ),
                    const Text(
                      'Wind',
                      style: whiteTxt18,
                    )
                  ],
                ),
              ],
            ),
            sbHeight20
          ],
        ),
      ),
    );
  }
}
