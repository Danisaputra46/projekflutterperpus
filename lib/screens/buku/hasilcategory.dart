import 'package:aplikasi_daftar_angota_perpus/loading/hasilcategory/loadinghasilcategory.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:aplikasi_daftar_angota_perpus/Services/apibuku.dart';
import 'package:aplikasi_daftar_angota_perpus/screens/buku/detailbuku.dart';
import 'package:google_fonts/google_fonts.dart';

class hasilcategory extends StatefulWidget {
  final String kategori;
  hasilcategory({required this.kategori});

  @override
  State<hasilcategory> createState() => _hasilcategoryState();
}

class _hasilcategoryState extends State<hasilcategory> {
  List<dynamic> daftarBuku = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadDataBuku(widget.kategori);
  }

  void _loadDataBuku(String kategori) async {
    try {
      final response = await BukuService().kategori(kategori);

      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        await Future.delayed(Duration(milliseconds: 500));
        setState(() {
          daftarBuku = responseData['data'];
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfff012ac0),
        centerTitle: true,
        title: Text(
          widget.kategori,
          style: GoogleFonts.lato(
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
              color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: isLoading
          ? ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 10,
              itemBuilder: (context, index) => loadinghasilcategory(),
            )
          : Container(
              margin: EdgeInsets.only(top: 10),
              child: ListView.builder(
                itemCount: daftarBuku.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) => Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  height: 280,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      opacity: 0.4,
                      image: AssetImage('assets/halamanbuku/overlay.png'),
                      fit: BoxFit.cover,
                    ),
                    color: Color(0xfff012ac0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 15),
                            height: 220,
                            width: 150,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      BukuService.getGambarBukuUrl(
                                          daftarBuku[index]['foto'])),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          )
                        ],
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 15, top: 30, right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Text(
                                  daftarBuku[index]['judul'],
                                  maxLines: 2,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.lato(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                daftarBuku[index]['penerbit'],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.lato(
                                    color: Colors.grey[400], fontSize: 15),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Page Count - ${daftarBuku[index]['halaman']}',
                                style: GoogleFonts.lato(
                                    color: Colors.grey[400], fontSize: 15),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '⭐ Not rating avaible',
                                style: GoogleFonts.lato(
                                    color: Colors.grey[400], fontSize: 15),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DetailBuku(
                                            idBuku: daftarBuku[index]['id']),
                                      ));
                                },
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(0))),
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.black),
                                ),
                                child: Text(
                                  'Details',
                                  style: GoogleFonts.lato(
                                      color: Colors.white, letterSpacing: 1),
                                ),
                              )
                            ],
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
