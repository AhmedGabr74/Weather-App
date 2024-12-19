import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubites/get_weather_cubite.dart';
import 'package:weather_app/cubites/get_weather_states.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubite(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubite, WeatherState>(
            builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: getThemeColor(
                  BlocProvider.of<GetWeatherCubite>(context)
                      .weatherModel
                      ?.weatherCondition),
              appBarTheme: AppBarTheme(
              backgroundColor: getThemeColor(
              BlocProvider.of<GetWeatherCubite>(context).weatherModel?.weatherCondition),
              ),
            ),
            home: HomeView(),
          );
        }),
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition) {
    case 'Sunny':
      return Colors.amber;
    case 'Partly cloudy':
      return Colors.blueGrey;
    case 'Cloudy':
      return Colors.grey;
    case 'Overcast':
    case 'Patchy rain possible':
      return Colors.blueGrey;
    case 'Mist':
      return Colors.lightBlue;
    case 'Patchy snow possible':
      return Colors.blue;
    case 'Patchy sleet possible':
      return Colors.teal;
    case 'Patchy freezing drizzle possible':
      return Colors.cyan;
    case 'Thundery outbreaks possible':
      return Colors.deepPurple;
    case 'Blowing snow':
      return Colors.blue;
    case 'Blizzard':
      return Colors.indigo;
    case 'Fog':
      return Colors.grey;
    case 'Freezing fog':
    case 'Patchy light drizzle':
      return Colors.lightBlue;
    case 'Light drizzle':
    case 'Freezing drizzle':
      return Colors.cyan;
    case 'Heavy freezing drizzle':
      return Colors.blueGrey;
    case 'Patchy light rain':
    case 'Light rain':
    case 'Moderate rain at times':
      return Colors.lightBlue;
    case 'Moderate rain':
      return Colors.blue;
    case 'Heavy rain':
    case 'Heavy rain at times':
      return Colors.indigo;
    case 'Light freezing rain':
      return Colors.cyan;
    case 'Moderate or heavy freezing rain':
      return Colors.blueGrey;
    case 'Light sleet':
    case 'Moderate or heavy sleet':
      return Colors.teal;
    case 'Patchy light snow':
    case 'Light snow':
      return Colors.blue;
    case 'Patchy moderate snow':
    case 'Moderate snow':
      return Colors.indigo;
    case 'Patchy heavy snow':
    case 'Heavy snow':
      return Colors.deepPurple;
    case 'Ice pellets':
    case 'Light rain shower':
      return Colors.cyan;
    case 'Moderate or heavy rain shower':
    case 'Torrential rain shower':
      return Colors.blue;
    case 'Light sleet showers':
    case 'Moderate or heavy sleet showers':
      return Colors.teal;
    case 'Light snow showers':
      return Colors.blue;
    case 'Moderate or heavy snow showers':
      return Colors.indigo;
    case 'Light showers of ice pellets':
    case 'Moderate or heavy showers of ice pellets':
      return Colors.cyan;
    case 'Patchy light rain with thunder':
      return Colors.deepPurple;
    case 'Moderate or heavy rain with thunder':
      return Colors.indigo;
    case 'Patchy light snow with thunder':
      return Colors.purple;
    case 'Moderate or heavy snow with thunder':
      return Colors.deepPurple;
    default:
      return Colors.grey; // Default for unknown conditions
  }
}
