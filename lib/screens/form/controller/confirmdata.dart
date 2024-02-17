import 'dart:convert';

import 'package:aplikasi_daftar_angota_perpus/Services/snackbar.dart';
import 'package:aplikasi_daftar_angota_perpus/bottomnavbar/bottomnavbar.dart';
import 'package:aplikasi_daftar_angota_perpus/screens/form/controller/service/api.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import '../../../Services/globals.dart';

class Confirmasi extends StatefulWidget {
  final int userId;
  final String nama;
  final String nik;
  final String pendidikanterakhir;
  final String gender;
  final String email;
  final String alamatktp;
  final String alamatsekarang;
  final String namasekolah;
  final String nomorhp;
  final String tgllahir;
  final String listprofesi;

  Confirmasi({
    required this.userId,
    required this.nama,
    required this.nik,
    required this.pendidikanterakhir,
    required this.gender,
    required this.email,
    required this.alamatktp,
    required this.alamatsekarang,
    required this.namasekolah,
    required this.nomorhp,
    required this.tgllahir,
    required this.listprofesi,
  });

  @override
  State<Confirmasi> createState() => _ConfirmasiState();
}

class _ConfirmasiState extends State<Confirmasi> {
  bool _isButtonDisabled = false;

  void _saveDataa(BuildContext context) async {
    if (_isButtonDisabled)
      return; // Jangan lakukan apa-apa jika tombol sedang dinonaktifkan

    setState(() {
      _isButtonDisabled = true; // Nonaktifkan tombol
    });

    // Lakukan pengecekan terlebih dahulu apakah id_fluteruser sudah ada atau belum
    bool isIdExist = await checkIfIdFluteruserExists(widget.userId);

    if (isIdExist) {
      errorSnackBar(context, 'ID sudah ada, data tidak dapat disimpan');
      setState(() {
        _isButtonDisabled = false; // Aktifkan tombol kembali
      });
    } else {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Center(
            child: SizedBox(
              width: 30,
              height: 30,
              child: CircularProgressIndicator(
                color: Color(0xfff012ac0),
              ),
            ),
          );
        },
      );
      await Future.delayed(Duration(seconds: 1));
      try {
        bool isNikExist = await checkIfNikExists(widget.nik);

        if (isNikExist) {
          errorSnackBar(context, 'NIK sudah ada, data tidak dapat disimpan');
          // Tutup dialog loading
          Navigator.pop(context);
          setState(() {
            _isButtonDisabled = false; // Aktifkan tombol kembali
          });
          return; // Keluar dari fungsi _saveDataa
        }

        await http.post(Uri.parse(baseURL + 'anggota/${widget.userId}'), body: {
          "id_fluteruser": widget.userId.toString(),
          "nama": widget.nama,
          "nik": widget.nik,
          "email": widget.email,
          "alamatktp": widget.alamatktp,
          "alamatsekarang": widget.alamatsekarang,
          "intansisekolah": widget.namasekolah,
          "notelpon": widget.nomorhp,
          "tgllahir": widget.tgllahir,
          "profesi": widget.listprofesi,
          "pendidikanterakhir": widget.pendidikanterakhir,
          "jeniskelamin": widget.gender,
        }).then((response) {
          if (response.statusCode == 200) {
            successSnackBar(context, 'Data Berhasil Di Simpan');
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => BottomNavbar()),
            );
          } else {
            errorSnackBar(context, 'Tidak bisa Input Data 2 Kali');
            // Tutup dialog loading
            Navigator.pop(context);
            setState(() {
              _isButtonDisabled = false; // Aktifkan tombol kembali
            });
          }
        }).catchError((error) {
          print('Error: $error');
          final snackBar = SnackBar(
              content:
                  const Text("Terjadi Kesalahan, Silakan Coba Lagi Nanti"));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          // Tutup dialog loading
          Navigator.pop(context);
          setState(() {
            _isButtonDisabled = false; // Aktifkan tombol kembali
          });
        });
      } catch (e) {
        print('Error: $e');
        final snackBar = SnackBar(
            content: const Text("Terjadi Kesalahan, Silakan Coba Lagi Nanti"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        // Tutup dialog loading
        Navigator.pop(context);
        setState(() {
          _isButtonDisabled = false; // Aktifkan tombol kembali
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryWidht = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Confirm data',
          style: GoogleFonts.lato(
              color: Colors.white,
              letterSpacing: 1,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Color(0xfff012ac0),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color.fromARGB(255, 241, 241, 241),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 45,
                          width: 500,
                          decoration: BoxDecoration(
                            color: Colors.grey[50],
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'ID : ',
                                style: GoogleFonts.lato(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1),
                              ),
                              Text(
                                '${widget.userId}',
                                style: GoogleFonts.lato(
                                    fontSize: 20, fontWeight: FontWeight.w900),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 3),
                          child: Text(
                            'Nama :',
                            style: GoogleFonts.lato(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 50,
                          width: 500,
                          decoration: BoxDecoration(
                            color: Colors.grey[50],
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 0, left: 10, right: 5),
                            child: Row(
                              children: [
                                // Padding(
                                //   padding: const EdgeInsets.only(right: 10),
                                //   child: Icon(Icons.account_box),
                                // ),
                                Expanded(
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Text(
                                      '${widget.nama}',
                                      style: GoogleFonts.lato(
                                          color: Colors.grey.shade600,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w900,
                                          letterSpacing: 1),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 3),
                          child: Text(
                            'Nik :',
                            style: GoogleFonts.lato(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 50,
                          width: 500,
                          decoration: BoxDecoration(
                            color: Colors.grey[50],
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 0, left: 10),
                            child: Row(
                              children: [
                                Expanded(
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Text(
                                      '${widget.nik}',
                                      style: GoogleFonts.lato(
                                          color: Colors.grey.shade600,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w900,
                                          letterSpacing: 1),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 3),
                          child: Text(
                            'Nomor HP :',
                            style: GoogleFonts.lato(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 50,
                          width: 500,
                          decoration: BoxDecoration(
                            color: Colors.grey[50],
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 0, left: 10),
                            child: Row(
                              children: [
                                Expanded(
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Text(
                                      '${widget.nomorhp}',
                                      style: GoogleFonts.lato(
                                          color: Colors.grey.shade600,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w900,
                                          letterSpacing: 1),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 23),
                  child: Text(
                    'Pendidikan Terakhir : ',
                    style: GoogleFonts.lato(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    height: 50,
                    width: 500,
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 0, left: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text(
                                '${widget.pendidikanterakhir}',
                                style: GoogleFonts.lato(
                                    color: Colors.grey.shade600,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 23),
                  child: Text(
                    'Status / Profesi: ',
                    style: GoogleFonts.lato(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    height: 50,
                    width: 500,
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 0, left: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text(
                                '${widget.listprofesi}',
                                style: GoogleFonts.lato(
                                    color: Colors.grey.shade600,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 23),
                  child: Text(
                    'Jenis Kelamin:',
                    style: GoogleFonts.lato(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    height: 50,
                    width: 500,
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 0, left: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text(
                                '${widget.gender}',
                                style: GoogleFonts.lato(
                                    color: Colors.grey.shade600,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 23),
                  child: Text(
                    'Email: ',
                    style: GoogleFonts.lato(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    height: 50,
                    width: 500,
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 0, left: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text(
                                '${widget.email}',
                                style: GoogleFonts.lato(
                                    color: Colors.grey.shade600,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Alamat Sesuai KTP:',
                            style: GoogleFonts.lato(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Container(
                            height: 100,
                            width: mediaQueryWidht * 0.423,
                            // width: 170,
                            decoration: BoxDecoration(
                              color: Colors.grey[50],
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 5, left: 5, right: 5, bottom: 5),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Text(
                                        '${widget.alamatktp}',
                                        style: GoogleFonts.lato(
                                            color: Colors.grey.shade600,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w900,
                                            letterSpacing: 1),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'Alamat Sekarang:',
                            style: GoogleFonts.lato(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20),
                            height: 100,
                            width: mediaQueryWidht * 0.423,
                            // width: 181,
                            decoration: BoxDecoration(
                              color: Colors.grey[50],
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 5, left: 5, right: 5, bottom: 5),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Text(
                                        '${widget.alamatsekarang}',
                                        style: GoogleFonts.lato(
                                            color: Colors.grey.shade600,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w900,
                                            letterSpacing: 1),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 23),
                  child: Text(
                    'Nama Intansi/Sekolah: ',
                    style: GoogleFonts.lato(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    height: 50,
                    width: 500,
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 0, left: 10, right: 5),
                      child: Row(
                        children: [
                          Expanded(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text(
                                '${widget.namasekolah}',
                                style: GoogleFonts.lato(
                                    color: Colors.grey.shade600,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 23),
                  child: Text(
                    'Tempat / Tgl Lahir: ',
                    style: GoogleFonts.lato(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    height: 50,
                    width: 500,
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 0, left: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text(
                                '${widget.tgllahir}',
                                style: GoogleFonts.lato(
                                    color: Colors.grey.shade600,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xfff012ac0),
                        // elevation: 10,
                        minimumSize: Size(double.infinity, 48),
                      ),
                      onPressed: _isButtonDisabled
                          ? null
                          : () {
                              _saveDataa(context);
                            },

                      // _saveData(context).then((value) {
                      //   Navigator.push(context,
                      //       MaterialPageRoute(builder: (context) => MyFormPage()));
                      // });

                      child: Text(
                        'Simpan Data',
                        style: GoogleFonts.lato(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1,
                            fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
