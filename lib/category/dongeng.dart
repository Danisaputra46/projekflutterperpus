import 'package:aplikasi_daftar_angota_perpus/Services/apibuku.dart';
import 'package:aplikasi_daftar_angota_perpus/screens/buku/detailbuku.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class dongeng extends StatefulWidget {
  final String kategori;
  dongeng({required this.kategori});

  @override
  State<dongeng> createState() => _dongengState();
}

class _dongengState extends State<dongeng> {
  List<dynamic> daftarBuku = [];

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    // Panggil fungsi untuk memuat data buku saat widget diinisialisasi
    _loadDataBuku(widget.kategori);
  }

  // Fungsi untuk memuat data buku dari backend Laravel Anda
  void _loadDataBuku(String kategori) async {
    try {
      // Ganti URL sesuai dengan URL endpoint API Anda
      final response = await BukuService().kategori(kategori);

      if (response.statusCode == 200) {
        // Jika respons berhasil (status code 200), parse respons JSON
        var responseData = json.decode(response.body);
        // Simpan data buku ke dalam variabel daftarBuku di state widget
        await Future.delayed(Duration(milliseconds: 500));
        setState(() {
          daftarBuku = responseData['data'];
          isLoading = false;
        });
      } else {
        // Jika respons tidak berhasil, tampilkan pesan kesalahan
        print('Gagal memuat data: ${response.statusCode}');
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
              scrollDirection: Axis.horizontal,
              itemCount: daftarBuku.length,
              itemBuilder: (context, index) {
                return GestureDetector(
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
                                offset: Offset(1, 1),
                              ),
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
                        SizedBox(height: 8),
                        Text(
                          daftarBuku[index]['judul'],
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[900],
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
