import 'package:flutter/material.dart';
import 'package:weather_app/view/core/constants.dart';

class WindAndHumidityContainer extends StatelessWidget {
  final String windSpeed;
  final String humidity;

  const WindAndHumidityContainer({
    Key? key,
    required this.windSpeed,
    required this.humidity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: screenSize.width * 0.8,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: blackClr45,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              const Icon(
                Icons.air,
                color: whiteColor,
                size: 28,
              ),
              sbHeight10,
              Text(
                '$windSpeed m/s',
                style: whiteTxt14,
              ),
              const Text(
                'Wind',
                style: whiteTxt14,
              ),
            ],
          ),
          Column(
            children: [
              const Icon(
                Icons.water_drop_outlined,
                color: whiteColor,
                size: 28,
              ),
              sbHeight10,
              Text(
                '$humidity%',
                style: whiteTxt14,
              ),
              const Text(
                'Humidity',
                style: whiteTxt14,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
