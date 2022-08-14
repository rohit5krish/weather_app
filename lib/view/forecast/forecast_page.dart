import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/model/weather_model/weather_model.dart';
import 'package:weather_app/view/core/constants.dart';
import 'package:weather_app/view/forecast/widgets/forecast_inherited_widget.dart';
import 'package:weather_app/view/forecast/widgets/forecast_widget.dart';

class ForecastPage extends StatelessWidget {
  // final List<ListDatas> forecastList;
  const ForecastPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ListDatas> forecastList =
        ForecastInheritedWidget.of(context)!.forecastList;
    List<ListDatas> dailyForecastList = [];

    int index = 0;
    String _checkDate = forecastList[index]
        .dtTxt!
        .substring(0, forecastList[0].dtTxt!.indexOf(' ') + 1);
    while (index < forecastList.length) {
      if (forecastList[index]
                  .dtTxt!
                  .substring(0, forecastList[0].dtTxt!.indexOf(' ') + 1) !=
              _checkDate ||
          index == 0) {
        dailyForecastList.add(forecastList[index]);
      }
      _checkDate = forecastList[index]
          .dtTxt!
          .substring(0, forecastList[0].dtTxt!.indexOf(' ') + 1);
      index = index + 1;
    }
    return Scaffold(
      backgroundColor: blackColor,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: whiteColor,
            )),
        title: const Text(
          'Current Forecastings',
          style: whiteTxt18,
        ),
        centerTitle: true,
        backgroundColor: blackColor,
        elevation: 0,
      ),
      body: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: dailyForecastList.length,
          itemBuilder: (context, index) {
            String weatherDate = dailyForecastList[index]
                .dtTxt!
                .substring(0, dailyForecastList[0].dtTxt!.indexOf(' ') + 1);
            return ForecastWidget(
              index: index,
              weatherDate: weatherDate,
              dailyForecastList: dailyForecastList,
            );
          }),
    );
  }
}
