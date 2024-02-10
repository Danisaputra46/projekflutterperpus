import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Services/auth_services.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class Profil extends StatefulWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  State<Profil> createState() => _ProfilState();
}

// late bool isLoading = true;
// isLoading
// ? Center(child: CircularProgressIndicator())
// :
late int userId;
late Map<String, dynamic> anggotaData =
    {}; // Menggunakan Map untuk satu anggota

class _ProfilState extends State<Profil> {
  void initState() {
    super.initState();
    // Panggil metode untuk mengambil data dari SharedPreferences saat widget diinisialisasi
    getUserData();

    // Panggil fetchData untuk mengambil data berdasarkan userId
    // fetchDataByIdFluterUser(1);
  }

  Future<void> getUserData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    // Ambil nilai name, token, dan id dari SharedPreferences
    // userName = preferences.getString('username') ?? 'Nama Tidak Ditemukan';
    userId = preferences.getInt('id') ??
        -1; // Ganti -1 dengan nilai default yang sesuai
    // Panggil setState untuk memperbarui tampilan
    setState(() {});

    // Panggil fetchData dengan userId yang sudah didapat
    fetchDataByIdFluterUser(userId);
  }

  Future<void> fetchDataByIdFluterUser(int idFluterUser) async {
    try {
      final response = await API().getDataByIdFluterUser(idFluterUser);

      if (response.statusCode == 200) {
        final decodedData = json.decode(response.body);
        if (decodedData is Map<String, dynamic>) {
          // Tidak perlu mengonversi anggota menjadi List
          setState(() {
            anggotaData = decodedData['data'];
            // isLoading = false;
          });
        } else {
          throw Exception('Format respons tidak sesuai');
        }
      } else {
        throw Exception('Gagal mengambil data dari server');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  AssetImage _getProfileImage(String? gender) {
    if (gender == 'Laki-laki') {
      return AssetImage(
          'assets/profil/profilecowo.png'); // Ganti dengan path gambar pria
    } else if (gender == 'Perempuan') {
      return AssetImage(
          'assets/profil/profilcewe.png'); // Ganti dengan path gambar wanita
    } else {
      return AssetImage(
          'assets/profil/profilkosong.png'); // Ganti dengan path gambar default atau sesuai kebutuhan
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 241, 241, 241),
      appBar: AppBar(
          title: Text(
            "My Profile",
            style: GoogleFonts.lato(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              letterSpacing: 2,
            ),
          ),
          centerTitle: true,
          // backgroundColor: Colors.green,
          backgroundColor: Color(0xfff012ac0),
          automaticallyImplyLeading: false),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: Container(
          // color: Color.fromARGB(255, 241, 241, 241),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          maxRadius: 50,
                          minRadius: 50,
                          // backgroundImage: AssetImage('assets/profil/profil.png'),
                          backgroundImage:
                              _getProfileImage(anggotaData['jeniskelamin']),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${anggotaData['nama']}'.toUpperCase(),
                                style: GoogleFonts.lato(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1,
                                ),
                              ),
                              Text(
                                '${anggotaData['email']}',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Divider(
                    height: 2,
                    thickness: 2,
                    color: Colors.grey.shade400,
                  ),
                ),
                IntrinsicHeight(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 32),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nik',
                              style: GoogleFonts.lato(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                letterSpacing: 1,
                              ),
                            ),
                            Text(
                              '${anggotaData['nik']}',
                              style: GoogleFonts.lato(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 90, // Adjust the height as needed
                        child: VerticalDivider(
                          width: 50,
                          thickness: 2,
                          color: Colors.grey.shade400,
                          indent: 5,
                          endIndent: 5,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nomor HP',
                            style: GoogleFonts.lato(
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            '${anggotaData['notelpon']}',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Divider(
                    height: 2,
                    thickness: 2,
                    color: Colors.grey.shade400,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Divider(
                  thickness: 10,
                  color: Colors.grey.shade300,
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                    child: Row(
                      children: [
                        Icon(
                          Icons.school_rounded,
                          color: Color(0xfff012ac0),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Flexible(
                          child: Text(
                            '${anggotaData['pendidikanterakhir']}',
                            style: GoogleFonts.lato(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Divider(
                    height: 30,
                    thickness: 2,
                    color: Colors.grey.shade400,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                    child: Row(
                      children: [
                        Icon(
                          Icons.work_rounded,
                          color: Color(0xfff012ac0),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Flexible(
                          child: Text(
                            '${(anggotaData['profesi'])}',
                            style: GoogleFonts.lato(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              // color: Colors.gre,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Divider(
                    height: 40,
                    thickness: 2,
                    color: Colors.grey.shade400,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 3),
                          child: Image.asset(
                            'assets/profil/office.png',
                            width: 20,
                            color: Color(0xfff012ac0),
                          ),
                        ),
                        // Icon(Icons.wallet),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              '${anggotaData['intansisekolah']}',
                              style: GoogleFonts.lato(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Divider(
                    height: 40,
                    thickness: 2,
                    color: Colors.grey.shade400,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 3),
                          child: Image.asset(
                            'assets/profil/location.png',
                            width: 20,
                            color: Color(0xfff012ac0),
                          ),
                        ),
                        // Icon(Icons.),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              '${anggotaData['alamatsekarang']}',
                              style: GoogleFonts.lato(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Divider(
                    height: 40,
                    thickness: 2,
                    color: Colors.grey.shade400,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 3),
                          child: Image.asset(
                            'assets/profil/male-and-female.png',
                            width: 20,
                            color: Color(0xfff012ac0),
                          ),
                        ),
                        // Icon(Icons.man),
                        SizedBox(
                          width: 15,
                        ),
                        Flexible(
                          child: Text(
                            '${anggotaData['jeniskelamin']}',
                            style: GoogleFonts.lato(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Divider(
                    height: 40,
                    thickness: 2,
                    color: Colors.grey.shade400,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                    child: Row(
                      children: [
                        Icon(
                          Icons.calendar_month,
                          color: Color(0xfff012ac0),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Flexible(
                          child: Text(
                            '${anggotaData['tgllahir']}',
                            style: GoogleFonts.lato(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Divider(
                    height: 40,
                    thickness: 2,
                    color: Colors.grey.shade400,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  thickness: 10,
                  color: Colors.grey.shade300,
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: InkWell(
                    onTap: () {
                      restartApp();
                    },
                    child: Container(
                      child: Row(
                        children: [
                          Icon(
                            Icons.exit_to_app,
                            color: Colors.red,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Flexible(
                            child: Text(
                              'Exit',
                              style: GoogleFonts.lato(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Divider(
                    height: 40,
                    thickness: 2,
                    color: Colors.grey.shade400,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  thickness: 10,
                  color: Colors.grey.shade300,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
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

void restartApp() {
  exit(0); // Close the current instance of the app

//   // Note: The exit(0) method is used here. It immediately terminates
//   // the Dart program. Make sure to use it appropriately in your application.
//   // This method should not be used in a production-ready app as it
//   // abruptly closes the app without any cleanup.
}
