import 'package:flutter/material.dart';
import 'weather_card.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatelessWidget {
  final List<Map<String, dynamic>> citiesWeather = [
    {
      "location": "Dhaka",
      "weather": "Thunder",
      "temp": "20°C",
      "icon": Icons.thunderstorm
    },
    {
      "location": "California",
      "weather": "Clear",
      "temp": "6°C",
      "icon": Icons.wb_sunny
    },
    {
      "location": "Beijing",
      "weather": "Mostly sunny",
      "temp": "5°C",
      "icon": Icons.wb_sunny
    },
    {
      "location": "Moscow",
      "weather": "Cloudy",
      "temp": "-4°C",
      "icon": Icons.cloud
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: const Text("Weather"),
        backgroundColor: Colors.purple.shade700,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: const Text(
              "Current location",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          WeatherCard(
            location: "Dhaka",
            weather: "Thunder",
            temperature: "20°C",
            icon: Icons.thunderstorm,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Text(
              "Around the world",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: citiesWeather.length - 1,
              itemBuilder: (context, index) {
                final city =
                    citiesWeather[index + 1]; // Skip "Dhaka" (current location)
                return WeatherCard(
                  location: city["location"],
                  weather: city["weather"],
                  temperature: city["temp"],
                  icon: city["icon"],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
