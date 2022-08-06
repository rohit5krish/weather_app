import 'package:flutter/material.dart';
import 'package:weather_app/model/core/api_endpoints.dart';
import 'package:weather_app/view/core/colors.dart';

class BottomForecastScroll extends StatelessWidget {
  const BottomForecastScroll({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: blackClr26),
                child: Column(
                  children: [
                    Text('15:00', style: whiteTxt14),
                    Image.network('${ApiEndpoints.climateImgUrl}',
                        height: 60, width: 60),
                    Text('26°C', style: whiteTxt14)
                  ],
                ),
              ),
            );
          }),
    );
  }
}
