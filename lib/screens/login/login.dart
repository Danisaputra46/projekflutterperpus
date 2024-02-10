import 'package:aplikasi_daftar_angota_perpus/bottomnavbar/bottomnavbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './register.dart';
import 'package:http/http.dart' as http;
// import '../../Services/globals.dart';
import '../../Services/snackbar.dart';
import 'package:aplikasi_daftar_angota_perpus/Services/auth_services.dart';
import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _username = '';
  String _password = '';

  loginPressed() async {
    if (_username.isNotEmpty && _password.isNotEmpty) {
      http.Response response = await AuthServices.login(_username, _password);

      if (response.statusCode == 200) {
        Map<String, dynamic>? responseMap = jsonDecode(response.body);

        if (responseMap != null && responseMap.containsKey('user')) {
          // Simpan data pengguna ke SharedPreferences
          SharedPreferences preferences = await SharedPreferences.getInstance();
          preferences.setInt('id', responseMap['user']['id']);
          preferences.setString('username', responseMap['user']['username']);
          preferences.setString('password', responseMap['user']['password']);
          preferences.setString('firstname', responseMap['user']['firstname']);
          preferences.setString('lastname', responseMap['user']['lastname']);
          preferences.setString('token', responseMap['token']);

          // Navigasi ke halaman Home
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => BottomNavbar(),
            ),
          );
        } else {
          errorSnackBar(context,
              'Respons dari backend tidak sesuai atau tidak mengandung objek user.');
        }
      } else {
        errorSnackBar(context, 'Username atau Password Salah !!');
      }
    } else {
      errorSnackBar(context, 'Masukkan semua kolom yang diperlukan');
    }
  }

  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 16 / 14,
                child: Stack(
                  // clipBehavior: Clip.none,
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
                              style: GoogleFonts.lato(
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
                          height: 40,
                          color: Colors.grey.shade200,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Text(
                              //   " Selamat Datang",
                              //   style: TextStyle(
                              //     color: Color(0xFF22BC32),
                              //     fontSize: 27,
                              //     fontStyle: FontStyle.normal,
                              //     fontWeight: FontWeight.bold,
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: 30),
                    Expanded(
                      child: Text(
                        "Selamat Datang",
                        style: GoogleFonts.lato(
                            color: Colors.green,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: 30),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: 30),
                        child: Text(
                          "Silahkan Login Terlebih Dahulu, Jika Belum Punya Akun Silakan Register Dulu",
                          style: GoogleFonts.lato(
                              color: Colors.black54,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 30),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: 30),
                        child: Text(
                          "Login",
                          style: GoogleFonts.lato(
                              color: Colors.green,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
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
                    SizedBox(height: 10),
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
                            builder: (context) => RegisterPage(),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            padding: EdgeInsets.only(right: 20),
                            child: Text(
                              'Belum Punya akun? register di sini',
                              style: GoogleFonts.lato(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: ElevatedButton(
                          onPressed: () {
                            loginPressed();
                            // loginUser();
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: 149, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              side: BorderSide(color: Colors.black),
                            ),
                            backgroundColor: Colors.green,
                          ),
                          child: SafeArea(
                            child: Text(
                              'Login',
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
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
