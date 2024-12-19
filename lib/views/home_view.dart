import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubites/get_weather_cubite.dart';
import 'package:weather_app/cubites/get_weather_states.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import 'package:weather_app/widgets/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return SearchView();
                  },
                ),
              );
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: BlocBuilder<GetWeatherCubite,WeatherState >(
          builder:(context,state) {
            if(state is WeatherInitialState)
              {
                return const NoWeatherBody();
              }
            else if(state is WeatherLoadedState)
              {
                return WeatherInfoBody(weather: state.weatherModel,);
              }
            else 
              {
                return const Text('opps there was an error');
              }
          }),
    );
  }
}
