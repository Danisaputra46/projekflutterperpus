import 'package:aplikasi_daftar_angota_perpus/Services/globals.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<bool> checkIfNikExists(String nik) async {
  String url = baseURL + 'daftaranggota/ceknik?nik=$nik';

  try {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      // Parse response JSON
      Map<String, dynamic> data = jsonDecode(response.body);
      return data['data'] as bool;
    }
  } catch (error) {
    print('Error: $error');
  }

  return false;
}

Future<bool> checkIfIdFluteruserExists(int userId) async {
  // Ganti baseURL dan endpoint sesuai dengan backend Anda
  String url = baseURL + 'anggota/$userId';

  try {
    http.Response response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    // Pemeriksaan apakah status code 200 dan response body berisi true
    return (response.statusCode == 200 &&
        response.body.toLowerCase() == 'true');
  } catch (error) {
    // Tangani kesalahan jika terjadi
    print('Error: $error');
    return false; // Secara default, anggap bahwa id_fluteruser tidak ada
  }
}
