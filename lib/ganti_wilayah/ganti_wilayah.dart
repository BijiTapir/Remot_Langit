import 'package:flutter/material.dart';

class wilayah extends StatelessWidget {
  const wilayah({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFf9f9f9),
        appBar: AppBar(
          backgroundColor: Color(0xFFf9f9f9),
          elevation: 0.0,
          title: const Text(
            "Ganti Wilayah",
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
        body: Padding(
            padding: EdgeInsets.all(14),
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 14,
              mainAxisSpacing: 14,
              children: [
                ItemWilayah(
                    kota: "Bali",
                    negara: "Indonesia",
                    bendera: "https://pngimage.net/wp-content/uploads/2018/06/gambar-bendera-indonesia-png-3.png"),
                ItemWilayah(
                    kota: "Balikpapan",
                    negara: "Indonesia",
                    bendera: "https://pngimage.net/wp-content/uploads/2018/06/gambar-bendera-indonesia-png-3.png"),
                ItemWilayah(
                    kota: "Bandung",
                    negara: "Indonesia",
                    bendera: "https://pngimage.net/wp-content/uploads/2018/06/gambar-bendera-indonesia-png-3.png"),
                ItemWilayah(
                    kota: "Bogor",
                    negara: "Indonesia",
                    bendera: "https://pngimage.net/wp-content/uploads/2018/06/gambar-bendera-indonesia-png-3.png"),
                ItemWilayah(
                    kota: "Cibubur",
                    negara: "Indonesia",
                    bendera: "https://pngimage.net/wp-content/uploads/2018/06/gambar-bendera-indonesia-png-3.png"),
                ItemWilayah(
                    kota: "Demak",
                    negara: "Indonesia",
                    bendera: "https://pngimage.net/wp-content/uploads/2018/06/gambar-bendera-indonesia-png-3.png"),
                ItemWilayah(
                    kota: "Depok",
                    negara: "Indonesia",
                    bendera: "https://pngimage.net/wp-content/uploads/2018/06/gambar-bendera-indonesia-png-3.png"),
                ItemWilayah(
                    kota: "Jakarta",
                    negara: "Indonesia",
                    bendera: "https://pngimage.net/wp-content/uploads/2018/06/gambar-bendera-indonesia-png-3.png"),
                ItemWilayah(
                    kota: "Kudus",
                    negara: "Indonesia",
                    bendera: "https://pngimage.net/wp-content/uploads/2018/06/gambar-bendera-indonesia-png-3.png"),
                ItemWilayah(
                    kota: "Jepara",
                    negara: "Indonesia",
                    bendera: "https://pngimage.net/wp-content/uploads/2018/06/gambar-bendera-indonesia-png-3.png"),
                ItemWilayah(
                    kota: "Kendal",
                    negara: "Indonesia",
                    bendera: "https://pngimage.net/wp-content/uploads/2018/06/gambar-bendera-indonesia-png-3.png"),
                ItemWilayah(
                    kota: "Klaten",
                    negara: "Indonesia",
                    bendera: "https://pngimage.net/wp-content/uploads/2018/06/gambar-bendera-indonesia-png-3.png"),
                ItemWilayah(
                    kota: "Malang",
                    negara: "Indonesia",
                    bendera: "https://pngimage.net/wp-content/uploads/2018/06/gambar-bendera-indonesia-png-3.png"),
                ItemWilayah(
                    kota: "Semarang",
                    negara: "Indonesia",
                    bendera: "https://pngimage.net/wp-content/uploads/2018/06/gambar-bendera-indonesia-png-3.png"),
                ItemWilayah(
                    kota: "Pekalongan",
                    negara: "Indonesia",
                    bendera: "https://pngimage.net/wp-content/uploads/2018/06/gambar-bendera-indonesia-png-3.png"),
                ItemWilayah(
                    kota: "Purwokerto",
                    negara: "Indonesia",
                    bendera: "https://pngimage.net/wp-content/uploads/2018/06/gambar-bendera-indonesia-png-3.png"),
              ],
            )));
  }
}

// Buat gidview
class ItemWilayah extends StatelessWidget {
  ItemWilayah(
      {Key? key,
      required this.kota,
      required this.negara,
      required this.bendera})
      : super(key: key);
  String kota, negara, bendera;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context, kota);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: ClipPath(
          clipper: ShapeBorderClipper(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
          child: Container(
            height: 160,
            width: 170,
            color: Color.fromARGB(255, 239, 239, 239),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 80,
                  width: 130,
                  child: Image.network(
                    bendera,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  kota,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  negara,
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 159, 159, 159)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
