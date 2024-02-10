import 'package:aplikasi_daftar_angota_perpus/category/horor.dart';
import 'package:aplikasi_daftar_angota_perpus/category/pendidikan.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../category/adventure.dart';

// ignore: must_be_immutable
class halamanbuku extends StatefulWidget {
  var c1;
  var c2;
  var c3;
  var c4;

  halamanbuku({@required this.c1});

  @override
  State<halamanbuku> createState() => _halamanbukuState();
}

String judulAdventure = 'Judul  Buku Advemture';
List<String> katakata = judulAdventure.split(' ');
String judulTerpotong = katakata.take(18).join(' ');

class _halamanbukuState extends State<halamanbuku> {
  void initState() {
    super.initState();
    print(widget.c1);
  }

  @override
  Widget build(BuildContext context) {
    // final MediaQueryHeight = MediaQuery.of(context).size.height;
    // final MediaQuerywidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Column(
            children: [
              Container(
                height: 300,
                // height: MediaQueryHeight * 0.4,
                // color: Colors.amber,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/halamanbuku/perpustakaan.jpg',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          // color: Colors.green.withOpacity(0.4),
                          color: Color(0xfff012ac0).withOpacity(0.4),
                        ),
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 80),
                            child: Container(
                              height: 40,
                              child: TextField(
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    contentPadding: EdgeInsets.all(10),
                                    hintText: "Search Book...",
                                    prefixIcon: Icon(Icons.search),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(40),
                                        borderSide: BorderSide.none)),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              'SEARCH',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // SizedBox(
              //   height: 5,
              // ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Dongeng',
                      style: GoogleFonts.lato(
                          fontWeight: FontWeight.bold, letterSpacing: 1),
                    ),
                    Icon(Icons.arrow_right),
                  ],
                ),
              ),
              adventure(c1: widget.c1),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Sejarah',
                      style: GoogleFonts.lato(
                          fontWeight: FontWeight.bold, letterSpacing: 1),
                    ),
                    Icon(Icons.arrow_right),
                  ],
                ),
              ),
              horor(c2: widget.c2),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Pendidikan',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, letterSpacing: 1),
                    ),
                    Icon(Icons.arrow_right),
                  ],
                ),
              ),
              pendidikan(c3: widget.c3)
            ],
          ),
        ),
      )),
    );
  }
}
