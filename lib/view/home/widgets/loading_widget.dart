import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:weather_app/view/core/colors.dart';

class LoadingEffect extends StatelessWidget {
  const LoadingEffect({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Shimmer.fromColors(
      highlightColor: greyClr100!,
      baseColor: greyClr300!,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: screenSize.width * 0.65,
            height: screenSize.height * 0.3,
            decoration: BoxDecoration(
                color: greyClr300, borderRadius: BorderRadius.circular(20)),
          ),
          sbHeight10,

          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                color: greyClr300, borderRadius: BorderRadius.circular(5)),
          ),
          sbHeight10,
          Container(
            width: 120,
            height: 40,
            decoration: BoxDecoration(
                color: greyClr300, borderRadius: BorderRadius.circular(5)),
          ),
          // Divider(
          //   indent: 40,
          //   endIndent: 40,
          //   color: whiteClr30,
          //   thickness: 0.5,
          //   height: 30,
          // ),
          sbHeight20,
          Container(
            width: screenSize.width,
            height: 100,
            decoration: BoxDecoration(
                color: greyClr300, borderRadius: BorderRadius.circular(15)),
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
          Container(
            height: 130,
            child: ListView.builder(
                // physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: greyClr300),
                      width: 80,
                      height: 150,
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
