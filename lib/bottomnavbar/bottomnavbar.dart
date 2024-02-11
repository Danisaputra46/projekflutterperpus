import 'package:aplikasi_daftar_angota_perpus/screens/buku/screenbuku.dart';
import 'package:aplikasi_daftar_angota_perpus/screens/data/profil.dart';
import 'package:aplikasi_daftar_angota_perpus/screens/form/form.dart';
import 'package:aplikasi_daftar_angota_perpus/screens/home.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

List Screens = [
  Home(),
  MyFormPage(),
  halamanbuku(),
  Profil(),
];

int _selectedIndex = 0;

class _BottomNavbarState extends State<BottomNavbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        // backgroundColor: Colors.grey.shade300,
        // color: Colors.green,
        color: Color(0xfff012ac0),
        animationDuration: Duration(milliseconds: 300),
        index: _selectedIndex,
        items: [
          Icon(
            Icons.home,
            color: Colors.white,
            size: 30,
          ),
          Icon(
            Icons.assignment,
            color: Colors.white,
            size: 30,
          ),
          Icon(
            Icons.menu_book,
            color: Colors.white,
            size: 30,
          ),
          Icon(
            Icons.assignment_ind,
            color: Colors.white,
            size: 30,
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      body: Screens[_selectedIndex],
    );
  }
}
