import 'package:aplikasi_daftar_angota_perpus/Services/apibuku.dart';
import 'package:aplikasi_daftar_angota_perpus/screens/buku/detailbuku.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

// ignore: must_be_immutable
class pendidikan extends StatefulWidget {
  // final String kategori;
  final List<String> kategori;
  pendidikan({required this.kategori});

  @override
  State<pendidikan> createState() => pendidikanState();
}

class pendidikanState extends State<pendidikan> {
  List<dynamic> daftarBuku = [];
  bool isLoading = true;

  void initState() {
    super.initState();
    // Panggil fungsi untuk memuat data buku saat widget diinisialisasi
    _loadDataBuku(widget.kategori);
  }

  // Fungsi untuk memuat data buku dari backend Laravel Anda
  // void _loadDataBuku(String kategori) async {
  //   try {
  //     final response = await BukuService().kategori(kategori);

  //     if (response.statusCode == 200) {
  //       // Jika respons berhasil (status code 200), parse respons JSON
  //       var responseData = json.decode(response.body);
  //       // Simpan data buku ke dalam variabel daftarBuku di state widget
  //       await Future.delayed(Duration(milliseconds: 500));
  //       setState(() {
  //         daftarBuku = responseData['data'];
  //         isLoading = false;
  //       });
  //     } else {
  //       // Jika respons tidak berhasil, tampilkan pesan kesalahan
  //       print('Gagal memuat data: ${response.statusCode}');
  //     }
  //   } catch (error) {
  //     // Tangani kesalahan saat melakukan HTTP request
  //     print('Terjadi kesalahan: $error');
  //   }
  // }
// Fungsi untuk memuat data buku dari backend Laravel Anda
  void _loadDataBuku(List<String> kategori) async {
    try {
      // Untuk setiap kategori, panggil fungsi untuk memuat data buku
      for (String kategoriItem in kategori) {
        final response = await BukuService().kategori(kategoriItem);

        if (response.statusCode == 200) {
          // Jika respons berhasil (status code 200), parse respons JSON
          var responseData = json.decode(response.body);
          // Simpan data buku ke dalam variabel daftarBuku di state widget
          await Future.delayed(Duration(milliseconds: 500));
          setState(() {
            daftarBuku.addAll(responseData[
                'data']); // Menggabungkan daftar buku dari berbagai kategori
            isLoading = false;
          });
        } else {
          // Jika respons tidak berhasil, tampilkan pesan kesalahan
          print('Gagal memuat data: ${response.statusCode}');
        }
      }
    } catch (error) {
      // Tangani kesalahan saat melakukan HTTP request
      print('Terjadi kesalahan: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      child: isLoading
          ? Center(
              child: CircularProgressIndicator(
                color: Color(0xfff012ac0),
              ),
            )
          : ListView.builder(
              itemCount: daftarBuku.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DetailBuku(idBuku: daftarBuku[index]['id'])));
                },
                child: Container(
                  width: 140,
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 210,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset: Offset(1, 1))
                          ],
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: NetworkImage(
                                  // 'http://192.168.1.14:8000/api/gambarbuku/${daftarBuku[index]['foto']}'
                                  BukuService.getGambarBukuUrl(
                                      daftarBuku[index]['foto'])),
                              fit: BoxFit.cover),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        daftarBuku[index]['judul'],
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[900],
                            fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
