import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:weather_app/controller/location_controller.dart';
import 'package:weather_app/controller/weather_controller.dart';
import 'package:weather_app/model/weather_model/weather_model.dart';
import 'package:weather_app/view/core/colors.dart';
import 'package:weather_app/view/forecast/forecast_page.dart';
import 'package:weather_app/view/forecast/widgets/forecast_inherited_widget.dart';
import 'package:weather_app/view/home/widgets/bottom_forecast.dart';
import 'package:weather_app/view/home/widgets/home_top_illustration.dart';
import 'package:weather_app/view/home/widgets/loading_widget.dart';
import 'package:weather_app/view/home/widgets/wind_humidity.dart';
import 'package:weather_app/view/search/search.dart';

class HomePage extends StatelessWidget {
  final Position? usrLocation;
  final String? place;
  HomePage({Key? key, this.usrLocation, this.place}) : super(key: key);

  var climate = 'morning'.obs;

  final WeatherController weatherControl = Get.put(WeatherController());

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    // if (usrLocation != null) {
    //   WidgetsBinding.instance!.addPostFrameCallback((_) async {
    //     await weatherCtrl.getWeatherData(userLocation: usrLocation);
    //   });
    // } else {
    //   WidgetsBinding.instance!.addPostFrameCallback((_) async {
    //     await weatherCtrl.getWeatherData(savedPlace: place);
    //   });
    // }
    return GetBuilder<WeatherController>(
        init: WeatherController(),
        builder: (weatherCtrl) {
          var weatherTime;
          if (!weatherCtrl.isLoading) {
            final weatherDateTime = weatherCtrl.weatherData.list![0].dtTxt;
            weatherTime = int.parse(weatherDateTime!.substring(
                weatherDateTime.indexOf(' ') + 1,
                weatherDateTime.indexOf(' ') + 3));
          }
          return Container(
            decoration: BoxDecoration(
                color: blackColor,
                image: !weatherCtrl.isLoading
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
                  Color.fromARGB(255, 123, 188, 241),
                  Color.fromARGB(255, 108, 124, 214),
                  Color.fromARGB(255, 103, 79, 225),
                  Color.fromARGB(255, 98, 72, 232),
                  Color.fromARGB(255, 83, 55, 218),
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: (weatherCtrl.isLoading)
                    ? Shimmer.fromColors(
                        highlightColor: blueClr100!,
                        baseColor: blueClr300!,
                        child: Container(
                          width: 60,
                          height: 30,
                          decoration: BoxDecoration(
                              color: blueColor,
                              borderRadius: BorderRadius.circular(5)),
                        ),
                      )
                    : (weatherCtrl.isError)
                        ? Text('')
                        : Text(
                            weatherCtrl.weatherData.city!.name.toString(),
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
                onRefresh: () async {
                  return await weatherCtrl.getWeatherData(
                      savedPlace:
                          weatherCtrl.weatherData.city!.name.toString());
                },
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: ListView(
                    children: [
                      Center(
                        child: (weatherCtrl.isLoading)
                            ? LoadingEffect()
                            : (weatherCtrl.isError)
                                ? Text('')
                                : Builder(builder: (context) {
                                    final weatherDetail =
                                        weatherCtrl.weatherData.list![0];
                                    final String climateDescription =
                                        weatherDetail.weather![0].description
                                            .toString();
                                    final String climate = weatherDetail
                                        .weather![0].main
                                        .toString();
                                    return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        HomeTopIllustration(
                                            screenSize: screenSize,
                                            climateDescription:
                                                climateDescription,
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
                                          windSpeed: weatherDetail.wind!.speed
                                              .toString(),
                                        ),
                                        sbHeight30,
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Today', style: whiteTxt18),
                                            InkWell(
                                              onTap: () {
                                                Get.to(() =>
                                                    ForecastInheritedWidget(
                                                        forecastList:
                                                            weatherCtrl
                                                                .weatherData
                                                                .list!,
                                                        child: ForecastPage()));
                                              },
                                              child: Text(
                                                '5-days Forecast >',
                                                style: whiteTxt14,
                                              ),
                                            )
                                          ],
                                        ),
                                        sbHeight20,
                                        ForecastInheritedWidget(
                                            forecastList:
                                                weatherCtrl.weatherData.list!,
                                            child: BottomForecastScroll())
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
