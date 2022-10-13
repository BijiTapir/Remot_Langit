import 'package:cuaca_api/database/database_helper.dart';
import 'package:cuaca_api/database/database_model.dart';
import 'package:flutter/material.dart';

class FavoriteButton extends StatefulWidget {
  FavoriteButton(
      {Key? key,
      required this.kota,
      required this.negara,
      required this.img,
      required this.isOn})
      : super(key: key);
  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();

  String kota, negara, img;
  bool isOn;
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isOn = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isOn = widget.isOn;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        setState(() {
          isOn = !isOn;
        });
        if (isOn) {
          WilayahModel wilayahModel = WilayahModel(
              kota: widget.kota, negara: widget.negara, img: widget.img);
          await DatabaseHelper.instance.create(wilayahModel);
          print("Menambahkan ${widget.kota} ke Database");
        } else {
          await DatabaseHelper.instance.delete(widget.kota);
          print("Menghapus ${widget.kota} dari Database");
        }
      },
      child: Container(
        height: 34,
        width: 34,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(12),
            bottomLeft: Radius.circular(20),
          ),
          color: Color.fromARGB(255, 216, 216, 216),
        ),
        child: Icon(
          isOn ? Icons.favorite : Icons.favorite_border,
          size: 20,
          color: Color.fromARGB(255, 213, 70, 70),
        ),
      ),
    );
  }
}
