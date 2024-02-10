import 'dart:convert';
import 'package:aplikasi_daftar_angota_perpus/Services/auth_services.dart';
import 'package:aplikasi_daftar_angota_perpus/screens/data/profil.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'form/form.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

StreamController<DateTime> _streamController = StreamController<DateTime>();

int totalAnggota = 0;
int anggotaCowo = 0;
int anggotaCewe = 0;

late String firstname;
late String lastname;

class _HomeState extends State<Home> {
  void initState() {
    super.initState();
    // Panggil metode untuk mengambil data dari SharedPreferences saat widget diinisialisasi
    getUserData();
    getJumlahAnggota();
    _streamController = StreamController<DateTime>();
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (mounted) {
        _streamController.add(DateTime.now());
      }
    });
  }

  void dispose() {
    if (!_streamController.isClosed) {
      _streamController.close();
    }
    super.dispose();
  }

  Future<void> getUserData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    // Ambil nilai name dan token dari SharedPreferences
    firstname = preferences.getString('firstname') ?? 'Nama Tidak Ditemukan';
    lastname = preferences.getString('lastname') ?? 'Nama Tidak Ditemukan';
    // Panggil setState untuk memperbarui tampilan
    setState(() {});
  }

  Future<void> getJumlahAnggota() async {
    try {
      API api = API();
      http.Response response = await api.getJumlahAnggota();

      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        setState(() {
          totalAnggota = data['total_anggota'];
          anggotaCowo = data['anggota_cowo'];
          anggotaCewe = data['anggota_cewe'];
        });
      } else {
        // Handle error jika diperlukan
        print(
            'Failed to get jumlah anggota. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle error jika diperlukan
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    // final mediaQueryHeight = MediaQuery.of(context).size.height;
    // final mediaQueryWidht = MediaQuery.of(context).size.width;
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 241, 241, 241),
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              padding:
                  EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 10),
              decoration: BoxDecoration(
                // color: Color(0xFF674AEF),
                // color: Colors.green,
                color: Color(0xfff012ac0),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.dashboard,
                        size: 30,
                        color: Colors.white,
                      ),
                      Icon(
                        Icons.dashboard_sharp,
                        size: 30,
                        color: Colors.white,
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.only(left: 3, bottom: 15),
                    child: Text(
                      "Hi, ${firstname.toUpperCase()} ${lastname.toUpperCase()}",
                      // "Hi, $userName",
                      style: GoogleFonts.roboto(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                          wordSpacing: 2,
                          color: Colors.white),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5, bottom: 20),
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5,
                            // color: Colors.green.shade800,
                            color: Color(0xfff012ac0),
                            offset: Offset(0, 5),
                          )
                        ]),
                    child: StreamBuilder<DateTime>(
                      stream: _streamController.stream,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          String formattedTime =
                              DateFormat('HH:mm:ss').format(snapshot.data!);
                          String formattedDate =
                              DateFormat('dd-MM-yyyy').format(snapshot.data!);
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Bagian waktu (jam)
                              Row(
                                children: [
                                  Icon(
                                    Icons.access_time,
                                    color: Colors.black54,
                                    size: 20,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    formattedTime,
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      wordSpacing: 1,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                  width:
                                      50), // Memberikan jarak antara waktu dan tanggal
                              // Bagian tanggal
                              Row(
                                children: [
                                  Icon(
                                    Icons.calendar_today,
                                    color: Colors.black54,
                                    size: 20,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    formattedDate,
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      wordSpacing: 1,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        } else {
                          return CircularProgressIndicator();
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                height: 110,
                width: 200,
                // color: Colors.lightBlue,
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade500,
                          offset: Offset(4.0, 4.0),
                          blurRadius: 15.0,
                          spreadRadius: 1.0),
                      BoxShadow(
                          color: Colors.grey.shade200,
                          offset: Offset(-4.0, -4.0),
                          blurRadius: 15.0,
                          spreadRadius: 1)
                    ]),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 25, left: 20),
                          child: Text(
                            'TOTAL ANGGOTA',
                            style: GoogleFonts.lato(
                              color: Colors.blue,
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              wordSpacing: 1,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 5),
                          child: Text(
                            totalAnggota.toString(),
                            style: GoogleFonts.lato(
                                color: Colors.black54,
                                letterSpacing: 1,
                                fontSize: 20,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      top: 28,
                      right: 20,
                      child: Image.asset(
                        'assets/dashboard/user.png',
                        width: 50,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                height: 110,
                width: 200,
                // color: Colors.lightBlue,
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade500,
                          offset: Offset(4.0, 4.0),
                          blurRadius: 15.0,
                          spreadRadius: 1.0),
                      BoxShadow(
                          color: Colors.grey.shade200,
                          offset: Offset(-4.0, -4.0),
                          blurRadius: 15.0,
                          spreadRadius: 1)
                    ]),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 25, left: 20),
                          child: Text(
                            'JUMLAH ANGGOTA COWO',
                            style: GoogleFonts.lato(
                              color: Colors.green,
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              wordSpacing: 1,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 5),
                          child: Text(
                            anggotaCowo.toString(),
                            style: GoogleFonts.lato(
                                color: Colors.black54,
                                letterSpacing: 1,
                                fontSize: 20,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      // top: 33,
                      // right: 18,
                      top: 28,
                      right: 20,
                      child: Image.asset(
                        'assets/dashboard/man.png',
                        width: 50,
                        color: Colors.green,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Container(
                margin: EdgeInsets.all(12),
                height: 110,
                width: 200,
                // color: Colors.lightBlue,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade500,
                        offset: Offset(4.0, 4.0),
                        blurRadius: 15.0,
                        spreadRadius: 1.0),
                    BoxShadow(
                        color: Colors.grey.shade200,
                        offset: Offset(-4.0, -4.0),
                        blurRadius: 15.0,
                        spreadRadius: 1.0)
                  ],
                ),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 25, left: 20),
                          child: Text(
                            'JUMLAH ANGGOTA CEWE',
                            style: GoogleFonts.lato(
                              color: Colors.red,
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              wordSpacing: 1,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 5),
                          child: Text(
                            anggotaCewe.toString(),
                            style: GoogleFonts.lato(
                              color: Colors.black54,
                              letterSpacing: 1,
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      top: 28,
                      right: 20,
                      child: Image.asset(
                        'assets/dashboard/woman.png',
                        width: 50,
                        color: Colors.red,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void home(BuildContext context) {
  // Navigator.pushNamed(context, '/form');
  Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
}

void formOnTap(BuildContext context) {
  // Navigator.pushNamed(context, '/form');
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => MyFormPage()));
}

void dataOnTap(BuildContext context) {
  // Navigator.pushNamed(context, '/data');
  Navigator.push(context, MaterialPageRoute(builder: (context) => Profil()));
}

void bukuOnTap(BuildContext context) {
  // Navigator.pushNamed(context, '/buku');
  print("Halaman buku");
}

void performLogout(BuildContext context) async {
  // Add your logout logic here, such as clearing user data
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.clear(); // Clear all stored data
  Navigator.of(context).pop(); // Close the dialog
  // Navigate to login or any other screen after logout
  // For example:
  Navigator.pushReplacementNamed(context, '/login');
}

// void performLogout(BuildContext context) async {
//   // Add your logout logic here, such as clearing user data
//   SharedPreferences preferences = await SharedPreferences.getInstance();
//   preferences.clear(); // Clear all stored data
//   Navigator.of(context).pop(); // Close the dialog

//   // Restart the application
//   restartApp();
// }


