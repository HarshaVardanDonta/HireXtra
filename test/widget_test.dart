// ignore_for_file: unused_local_variable

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/FullWeather.dart';
import 'package:flutter_application_1/network/WeatherService.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  bool locationChecked = false;
  bool isLocationEnabled = false;
  LocationPermission? permission;
  Position? position;
  FullWeather? fullWeather;
  bool gotWeather = false;
  WidgetsFlutterBinding.ensureInitialized();
  checkLocation() async {
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        isLocationEnabled = false;
        locationChecked = false;
      } else {
        position = await Geolocator.getCurrentPosition();
        isLocationEnabled = true;
        locationChecked = true;
      }
    } else {
      position = await Geolocator.getCurrentPosition();
      isLocationEnabled = true;
      locationChecked = true;
    }
  }

  List<double> latLon = [];
  List<double> getLatLon() {
    latLon.add(Random().nextDouble() * 70);
    latLon.add(Random().nextDouble() * 70);
    return latLon;
  }

  group('weather test', () {
    test('get weather', () async {
      expect(
          await WeatherService.getWeather(
              days: 40,
              lat: Random().nextDouble() * 70,
              lon: Random().nextDouble() * 70),
          isNotNull);
    });
    test('get user location', () {
      expect(checkLocation(), isNotNull);
    });
  });
}
