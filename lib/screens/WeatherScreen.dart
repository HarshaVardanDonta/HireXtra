import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/Day.dart';
import 'package:flutter_application_1/model/FullWeather.dart';
import 'package:flutter_application_1/widgets/CustomText.dart';
import 'package:flutter_application_1/widgets/WeatherLineWidget.dart';
import 'package:geolocator/geolocator.dart';

import '../network/WeatherService.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  bool locationChecked = false;
  bool isLocationEnabled = false;
  LocationPermission? permission;
  Position? position;
  FullWeather? fullWeather;
  bool gotWeather = false;

  checkLocation() async {
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() {
          isLocationEnabled = false;
          locationChecked = false;
        });
      } else {
        setState(() {
          isLocationEnabled = true;
          locationChecked = true;
        });
      }
    } else {
      setState(() {
        isLocationEnabled = true;
        locationChecked = true;
      });
    }
    position = await Geolocator.getCurrentPosition();
  }

  List<Day>? refinedList;
  getWeather() async {
    fullWeather = await WeatherService.getWeather(
        days: 80, lat: position!.latitude, lon: position!.longitude);
    int dateCount = DateTime.now().day;
    refinedList = fullWeather!.list.where((element) {
      var date = DateTime.fromMillisecondsSinceEpoch(element.dt * 1000);
      if (date.day == dateCount) {
        dateCount++;
        return true;
      } else {
        return false;
      }
    }).toList();

    setState(() {
      gotWeather = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!locationChecked) {
      checkLocation();
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    if (isLocationEnabled && !gotWeather) {
      getWeather();
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
      backgroundColor: Colors.blue[300],
      body: Stack(
        children: [
          Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: (DateTime.now().hour > 17)
                          ? const AssetImage("assets/night.jpeg")
                          : const AssetImage("assets/sunny.jpg"),
                      fit: BoxFit.cover))),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomText(
                    text: fullWeather!.city.name,
                    size: 30,
                    color: Colors.white,
                    weight: FontWeight.bold,
                    isShadow: true,
                  ),
                  CustomText(
                    text: "${fullWeather!.list[0].main.temp}°",
                    size: 80,
                    color: Colors.white,
                    isShadow: true,
                  ),
                  CustomText(
                    text: fullWeather!.list[0].weather[0].description,
                    color: Colors.white,
                    isShadow: true,
                    weight: FontWeight.bold,
                  ),
                  CustomText(
                    text:
                        "${fullWeather!.list[0].main.temp_max}°  L- ${fullWeather!.list[0].main.temp_min}°",
                    color: Colors.white,
                    isShadow: true,
                    weight: FontWeight.bold,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                      child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.4),
                      ),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.calendar_today_outlined,
                                  size: 20,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                CustomText(
                                  text: "5 - Days Forecast",
                                  size: 15,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            // const Divider(
                            //   color: Colors.white,
                            //   height: 2,
                            //   indent: 10,
                            //   endIndent: 10,
                            // ),
                            Expanded(
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: refinedList!.length,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        WeatherLineWidget(
                                          day: refinedList![index],
                                        ),
                                        (index != refinedList!.length - 1)
                                            ? const Divider(
                                                color: Colors.white,
                                                height: 2,
                                                thickness: 0.5,
                                                indent: 10,
                                                endIndent: 10,
                                              )
                                            : const SizedBox.shrink(),
                                      ],
                                    );
                                  }),
                            ),
                          ]),
                        ),
                      ),
                    ),
                  )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
