import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/model/core/api_endpoints.dart';
import 'package:weather_app/model/weather_model/weather_model.dart';
import 'package:weather_app/view/core/colors.dart';
import 'package:weather_app/view/forecast/forecast_page.dart';

class BottomForecastScroll extends StatelessWidget {
  final List<ListDatas> forecastList;
  const BottomForecastScroll({
    Key? key,
    required this.forecastList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int count = 0;
    while (forecastList[0]
                .dtTxt!
                .substring(0, forecastList[0].dtTxt!.indexOf(' ')) ==
            forecastList[count]
                .dtTxt!
                .substring(0, forecastList[count].dtTxt!.indexOf(' ')) &&
        count < 10) {
      count++;
    }

    return Container(
      height: 120,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: 6,
          itemBuilder: (context, index) {
            String weatherTime = forecastList[index].dtTxt!.substring(
                forecastList[0].dtTxt!.indexOf(' ') + 1,
                forecastList[0].dtTxt!.length);

            final time = weatherTime.substring(0, 5);

            return InkWell(
              onTap: () {
                Get.to(ForecastPage(forecastList: forecastList));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: blackClr45),
                  child: Column(
                    children: [
                      Text(time, style: whiteTxt14),
                      Image.network(
                          '${ApiEndpoints.climateImgUrl}/${forecastList[index].weather![0].icon}@2x.png',
                          height: 60,
                          width: 60),
                      Text('${forecastList[index].main!.temp}°C',
                          style: whiteTxt14)
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
