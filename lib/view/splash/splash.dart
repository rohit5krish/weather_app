import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather_app/view/core/colors.dart';
import 'package:weather_app/view/home/home_page.dart';
import 'package:weather_app/view/search/search.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

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
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.all(20),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Weather App', style: splashTxtStyle),
              sbHeight20,
              ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: whiteColor),
                  onPressed: () async {
                    LocationPermission permissionCheck =
                        await Geolocator.checkPermission();

                    // Not permitted at start
                    if (permissionCheck == LocationPermission.denied) {
                      LocationPermission reqResult =
                          await Geolocator.requestPermission();
                      if (reqResult == LocationPermission.denied) {
                        exit(0);
                        return;
                      }
                    }

                    Position position = await Geolocator.getCurrentPosition(
                        desiredAccuracy: LocationAccuracy.high);
                    Get.to(HomePage(
                      usrLocation: position,
                    ));
                  },
                  child: Text('Detect Location')),
              ElevatedButton(
                  onPressed: () {
                    Get.off(SearchPage());
                  },
                  child: Text('Select Manually'))
            ],
          )),
        )),
      ),
    );
  }
}
