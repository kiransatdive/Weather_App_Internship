import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_app_intership/constants/app_colors.dart';
import 'package:weather_app_intership/constants/text_styles.dart';
import 'package:weather_app_intership/views/famous_cities_weather.dart';
import 'package:weather_app_intership/views/gradient_container.dart';
import 'package:weather_app_intership/widgets/round_text_field.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final TextEditingController _controller;
  @override
  void initState() {
    _controller = TextEditingController();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: GradientContainer(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Pick Location', style: TextStyles.h1),
          ],
        ),
        SizedBox(height: 30),
        Text(
          'Find the area or city that you want to konow the detailed weather info at this time',
          style: TextStyles.subtitleText,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 40),
        Row(
          children: [
            Expanded(child: RoundTextField()),
            SizedBox(width: 15),
            LocationIcon(),
          ],
        ),
        SizedBox(height: 30),
        FamousCitiesWeather(),
      ]),
    );
  }
}

class LocationIcon extends StatelessWidget {
  const LocationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 55,
      decoration: BoxDecoration(
        color: AppColors.accentBlue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Icon(
        Icons.location_on_outlined,
        color: AppColors.grey,
      ),
    );
  }
}
