import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather_app/controller/location_controller.dart';
import 'package:weather_app/controller/weather_controller.dart';
import 'package:weather_app/view/core/constants.dart';
import 'package:weather_app/view/home/home_page.dart';

class SearchSuggestions extends StatelessWidget {
  SearchSuggestions({Key? key}) : super(key: key);

  final LocationController _locControl = Get.put(LocationController());
  final WeatherController weatherCtrl = Get.put(WeatherController());

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          highlightColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
          onTap: () async {
            Position position = await _locControl.getLocationData();
            await weatherCtrl.getWeatherData(userLocation: position);
            await Get.offAll(() => HomePage());
          },
          child: GetBuilder<LocationController>(
              init: LocationController(),
              builder: (_locCtrl) {
                return Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: whiteClr24,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.place,
                        color: whiteColor,
                        size: 20,
                      ),
                      _locCtrl.isLocationLoading
                          ? const CircularProgressIndicator()
                          : const Text(
                              'My Location',
                              style: whiteTxt14,
                            )
                    ],
                  ),
                );
              }),
        ),
        InkWell(
          highlightColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
          onTap: () async {
            await weatherCtrl.getWeatherData(savedPlace: 'kochi');
            await Get.offAll(HomePage());
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: whiteClr24, borderRadius: BorderRadius.circular(18)),
            child: Row(
              children: const [
                Icon(
                  Icons.place,
                  color: whiteColor,
                  size: 20,
                ),
                Text(
                  'Kochi',
                  style: whiteTxt14,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
