import 'package:cuaca_api/database/database_helper.dart';
import 'package:cuaca_api/database/database_model.dart';
import 'package:cuaca_api/views/favorite_button.dart';
import 'package:cuaca_api/ganti_wilayah/ganti_wilayah.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => FavoritePageState();
}

class FavoritePageState extends State<FavoritePage> {
  List<WilayahModel> dataListWilayah = [];
  bool isLoading = false;

  void getDatabase() async {
    dataListWilayah = await DatabaseHelper.instance.readAll();
    setState(() {
      isLoading = true;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf9f9f9),
      appBar: AppBar(
        backgroundColor: Color(0xFFf9f9f9),
        elevation: 0.0,
        title: const Text(
          "Favorit Wilayah",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: isLoading
          ? Padding(
              padding: EdgeInsets.all(14),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: dataListWilayah.length,
                itemBuilder: (context, index) {
                  final list = dataListWilayah[index];
                  return ItemWilayah(
                      kota: list.kota, negara: list.negara, bendera: list.img);
                },
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
