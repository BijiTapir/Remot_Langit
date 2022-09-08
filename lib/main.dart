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

  Future<void> getData() async{
    data = await client.getCurrentWeather("Sunda");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf9f9f9),
      appBar: AppBar(
        backgroundColor: Color(0xFFf9f9f9),
        elevation: 0.0,
        title: const Text("Remot Langit", style: TextStyle(color: Colors.black),),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.location_on_outlined,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => wilayah()));
            },
          ),
        ],
        leading: IconButton(onPressed: (){},icon: Icon(Icons.menu),
        color: Colors.black,
        ),
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                currentWeather(Icons.wb_sunny_rounded, "${data!.temp}°c",
                "${data!.cityName}"),
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
                Divider(),
                SizedBox(
                  height: 20.0,
                ),
                additionalInformation("${data!.wind}km/j", "${data!.humidity}%", "${data!.pressure}", "${data!.feels_like}°c")
              ],
            );
          }else if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),
            );
          }
          return Container();
        },
      )
    );
  }
}

