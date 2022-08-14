import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/view/core/colors.dart';
import 'package:weather_app/view/forecast/widgets/forecast_widget.dart';

class ForecastDetails extends StatelessWidget {
  final int index;
  const ForecastDetails({Key? key, required this.index}) : super(key: key);

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
          'Forecast Details',
          style: whiteTxt20,
        ),
        centerTitle: true,
        backgroundColor: blackColor,
        elevation: 0,
      ),
      body: Column(
        children: [
          ForecastWidget(index: index),
        ],
      ),
    );
  }
}
