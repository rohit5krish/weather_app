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
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: whiteColor,
              size: 30,
            )),
        title: Text('Search for Places', style: whiteTxt22),
        centerTitle: true,
        backgroundColor: blackColor,
        elevation: 0,
      ),
      body: InkWell(
        splashFactory: NoSplash.splashFactory,
        highlightColor: Colors.transparent,
        onTap: () {
          FocusManager.instance.primaryFocus!.unfocus();
        },
        child: SafeArea(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                width: screenSize.width,
                height: 60,
                child: TextFormField(
                  onFieldSubmitted: (value) {
                    print(value);
                  },
                  style: whiteTxt14,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search, color: whiteClr24),
                    contentPadding: EdgeInsets.only(left: 20),
                    hintText: 'Search for City',
                    hintStyle: white38Txt14,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    filled: true,
                    fillColor: whiteClr24,
                  ),
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
