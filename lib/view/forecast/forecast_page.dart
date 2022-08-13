import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/model/core/api_endpoints.dart';
import 'package:weather_app/model/weather_model/weather_model.dart';
import 'package:weather_app/view/core/colors.dart';

class ForecastPage extends StatelessWidget {
  final List<ListDatas> forecastList;
  const ForecastPage({Key? key, required this.forecastList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: whiteColor,
            )),
        title: Text(
          'Current Forecastings',
          style: whiteTxt18,
        ),
        centerTitle: true,
        backgroundColor: blackColor,
        elevation: 0,
      ),
      body: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 6,
          itemBuilder: (context, index) {
            String weatherTime = forecastList[index].dtTxt!.substring(
                forecastList[0].dtTxt!.indexOf(' ') + 1,
                forecastList[0].dtTxt!.length);
            String weatherDate = forecastList[index]
                .dtTxt!
                .substring(0, forecastList[0].dtTxt!.indexOf(' ') + 1);
            print(weatherDate);

            final time = weatherTime.substring(0, 5);

            return Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: whiteClr24),
                child: Column(
                  children: [
                    Text(time, style: whiteTxt14),
                    Text('${forecastList[index].main!.temp}°C',
                        style: whiteTxt14)
                  ],
                ),
              ),
            );
          }),
    );
  }
}
