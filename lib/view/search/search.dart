import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/controller/weather_controller.dart';
import 'package:weather_app/view/core/colors.dart';
import 'package:weather_app/view/home/home_page.dart';
import 'package:weather_app/view/search/widgets/loading_widget.dart';
import 'package:weather_app/view/search/widgets/suggestions_widget.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);

  final WeatherController weatherCtrl = Get.put(WeatherController());
  final _searchCtrl = TextEditingController();

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
            child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                width: screenSize.width,
                height: 60,
                child: TextFormField(
                  controller: _searchCtrl,
                  onFieldSubmitted: (value) async {
                    await weatherCtrl.getWeatherData(savedPlace: value);
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
              sbHeight30,
              Obx(() {
                return (weatherCtrl.isLoading.value)
                    ? SearchLoadingEffect()
                    : (weatherCtrl.isError.value)
                        ? Text(
                            'Unable to find Place.',
                            style: whiteTxt20,
                          )
                        : (_searchCtrl.text.isEmpty)
                            ? SearchSuggestions()
                            : (weatherCtrl.weatherData.value.city != null)
                                ? InkWell(
                                    onTap: () async {
                                      Get.offAll(HomePage(
                                        place: _searchCtrl.text.trim(),
                                      ));
                                    },
                                    child: Container(
                                      width: screenSize.width * 9,
                                      height: 80,
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: whiteClr24,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            weatherCtrl
                                                .weatherData.value.city!.name!,
                                            style: whiteTxt22,
                                          ),
                                          Text(
                                            'Country : ${weatherCtrl.weatherData.value.city!.country!}',
                                            style: white38Txt14,
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                : Text('');
              }),
            ],
          ),
        )),
      ),
    );
  }
}
