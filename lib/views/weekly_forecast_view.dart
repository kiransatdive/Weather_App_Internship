import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app_intership/constants/app_colors.dart';
import 'package:weather_app_intership/constants/text_styles.dart';
import 'package:weather_app_intership/extensions/date_time.dart';
import 'package:weather_app_intership/providers/weekly_weather_provider.dart';
import 'package:weather_app_intership/utils/get_weather_icons.dart';
import 'package:weather_app_intership/widgets/subscript_text.dart';

class WeeklyForecastView extends ConsumerWidget {
  const WeeklyForecastView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final WeeklyForecastData = ref.watch(weeklyWeatherProvider);

    return WeeklyForecastData.when(data: (weeklyweather) {
      return ListView.builder(
          itemCount: weeklyweather.daily.weatherCode.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final dayOfWeek =
                DateTime.parse(weeklyweather.daily.time[index]).dayOfWeek;
            final date = weeklyweather.daily.time[index];
            final temp = weeklyweather.daily.temperature2mMax[index];
            final icon = weeklyweather.daily.weatherCode[index];

            return WeeklyForecastTile(
              date: date,
              day: dayOfWeek,
              temp: temp.toInt(),
              icon: getWeatherIcon2(icon),
            );
          });
    }, error: (error, stackTrace) {
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

class WeeklyForecastTile extends StatelessWidget {
  const WeeklyForecastTile({
    super.key,
    required this.day,
    required this.date,
    required this.temp,
    required this.icon,
  });

  final String day;
  final String date;
  final int temp;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 20,
      ),
      margin: const EdgeInsets.symmetric(
        vertical: 12,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.accentBlue,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                day,
                style: TextStyles.h3,
              ),
              const SizedBox(height: 5),
              Text(
                date,
                style: TextStyles.subtitleText,
              ),
            ],
          ),

          // Temperature
          SuperscriptText(
            text: '$temp',
            color: AppColors.white,
            superScript: '°C',
            superscriptColor: AppColors.white,
          ),

          // weather icon
          Image.asset(
            icon,
            width: 60,
          ),
        ],
      ),
    );
  }
}
