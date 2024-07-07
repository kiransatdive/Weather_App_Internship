import 'package:flutter/material.dart';
import 'package:weather_app_intership/constants/text_styles.dart';
import 'package:weather_app_intership/extensions/date_time.dart';
import 'package:weather_app_intership/views/gradient_container.dart';
import 'package:weather_app_intership/views/hourly_forecast_view.dart';
import 'package:weather_app_intership/views/weekly_forecast_view.dart';

class ForecastScreen extends StatelessWidget {
  const ForecastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientContainer(children: [
        Align(
          alignment: Alignment.center,
          child: Text(
            'ForeCast Report',
            style: TextStyles.h1,
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Today",
              style: TextStyles.h2,
            ),
            Text(
              DateTime.now().dateTime,
              style: TextStyles.subtitleText,
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        HourlyForecastView(),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Next Forecast',
              style: TextStyles.h1,
            ),
            Icon(
              Icons.calendar_month_outlined,
              color: Colors.white,
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        WeeklyForecastView(),
      ]),
    );
  }
}
