import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather_app/controller/location_controller.dart';
import 'package:weather_app/controller/weather_controller.dart';
import 'package:weather_app/view/core/colors.dart';
import 'package:weather_app/view/home/home_page.dart';
import 'package:weather_app/view/search/search.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  final LocationController _locControl = Get.put(LocationController());
  final WeatherController weatherControl = Get.put(WeatherController());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(255, 123, 188, 241),
        Color.fromARGB(255, 108, 124, 214),
        Color.fromARGB(255, 103, 79, 225),
        Color.fromARGB(255, 98, 72, 232),
        Color.fromARGB(255, 83, 55, 218),
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Weather App', style: splashTxtStyle),
              sbHeight20,
              GetBuilder<LocationController>(
                  init: LocationController(),
                  builder: (_locCtrl) {
                    return ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: whiteColor),
                        onPressed: () async {
                          Position usrLocation =
                              await _locCtrl.getLocationData();
                          await weatherControl.getWeatherData(
                              userLocation: usrLocation);
                          await Get.offAll(() => HomePage());
                        },
                        child: _locCtrl.isLocationLoading
                            ? CircularProgressIndicator(
                                strokeWidth: 2,
                              )
                            : Text('Detect Location'));
                  }),
              ElevatedButton(
                  onPressed: () {
                    Get.to(() => SearchPage());
                  },
                  child: Text('Select Manually'))
            ],
          )),
        ),
      ),
    );
  }
}
