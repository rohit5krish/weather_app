import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/controller/location_controller.dart';
import 'package:weather_app/controller/weather_controller.dart';
import 'package:weather_app/view/core/colors.dart';
import 'package:weather_app/view/home/home_page.dart';

class SearchSuggestions extends StatelessWidget {
  SearchSuggestions({Key? key}) : super(key: key);

  final LocationController _locCtrl = Get.put(LocationController());
  final WeatherController weatherCtrl = Get.put(WeatherController());

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          onTap: () async {
            await _locCtrl.getLocationData();
          },
          child: Obx(() {
            return Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: whiteClr24, borderRadius: BorderRadius.circular(20)),
              child: Row(
                children: [
                  Icon(
                    Icons.place,
                    color: whiteColor,
                    size: 20,
                  ),
                  _locCtrl.isLocationLoading.value
                      ? CircularProgressIndicator()
                      : Text(
                          'My Location',
                          style: whiteTxt14,
                        )
                ],
              ),
            );
          }),
        ),
        InkWell(
          onTap: () async {
            Get.offAll(HomePage(
              place: 'palakkad',
            ));
          },
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: whiteClr24, borderRadius: BorderRadius.circular(18)),
            child: Row(
              children: [
                Icon(
                  Icons.place,
                  color: whiteColor,
                  size: 20,
                ),
                Text(
                  'Palakkad',
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
