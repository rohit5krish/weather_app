import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/view/core/colors.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: blackColor,
      body: InkWell(
        splashFactory: NoSplash.splashFactory,
        highlightColor: Colors.transparent,
        onTap: () {
          FocusManager.instance.primaryFocus!.unfocus();
        },
        child: SafeArea(
            child: Column(
          children: [
            SizedBox(
              width: screenSize.width,
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: whiteColor,
                        size: 30,
                      )),
                  // Spacer(),
                  Container(
                    width: screenSize.width * 0.8,
                    height: 40,
                    child: TextFormField(
                      onChanged: (value) {},
                      style: whiteTxt14,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        hintText: 'Search for City',
                        hintStyle: white24Txt14,
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: whiteClr30,
                      ),
                    ),
                  ),
                  sbWidth10,
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
