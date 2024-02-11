import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:aplikasi_daftar_angota_perpus/Services/globals.dart';

class BukuService {
  // Ganti dengan alamat API Anda

  static Future<List<dynamic>> getDaftarBuku() async {
    final response = await http.get(Uri.parse(baseURL + 'daftar-buku'));

    if (response.statusCode == 200) {
      List<dynamic> bukuList = jsonDecode(response.body);

      // Iterasi melalui setiap buku dan tambahkan URL gambar
      bukuList.forEach((buku) {
        buku['gambar_url'] = baseURL +
            'gambar-buku/' +
            buku['gambar']; // Sesuaikan dengan struktur data Anda
      });

      return bukuList;
    } else {
      throw Exception('Gagal memuat data buku');
    }
  }

  Future<http.Response> bukuid(int idBuku) async {
    String url = baseURL +
        'daftarbukuid/$idBuku'; // Sesuaikan dengan endpoint yang sesuai
    return await http.get(
      Uri.parse(url),
      headers: headers,
    );
  }

  Future<http.Response> kategori(String kategori) async {
    String url = baseURL +
        'daftarbuku/$kategori'; // Sesuaikan dengan endpoint yang sesuai
    return await http.get(
      Uri.parse(url),
      headers: headers,
    );
  }

  // Fungsi untuk mendapatkan gambar buku berdasarkan nama file
  static String getGambarBukuUrl(String namaFile) {
    return baseURL + 'gambarbuku/$namaFile';
  }
}
