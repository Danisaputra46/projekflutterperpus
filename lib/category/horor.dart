import 'package:flutter/material.dart';

// ignore: must_be_immutable
class horor extends StatefulWidget {
  var c2;

  horor({@required this.c2});

  @override
  State<horor> createState() => _hororState();
}

String judulAdventure = 'Judul Buku asdasdasdasdsdadasdasdasd';
List<String> kataKata = judulAdventure.split(' ');
String judulTerpotong = kataKata.take(18).join(' ');

class _hororState extends State<horor> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQueryHeight * 0.36,
      height: 240,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        // shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) => Container(
          width: 140,
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 210,
                // height: MediaQueryHeight * 0.25,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(1, 1))
                  ],
                  // color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage('assets/buku/buku_sejarah.jpeg'),
                      fit: BoxFit.cover),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                judulTerpotong.length < judulAdventure.length
                    ? '$judulTerpotong...'
                    : judulTerpotong,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[900],
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow
                    .ellipsis, // Menambahkan ellipsis jika teks melebihi batasan
              )
            ],
          ),
        ),
      ),
    );
  }
}
