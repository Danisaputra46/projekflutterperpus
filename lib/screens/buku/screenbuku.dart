import 'package:aplikasi_daftar_angota_perpus/category/sejarah.dart';
import 'package:aplikasi_daftar_angota_perpus/category/pendidikan.dart';
import 'package:aplikasi_daftar_angota_perpus/screens/buku/drawer/drawer.dart';
import 'package:aplikasi_daftar_angota_perpus/screens/buku/hasil.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../category/dongeng.dart';

// ignore: must_be_immutable
class halamanbuku extends StatefulWidget {
  @override
  State<halamanbuku> createState() => _halamanbukuState();
}

class _halamanbukuState extends State<halamanbuku> {
  @override
  Widget build(BuildContext context) {
    // final MediaQueryHeight = MediaQuery.of(context).size.height;
    // final MediaQuerywidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Buku',
          style: GoogleFonts.lato(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 1),
        ),
        backgroundColor: Color(0xfff012ac0),
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
      ),
      drawer: MyDrawer(),
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
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Pendidikan',
                      style: GoogleFonts.lato(
                          fontWeight: FontWeight.bold, letterSpacing: 1),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => hasil(kategori: 'Pendidikan'),
                          ),
                        );
                      },
                      icon: Icon(Icons.arrow_right),
                    ),
                  ],
                ),
              ),
              // pendidikan(kategori: 'Pendidikan'),
              pendidikan(kategori: ['Pendidikan']),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Sejarah',
                      style: GoogleFonts.lato(
                          fontWeight: FontWeight.bold, letterSpacing: 1),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => hasil(kategori: 'Sejarah'),
                          ),
                        );
                      },
                      icon: Icon(Icons.arrow_right),
                    ),
                  ],
                ),
              ),
              sejarah(kategori: 'Sejarah'),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Dongeng',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, letterSpacing: 1),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => hasil(kategori: 'Dongeng'),
                          ),
                        );
                      },
                      icon: Icon(Icons.arrow_right),
                    ),
                  ],
                ),
              ),
              dongeng(kategori: 'Dongeng')
            ],
          ),
        ),
      )),
    );
  }
}
