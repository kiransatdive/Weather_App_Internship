import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app_intership/constants/text_styles.dart';
import 'package:weather_app_intership/extensions/date_time.dart';

import 'package:weather_app_intership/providers/current_weather_provider.dart';
import 'package:weather_app_intership/views/gradient_container.dart';
import 'package:weather_app_intership/views/hourly_forecast_view.dart';
import 'package:weather_app_intership/views/weather_Info.dart';

class WeatherScreen extends ConsumerWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherData = ref.watch(currentWeatherProvider);
    return weatherData.when(data: (weather) {
      return GradientContainer(
        children: [
          SizedBox(
            width: double.infinity,
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Text(
              weather.name,
              style: TextStyles.h1,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              DateTime.now().dateTime,
              style: TextStyles.subtitleText,
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 260,
              child: Image.asset(
                  'assets/icons/${weather.weather[0].icon.replaceAll('n', 'd')}.png'),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              weather.weather[0].description,
              style: TextStyles.h3,
            ),
          ]),
          const SizedBox(
            height: 40,
          ),
          WeatherInfo(
            weather: weather,
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Today',
                style: TextStyles.h2,
              ),
              TextButton(onPressed: () {}, child: Text('View full forecast'))
            ],
          ),
          SizedBox(
            height: 15,
          ),
          const HourlyForecastView(),
        ],
      );
    }, error: (error, syackTrace) {
      return Center(
        child: Text(error.toString()),
      );
    }, loading: () {
      return Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}
