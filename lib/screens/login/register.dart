import 'dart:convert';

import 'package:aplikasi_daftar_angota_perpus/Services/auth_services.dart';
import 'package:aplikasi_daftar_angota_perpus/screens/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
// import '../../Services/globals.dart';
import '../../Services/snackbar.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String _firstname = '';
  String _lastname = '';
  String _username = '';
  String _password = '';

  createAccountPressed() async {
    bool nameValid = RegExp(r'^[a-zA-Z0-9]{3,16}$').hasMatch(_username);
    if (nameValid) {
      http.Response response = await AuthServices.register(
          _username, _password, _firstname, _lastname);
      Map<String, dynamic> responseMap =
          jsonDecode(response.body) as Map<String, dynamic>;
      if (response.statusCode == 200) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => LoginPage(),
          ),
        );
      } else {
        String errorMessage = extractErrorMessage(responseMap);
        errorSnackBar(context, errorMessage);
      }
    } else {
      errorSnackBar(context, 'Kolom Tidak Boleh Kosong');
    }
  }

  String extractErrorMessage(Map<String, dynamic> responseMap) {
    // Periksa apakah respons mengandung kunci "error"
    if (responseMap.containsKey('error')) {
      // Periksa apakah ada pesan kesalahan terkait bidang "firstname"
      if (responseMap['error'].containsKey('firstname')) {
        // Kembalikan pesan kesalahan untuk bidang "firstname"
        return responseMap['error']['firstname'][0];
      }
      if (responseMap['error'].containsKey('lastname')) {
        // Kembalikan pesan kesalahan untuk bidang "firstname"
        return responseMap['error']['lastname'][0];
      }
      if (responseMap['error'].containsKey('username')) {
        // Kembalikan pesan kesalahan untuk bidang "firstname"
        return responseMap['error']['username'][0];
      }
      if (responseMap['error'].containsKey('password')) {
        // Kembalikan pesan kesalahan untuk bidang "firstname"
        return responseMap['error']['password'][0];
      }
    }

    // Jika tidak ada pesan kesalahan spesifik yang ditemukan, kembalikan pesan umum
    return 'Terjadi kesalahan';
  }

  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidht = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 16 / 15,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      InteractiveViewer(
                        child: Image.asset(
                          'assets/splash_screens/panduan/backgroundperpus.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        color: Colors.green.withOpacity(0.5),
                      ),
                      Positioned.fill(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Colors.white,
                                size: 75,
                                shadows: [
                                  Shadow(
                                    color: Colors.black,
                                    offset: Offset(-1, -1),
                                  ),
                                  Shadow(
                                    color: Colors.black,
                                    offset: Offset(1, -1),
                                  ),
                                  Shadow(
                                    color: Colors.black,
                                    offset: Offset(1, 1),
                                  ),
                                  Shadow(
                                    color: Colors.black,
                                    offset: Offset(-1, 1),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Dinas Perpustakaan dan Kearsipan Kota Samarinda",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  shadows: [
                                    Shadow(
                                      color: Colors.black,
                                      offset: Offset(-1, -1),
                                    ),
                                    Shadow(
                                      color: Colors.black,
                                      offset: Offset(1, -1),
                                    ),
                                    Shadow(
                                      color: Colors.black,
                                      offset: Offset(1, 1),
                                    ),
                                    Shadow(
                                      color: Colors.black,
                                      offset: Offset(-1, 1),
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Positioned(
                      //   bottom: 0,
                      //   left: 0,
                      //   right: 0,
                      //   child: ClipRRect(
                      //     borderRadius: BorderRadius.only(
                      //       topLeft: Radius.circular(50),
                      //       topRight: Radius.circular(50),
                      //     ),
                      //     child: Container(
                      //       height: 40,
                      //       // height: 100,
                      //       color: Colors.grey.shade200,
                      //     ),
                      //   ),
                      // ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50),
                          ),
                          child: Container(
                            height: 60,
                            color: Colors.grey.shade200,
                            child: Padding(
                              padding: EdgeInsets.all(0.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(width: 30),
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(right: 30),
                                      child: Text(
                                        "Register",
                                        style: GoogleFonts.lato(
                                            color: Colors.green,
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // First Name
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "First Name",
                              style: GoogleFonts.lato(
                                color: Colors.green,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                            SizedBox(height: 8),
                            Container(
                              width: mediaQueryWidht * 0.41,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.green),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Masukkan First Name',
                                  ),
                                  onChanged: (value) {
                                    _firstname = value;
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        // Last Name
                        Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Last Name",
                                style: GoogleFonts.lato(
                                  color: Colors.green,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                              SizedBox(height: 8),
                              Container(
                                width: mediaQueryWidht * 0.41,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.green),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Masukkan Last Name',
                                    ),
                                    onChanged: (value) {
                                      _lastname = value;
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Text(
                          "Username",
                          style: GoogleFonts.lato(
                            color: Colors.green,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.green),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Masukan Username',
                              ),
                              onChanged: (value) {
                                _username = value;
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Text(
                          "Password",
                          style: GoogleFonts.lato(
                            color: Colors.green,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.green),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    obscureText: _obscureText,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Masukan Password',
                                    ),
                                    onChanged: (value) {
                                      _password = value;
                                    },
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(
                                    _obscureText
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Colors.green,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _obscureText = !_obscureText;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // Gantilah LoginPage() dengan halaman atau tindakan yang diinginkan
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Text(
                                'Sudah Punya Akun',
                                style: GoogleFonts.lato(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: mediaQueryHeight * 0.1,
                        child: Align(
                          alignment: Alignment.center,
                          child: ElevatedButton(
                            onPressed: () {
                              createAccountPressed();
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 140, vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                                side: BorderSide(color: Colors.black),
                              ),
                              backgroundColor: Colors.green,
                            ),
                            child: Text(
                              'Register',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
