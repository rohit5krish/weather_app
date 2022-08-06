import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/controller/weather_controller.dart';
import 'package:weather_app/service/api_service.dart';
import 'package:weather_app/view/core/colors.dart';
import 'package:weather_app/view/home/widgets/bottom_forecast.dart';
import 'package:weather_app/view/home/widgets/wind_humidity.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final WeatherController weatherCtrl = Get.put(WeatherController());

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
          leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.add,
                color: whiteColor,
              )),
          title: Obx(() {
            if (weatherCtrl.isLoading.value) {
              return Center(child: CircularProgressIndicator());
            } else if (weatherCtrl.isError.value) {
              return Text('');
            }
            return Text(
              weatherCtrl.weatherData.value.city!.name.toString(),
              style: whiteTxt18,
            );
          }),
          centerTitle: true,
        ),
        body: RefreshIndicator(
          onRefresh: () {
            return WeatherController().getWeatherData();
          },
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: ListView(
              children: [
                Center(
                  child: Obx(() {
                    if (weatherCtrl.isLoading.value) {
                      return Center(child: CircularProgressIndicator());
                    } else if (weatherCtrl.isError.value) {
                      return Text('');
                    }
                    final weatherDetail =
                        weatherCtrl.weatherData.value.list![0];
                    final String climateDescription =
                        weatherDetail.weather![0].description.toString();
                    final String climate =
                        weatherDetail.weather![0].main.toString();
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: screenSize.width * 0.65,
                          height: screenSize.height * 0.25,
                          child: Image.asset(
                              (climateDescription == 'moderate rain')
                                  ? 'assets/thunder_rain.png'
                                  : (climate == 'Clear' || climate == 'Clouds')
                                      ? 'assets/clouds.png'
                                      : (climateDescription == 'light rain')
                                          ? 'assets/cloud_rain.png'
                                          : (climateDescription ==
                                                  'overcast clouds')
                                              ? 'assets/thunder_rain.png'
                                              : (climate == 'Rain')
                                                  ? 'assets/thunder_rain.png'
                                                  : (climate == 'Thunder')
                                                      ? 'assets/sun_thunder.png'
                                                      : 'assets/cloud_sun.png'),
                        ),
                        sbHeight10,

                        Text(
                          '${weatherDetail.main!.temp!.floor()}°C',
                          style: cyanTxt60,
                        ),
                        Text(
                          climate,
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
                        WindAndHumidityContainer(
                          humidity: weatherDetail.main!.humidity.toString(),
                          windSpeed: weatherDetail.wind!.speed.toString(),
                        ),
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
                        BottomForecastScroll(
                          forecastList: weatherCtrl.weatherData.value.list!,
                        )
                      ],
                    );
                  }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
