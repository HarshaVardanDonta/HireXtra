// ignore_for_file: must_be_immutable, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/Day.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import 'CustomText.dart';

class WeatherLineWidget extends StatefulWidget {
  Day day;
  WeatherLineWidget({super.key, required this.day});

  @override
  State<WeatherLineWidget> createState() => _WeatherLineWidgetState();
}

class _WeatherLineWidgetState extends State<WeatherLineWidget> {
  milliSecondTodate() {
    var date = DateTime.fromMillisecondsSinceEpoch(widget.day.dt * 1000);
    DateFormat dateFormat = DateFormat("EEE");
    // date = DateTime.parse(dateFormat.format(date));
    if (date.day == DateTime.now().day) {
      return "Today";
    } else {
      return dateFormat.format(date);
    }
  }

  getIcon() {
    if (widget.day.weather[0].main == "Clouds") {
      return const FaIcon(
        FontAwesomeIcons.cloud,
        size: 15,
      );
    } else if (widget.day.weather[0].main == "Rain") {
      return const FaIcon(
        FontAwesomeIcons.cloudRain,
        size: 20,
      );
    } else if (widget.day.weather[0].main == "Clear") {
      return const Icon(Icons.wb_sunny_outlined);
    } else {
      return const Icon(Icons.wb_sunny_outlined);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 1,
            child: CustomText(
              text: milliSecondTodate().toString(),
              weight: FontWeight.bold,
              size: 15,
            ),
          ),
          Flexible(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                getIcon(),
                CustomText(
                  text: "${widget.day.main.temp_min}°",
                  size: 15,
                ),
                const SizedBox(
                  width: 110,
                  child: LinearProgressIndicator(
                    value: 0.2,
                    color: Colors.amber,
                    backgroundColor: Colors.white,
                  ),
                ),
                CustomText(
                    text: widget.day.main.temp_max.toString() + "°", size: 15),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
