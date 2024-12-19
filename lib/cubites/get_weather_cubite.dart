import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubites/get_weather_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class GetWeatherCubite extends Cubit<WeatherState> {
  GetWeatherCubite() : super(WeatherInitialState());
   WeatherModel? weatherModel;
  get_weather({required String cityName}) async {
    try {
      weatherModel =
          await WeatherService(Dio()).getCurrentWeather(cityName: cityName);
      emit(WeatherLoadedState(weatherModel!));
    } on Exception catch (e) {
      emit(WeatherFailureState(
         'An error occurred while fetching weather data: ${e.toString()}'
      ));
    }
  }
}
