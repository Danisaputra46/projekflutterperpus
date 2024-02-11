import 'package:aplikasi_daftar_angota_perpus/Services/apibuku.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DetailBuku extends StatefulWidget {
  // final Map<String, dynamic> buku;
  final int idBuku;
  DetailBuku({
    required this.idBuku,
  });

  @override
  State<DetailBuku> createState() => _DetailBukuState();
}

class _DetailBukuState extends State<DetailBuku> {
  Map<String, dynamic> detailBuku = {};
  bool isLoading = true;

  void initState() {
    super.initState();
    _loadDetailBuku(widget.idBuku);
  }

  void _loadDetailBuku(int idBuku) async {
    try {
      // var url = Uri.parse(
      //     'http://192.168.1.14:8000/api/daftarbukuid/$idBuku'); // Sesuaikan dengan URL endpoint API Anda
      // var response = await http.get(url);
      final response = await BukuService().bukuid(idBuku);

      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        // print(responseData);
        await Future.delayed(Duration(milliseconds: 500));
        setState(() {
          detailBuku = responseData['data'];
          isLoading = false;
        });
      } else {
        print('Gagal memuat data: ${response.statusCode}');
      }
    } catch (error) {
      print('Terjadi kesalahan: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Detail',
          style: GoogleFonts.lato(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 1),
        ),
        backgroundColor: Color(0xfff012ac0),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Container(
                  height: 400,
                  width: MediaQueryWidth * 1,
                  decoration: BoxDecoration(
                    color: Color(0xfff012ac0),
                    image: DecorationImage(
                        opacity: 0.4,
                        image: AssetImage('assets/halamanbuku/overlay.png'),
                        fit: BoxFit.cover),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 230,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: NetworkImage(
                                    // 'http://192.168.1.14:8000/api/gambarbuku/${daftarBuku[index]['foto']}'
                                    BukuService.getGambarBukuUrl(
                                        detailBuku['foto'])),
                                fit: BoxFit.cover),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: Text(
                            '${detailBuku['judul']}',
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.lato(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          'by ${detailBuku['penerbit']}',
                          style: GoogleFonts.lato(
                              color: Colors.grey[400], fontSize: 15),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Rating',
                                  style: GoogleFonts.lato(
                                      fontSize: 15, color: Colors.grey[400]),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Not avaible',
                                  style: GoogleFonts.lato(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  'Pages',
                                  style: GoogleFonts.lato(
                                      fontSize: 15, color: Colors.grey[400]),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '${detailBuku['halaman']}',
                                  style: GoogleFonts.lato(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  'Language',
                                  style: GoogleFonts.lato(
                                      fontSize: 15, color: Colors.grey[400]),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '${detailBuku['bahasa']}',
                                  style: GoogleFonts.lato(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  'Publish date',
                                  style: GoogleFonts.lato(
                                      fontSize: 15, color: Colors.grey[400]),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '2021/02/02',
                                  style: GoogleFonts.lato(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: SafeArea(
                    child: SingleChildScrollView(
                      child: Container(
                        margin: EdgeInsets.only(
                            left: 20, right: 20, top: 20, bottom: 20),
                        width: MediaQueryWidth * 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'What`s it about?',
                              style: GoogleFonts.lato(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              ' ${detailBuku['deskripsi']}',
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.lato(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
