import 'package:flutter/material.dart';

// ignore: must_be_immutable
class pendidikan extends StatefulWidget {
  var c3;

  pendidikan({@required this.c3});

  @override
  State<pendidikan> createState() => pendidikanState();
}

String judulPendidikan = 'Ini judul Pendidikan';
List<String> split = judulPendidikan.split(' ');
String batas = split.take(18).join(' ');

class pendidikanState extends State<pendidikan> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Container(
          width: 140,
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 210,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(1, 1))
                  ],
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage('assets/buku/buku_flutter.jpg'),
                      fit: BoxFit.cover),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                split.length < judulPendidikan.length ? '$batas...' : batas,
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[900],
                    fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        ),
      ),
    );
  }
}
