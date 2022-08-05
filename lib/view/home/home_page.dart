import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_app/view/core/colors.dart';
import 'package:weather_app/view/home/widgets/bottom_forecast.dart';
import 'package:weather_app/view/home/widgets/wind_humidity.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        // Color.fromARGB(255, 160, 212, 255),
        Color.fromARGB(255, 123, 188, 241),
        Color.fromARGB(255, 108, 124, 214),
        Color.fromARGB(255, 103, 79, 225),
        Color.fromARGB(255, 98, 72, 232),
        Color.fromARGB(255, 83, 55, 218),
        // Color.fromARGB(255, 44, 18, 171),
        // Color.fromARGB(255, 29, 7, 139),
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Icon(
            Icons.add,
            color: whiteColor,
          ),
          title: Text(
            'Palakkad',
            style: whiteTxt18,
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: screenSize.width * 0.7,
                      height: screenSize.height * 0.3,
                      child: Image.asset('assets/thunder_rain.png'),
                    ),
                    sbHeight10,
                    Text(
                      '26°C',
                      style: cyanTxt100,
                    ),
                    Text(
                      'Cloudy',
                      style: whiteTxt22,
                    ),
                    // Divider(
                    //   indent: 40,
                    //   endIndent: 40,
                    //   color: whiteClr30,
                    //   thickness: 0.5,
                    //   height: 30,
                    // ),
                    sbHeight20,
                    WindAndHumidityContainer(),
                    sbHeight20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Today', style: whiteTxt18),
                        Text(
                          '7-Day Forecasts',
                          style: whiteTxt14,
                        )
                      ],
                    ),
                    sbHeight20,
                    BottomForecastScroll()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
