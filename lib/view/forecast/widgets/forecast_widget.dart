import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_model/weather_model.dart';
import 'package:weather_app/view/core/colors.dart';
import 'package:weather_app/view/forecast/widgets/forecast_inherited_widget.dart';

class ForecastWidget extends StatelessWidget {
  final String? weatherDate;
  final int index;

  const ForecastWidget({
    Key? key,
    required this.index,
    this.weatherDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ListDatas> forecastList =
        ForecastInheritedWidget.of(context)!.forecastList;
    String weatherTime = forecastList[index].dtTxt!.substring(
        forecastList[0].dtTxt!.indexOf(' ') + 1, forecastList[0].dtTxt!.length);

    final time = weatherTime.substring(0, 5);
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(colors: [
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
            Divider(
              color: blackClr45,
            ),
            sbHeight20,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text('${forecastList[index].main!.humidity}',
                        style: whiteTxt20),
                    Text(
                      'Humidity',
                      style: whiteTxt18,
                    )
                  ],
                ),
                sbHeight10,
                Column(
                  children: [
                    Text('${forecastList[index].main!.temp}°C',
                        style: whiteTxt20),
                    sbHeight10,
                    Text(
                      forecastList[index].weather![0].main.toString(),
                      style: whiteTxt22,
                    ),
                  ],
                ),
                sbHeight10,
                Column(
                  children: [
                    Text(
                      '${forecastList[index].wind!.speed} m/s',
                      style: whiteTxt20,
                    ),
                    Text(
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
