import 'package:aplikasi_daftar_angota_perpus/loading/hasilcategory/loadinghasilcategory.dart';
import 'package:aplikasi_daftar_angota_perpus/screens/buku/search/modelbuku.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:aplikasi_daftar_angota_perpus/Services/apibuku.dart';
import 'package:aplikasi_daftar_angota_perpus/screens/buku/detailbuku.dart';
import 'package:google_fonts/google_fonts.dart';

class hasilsearch extends StatefulWidget {
  final String query; // Tambahkan parameter query
  hasilsearch({required this.query});

  @override
  State<hasilsearch> createState() => _hasilsearchState();
}

class _hasilsearchState extends State<hasilsearch> {
  List<Buku> _searchResults = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    searchBooks(widget.query);
  }

  // Fungsi untuk melakukan pencarian
  void searchBooks(String query) async {
    // var response = await http
    //     .get(Uri.parse('http://192.168.1.14:8000/api/search?query=$query'));
    final response = await BukuService().search(query);

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);

      // Periksa apakah respons memiliki data buku
      if (jsonResponse['data'] != null && jsonResponse['data'].length > 0) {
        List<dynamic> bookList = jsonResponse['data'];

        // Buat list baru untuk menyimpan hasil pencarian
        List<Buku> searchResults = [];

        // Konversi setiap objek dinamis menjadi objek Buku
        for (var bookData in bookList) {
          Buku book = Buku.fromJson(bookData);
          searchResults.add(book);
        }
        await Future.delayed(Duration(milliseconds: 500));
        setState(() {
          _searchResults = searchResults;
          isLoading = false;
        });
      } else {
        // Tidak ada hasil yang ditemukan, atur _searchResults menjadi kosong
        setState(() {
          _searchResults = [];
          isLoading = false;
        });
      }
    } else {
      print('Error: ${response.reasonPhrase}');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfff012ac0),
        centerTitle: true,
        title: Text(
          "hasil",
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
          : _searchResults
                  .isEmpty // Tambahkan pengecekan apakah _searchResults kosong
              ? Center(
                  child: Text(
                    'Judul yang Anda cari tidak ada',
                    style: TextStyle(fontSize: 18),
                  ),
                )
              : Container(
                  margin: EdgeInsets.only(top: 10),
                  child: ListView.builder(
                    itemCount: _searchResults.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) => Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                                              _searchResults[index].foto)),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              )
                            ],
                          ),
                          Expanded(
                            child: Container(
                              margin:
                                  EdgeInsets.only(left: 15, top: 30, right: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Flexible(
                                    child: Text(
                                      _searchResults[index].judul,
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
                                    _searchResults[index].penerbit,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.lato(
                                        color: Colors.grey[400], fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Page Count - ${_searchResults[index].halaman}',
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
                                                idBuku:
                                                    _searchResults[index].id),
                                          ));
                                    },
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(0))),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.black),
                                    ),
                                    child: Text(
                                      'Details',
                                      style: GoogleFonts.lato(
                                          color: Colors.white,
                                          letterSpacing: 1),
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
