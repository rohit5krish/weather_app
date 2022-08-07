import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:weather_app/controller/weather_controller.dart';
import 'package:weather_app/view/core/colors.dart';
import 'package:weather_app/view/home/widgets/bottom_forecast.dart';
import 'package:weather_app/view/home/widgets/home_top_illustration.dart';
import 'package:weather_app/view/home/widgets/loading_widget.dart';
import 'package:weather_app/view/home/widgets/wind_humidity.dart';
import 'package:weather_app/view/search/search.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  var climate = 'morning'.obs;

  final WeatherController weatherCtrl = Get.put(WeatherController());

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Obx(() {
      var weatherTime;
      if (!weatherCtrl.isLoading.value) {
        final weatherDateTime = weatherCtrl.weatherData.value.list![0].dtTxt;
        weatherTime = int.parse(weatherDateTime!.substring(
            weatherDateTime.indexOf(' ') + 1,
            weatherDateTime.indexOf(' ') + 3));
      }
      return Container(
        decoration: BoxDecoration(
            color: blackColor,
            image: !weatherCtrl.isLoading.value
                ? DecorationImage(
                    opacity: 0.8,
                    image: AssetImage((weatherTime <= 13)
                        ? 'assets/cloudsMorning.jpg'
                        : (weatherTime < 18)
                            ? 'assets/alwinClouds.jpeg'
                            : 'assets/alwinNight.jpeg'),
                    fit: BoxFit.cover)
                : null,
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
            title: (weatherCtrl.isLoading.value)
                ? Shimmer.fromColors(
                    highlightColor: greyClr100!,
                    baseColor: greyClr300!,
                    child: Container(
                      width: 60,
                      height: 30,
                      decoration: BoxDecoration(
                          color: blueColor,
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  )
                : (weatherCtrl.isError.value)
                    ? Text('')
                    : Text(
                        weatherCtrl.weatherData.value.city!.name.toString(),
                        style: whiteTxt22,
                      ),
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () {
                    Get.to(SearchPage());
                  },
                  icon: Icon(
                    Icons.search,
                    color: whiteColor,
                    size: 30,
                  )),
              sbWidth10,
            ],
          ),
          body: RefreshIndicator(
            onRefresh: () {
              return weatherCtrl.getWeatherData();
            },
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ListView(
                children: [
                  Center(
                    child: (weatherCtrl.isLoading.value)
                        ? LoadingEffect()
                        : (weatherCtrl.isError.value)
                            ? Text('')
                            : Builder(builder: (context) {
                                final weatherDetail =
                                    weatherCtrl.weatherData.value.list![0];
                                final String climateDescription = weatherDetail
                                    .weather![0].description
                                    .toString();
                                final String climate =
                                    weatherDetail.weather![0].main.toString();
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    HomeTopIllustration(
                                        screenSize: screenSize,
                                        climateDescription: climateDescription,
                                        climate: climate),
                                    sbHeight10,
                                    Text(
                                      '${weatherDetail.main!.temp!.floor()}°C',
                                      style: cyanTxt60,
                                    ),
                                    Text(
                                      climate,
                                      style: whiteTxt22,
                                    ),
                                    sbHeight30,
                                    WindAndHumidityContainer(
                                      humidity: weatherDetail.main!.humidity
                                          .toString(),
                                      windSpeed:
                                          weatherDetail.wind!.speed.toString(),
                                    ),
                                    sbHeight30,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                      forecastList:
                                          weatherCtrl.weatherData.value.list!,
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
    });
  }
}
