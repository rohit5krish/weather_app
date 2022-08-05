import 'package:flutter/material.dart';
import 'package:weather_app/view/core/colors.dart';

class WindAndHumidityContainer extends StatelessWidget {
  const WindAndHumidityContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: screenSize.width * 0.8,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: blackClr26,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Icon(
                Icons.air,
                color: whiteColor,
                size: 28,
              ),
              sbHeight10,
              Text(
                '7Km/h',
                style: whiteTxt14,
              ),
              Text(
                'Wind',
                style: whiteTxt14,
              ),
            ],
          ),
          Column(
            children: [
              Icon(
                Icons.water_drop_outlined,
                color: whiteColor,
                size: 28,
              ),
              sbHeight10,
              Text(
                '36%',
                style: whiteTxt14,
              ),
              Text(
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
