import 'dart:convert';
import 'package:aplikasi_daftar_angota_perpus/Services/globals.dart';

import 'package:http/http.dart' as http;

class AuthServices {
  static Future<http.Response> register(String username, String password,
      String firstname, String lastname) async {
    Map data = {
      'firstname': firstname,
      'lastname': lastname,
      'username': username,
      'password': password,
    };
    var body = json.encode(data);
    var url = Uri.parse(baseURL + 'auth/register');
    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    print(response.body);
    // print('Status Code: ${response.statusCode}');
    // print('Response Body: ${response.body}');
    return response;
  }

  static Future<http.Response> login(String username, String password) async {
    Map data = {
      'username': username,
      'password': password,
    };
    var body = json.encode(data);
    var url = Uri.parse(baseURL + 'auth/login');
    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    print(response.body);
    return response;
  }
}

class API {
  postRequest({
    required String route,
    required Map<String, String> data,
  }) async {
    String url = baseURL + route;
    return await http.post(
      Uri.parse(url),
      body: jsonEncode(data),
      headers: headers,
    );
  }

  // Fungsi untuk mendapatkan jumlah anggota, anggota cowok, dan anggota cewek
  Future<http.Response> getJumlahAnggota() async {
    String url =
        baseURL + 'jumlah-anggota'; // Sesuaikan dengan endpoint yang sesuai
    return await http.get(
      Uri.parse(url),
      headers: headers,
    );
  }

  Future<http.Response> getDataDaftarAnggota() async {
    String url = baseURL + 'anggota'; // Sesuaikan dengan endpoint yang sesuai
    return await http.get(
      Uri.parse(url),
      headers: headers,
    );
  }

  Future<http.Response> getDataByIdFluterUser(int idFluterUser) async {
    String url = baseURL +
        'anggota/$idFluterUser'; // Sesuaikan dengan endpoint yang sesuai
    return await http.get(
      Uri.parse(url),
      headers: headers,
    );
  }

  Future<bool> checkIfIdFluteruserExists(int userId) async {
    String url =
        baseURL + 'anggota/$userId'; // Sesuaikan dengan endpoint yang sesuai
    http.Response response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    // Pemeriksaan apakah status code 200 dan response body berisi true
    return (response.statusCode == 200 && response.body == 'true');
  }
}
