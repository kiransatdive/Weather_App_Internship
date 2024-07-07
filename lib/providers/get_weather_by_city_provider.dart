import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app_intership/models/weather.dart';
import 'package:weather_app_intership/services/api_helper.dart';

final GetWeatherByCityNameProvider = FutureProvider.autoDispose
    .family<Weather, String>((ref, String cityName) async {
  return ApiHelper.getWeatherByCityName(cityName: cityName);
});
