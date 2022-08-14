import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:weather_app/view/core/constants.dart';

class SearchLoadingEffect extends StatelessWidget {
  const SearchLoadingEffect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Shimmer.fromColors(
      highlightColor: greyClr600!,
      baseColor: greyClr300!,
      child: Container(
        width: screenSize.width * 9,
        height: 80,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: greyClr300, borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
