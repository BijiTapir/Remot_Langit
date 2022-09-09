import 'package:flutter/material.dart';

TextStyle titleFont =
    const TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0);
TextStyle infoFont =
    const TextStyle(fontWeight: FontWeight.w400, fontSize: 18.0);

Widget additionalInformation(
    String wind, String pressure, String humidity, String feels_like) {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.all(18.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Container(
            color: Colors.lightBlueAccent,
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Wind", style: titleFont),
                SizedBox(height: 18.0),
                Text("$wind", style: infoFont),
              ],
            ),
          ),
        ),
        SizedBox(height: 6),
        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Container(
            color: Colors.lightBlueAccent,
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Pressure", style: titleFont),
                SizedBox(height: 18.0),
                Text("$pressure", style: infoFont),
              ],
            ),
          ),
        ),
        SizedBox(height: 6),
        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Container(
            color: Colors.lightBlueAccent,
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Kelembapan", style: titleFont),
                SizedBox(height: 18.0),
                Text("$humidity", style: infoFont),
              ],
            ),
          ),
        ),
        SizedBox(height: 6),
        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Container(
            color: Colors.lightBlueAccent,
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Terasa Seperti", style: titleFont),
                SizedBox(height: 18.0),
                Text("$feels_like", style: infoFont),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
