import 'package:aplikasi_daftar_angota_perpus/screens/buku/hasilcategory.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            color: Color(0xfff012ac0),
            height: 100,
            width: double.infinity,
            alignment: Alignment.bottomLeft,
            child: Text(
              'Kategori',
              style: GoogleFonts.lato(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1),
            ),
          ),
          ListTile(
            title: Text(
              'Pendidikan',
              style: GoogleFonts.lato(
                  fontWeight: FontWeight.bold, letterSpacing: 1),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          hasilcategory(kategori: 'Pendidikan')));
            },
          ),
          ListTile(
            title: Text('Sejarah',
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                )),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          hasilcategory(kategori: 'Sejarah')));
            },
          ),
          ListTile(
            title: Text('Dongeng',
                style: GoogleFonts.lato(
                    fontWeight: FontWeight.bold, letterSpacing: 1)),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          hasilcategory(kategori: 'Dongeng')));
            },
          ),
        ],
      ),
    );
  }
}
