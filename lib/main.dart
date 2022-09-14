import 'dart:developer';

import 'package:cuaca_api/ganti_wilayah/ganti_wilayah.dart';
import 'package:cuaca_api/services/weather_api_client.dart';
import 'package:cuaca_api/views/additional_information.dart';
import 'package:cuaca_api/views/current_weather.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'models/weather_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherApiClient client = WeatherApiClient();
  Weather? data;
  String? kota;

  Future<void> getData() async {
    data = await client.getCurrentWeather(kota ?? "kudus");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf9f9f9),
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Color(0xFFf9f9f9),
        elevation: 0.0,
        title: const Text(
          "Remot Langit",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.location_on_outlined,
              color: Colors.black,
            ),
            onPressed: () async {
              final result = await Navigator.push(
                  context, MaterialPageRoute(builder: (context) => wilayah()));
              setState(() {
                kota = result;
              });
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 50),
                currentWeather(Icons.wb_sunny_rounded, "${data!.temp}°c",
                    "${data!.cityName}", "${data!.country}"),
                SizedBox(
                  height: 60.0,
                ),
                Text(
                  "Informasi Tambahan",
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Color(0xdd212121),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                additionalInformation(
                    "${data!.wind} km/j",
                    "${data!.pressure} mbar",
                    "${data!.humidity} %",
                    "${data!.feels_like}°c")
              ],
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container();
        },
      ),
      drawer: Drawer(
        width: MediaQuery.of(context).size.width / 2,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 6),
                Text(
                  "Other",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                ),
                SizedBox(height: 17),
                Container(
                  height: 2,
                  width: double.infinity,
                  color: Colors.grey,
                ),
                SizedBox(height: 26),
                Row(
                  children: [
                    Icon(Icons.settings_outlined),
                    SizedBox(width: 7),
                    Text("Setting", style: TextStyle(fontSize: 16),),
                  ],
                ),
                SizedBox(height: 17),
                Row(
                  children: [
                    Icon(Icons.share),
                    SizedBox(width: 7),
                    Text("Berbagi", style: TextStyle(fontSize: 16),),
                  ],
                ),
                SizedBox(height: 17),
                Row(
                  children: [
                    Icon(Icons.info_outline),
                    SizedBox(width: 7),
                    Text("Info", style: TextStyle(fontSize: 16),),
                  ],
                ),
              ],


            ),
          ),
        ),
      ),
    );
  }
}
