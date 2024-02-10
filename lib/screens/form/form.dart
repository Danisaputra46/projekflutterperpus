// import 'package:aplikasi_daftar_angota_perpus/tampildata/alldata.dart';
import 'package:aplikasi_daftar_angota_perpus/Services/snackbar.dart';
import 'package:aplikasi_daftar_angota_perpus/screens/form/controller/confirmdata.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import 'package:http/http.dart' as http;

class MyFormPage extends StatefulWidget {
  @override
  _MyFormPageState createState() => _MyFormPageState();
}

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();
bool isAlamatSesuaiKTP = false;
final RegExp _emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');

int userId = 0;

class _MyFormPageState extends State<MyFormPage> {
  void initState() {
    super.initState();
    // Panggil metode untuk mengambil data dari SharedPreferences saat widget diinisialisasi
    getLoginData();
  }

  late String userName;
  late String userToken;

  final formKey = GlobalKey<FormState>();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _nikController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _alamatktp = TextEditingController();
  final TextEditingController _alamatsekarang = TextEditingController();
  final TextEditingController _namaSekolah = TextEditingController();
  final TextEditingController _nomorhp = TextEditingController();
  final TextEditingController _tglLahir = TextEditingController();
  String _listprofesi = 'Siswa';
  String _pendidikanterakhir = 'SD';
  String? _gender;
  List<String> _schoolTypes = [
    'PAUD',
    'TK',
    'KB',
    'SD',
    'MI',
    'SMP',
    'MTS',
    'SMA',
    'SMK',
    'MA',
    'D3',
    'S1',
    'S2',
    'S3',
  ];
  List<String> profesi = [
    'Siswa',
    'Mahasiswa',
    'Guru',
    'Dosen',
    'Peneliti',
    'PNS Daerah (Pusat)',
    'Karyawan',
    'Ti',
    'Umum',
    'Ibu Rumah Tangga',
  ];
  Future<void> getLoginData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    // Ambil nilai ID, name, dan token dari SharedPreferences
    userId = preferences.getInt('id') ?? 0;
    userName = preferences.getString('name') ?? 'Nama Tidak Ditemukan';
    userToken = preferences.getString('token') ?? '';
    // Panggil setState untuk memperbarui tampilan
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryWidht = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Form',
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w600,
              letterSpacing: 2,
            ),
          ),
          // backgroundColor: Color.fromARGB(255, 197, 197, 197),
          // backgroundColor: Colors.green,
          backgroundColor: Color(0xfff012ac0),
          centerTitle: true,
          automaticallyImplyLeading: false),
      body: SafeArea(
        child: Container(
          color: Color.fromARGB(255, 241, 241, 241),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Container(
                  padding: EdgeInsets.all(10), // Atur jarak dari tepi
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      TextFormField(
                        readOnly:
                            true, // Menetapkan agar hanya angka yang dapat dimasukkan
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade600),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Color(0xfff012ac0),
                          )),
                          // prefixIcon: Icon(
                          //   Icons.verified,
                          //   color: Colors.green,
                          // ),
                          hintText: 'ID : $userId',
                          hintStyle: GoogleFonts.lato(
                              fontWeight: FontWeight.w900, letterSpacing: 1),
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'NIK:',
                        style: GoogleFonts.lato(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1),
                      ),
                      SizedBox(height: 5),
                      TextFormField(
                        style: GoogleFonts.lato(
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1,
                        ),
                        controller: _nikController,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(16),
                        ], // Menetapkan agar hanya angka yang dapat dimasukkan
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade600),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Color(0xfff012ac0),
                          )),
                          // prefixIcon: Icon(
                          //   Icons.account_circle,
                          //   color: Colors.green,
                          //   size: 30,
                          // ),
                          hintText: 'Masukan NIK',
                          hintStyle: GoogleFonts.lato(
                              fontWeight: FontWeight.w600, letterSpacing: 1),
                          border: OutlineInputBorder(),
                        ),

                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Nik Tidak Boleh Kosong";
                          } else if (value.length != 16) {
                            return "NIK harus terdiri dari 16 angka";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Nama:',
                        style: GoogleFonts.lato(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1),
                      ),
                      SizedBox(height: 5),
                      TextFormField(
                        style: GoogleFonts.lato(
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1),
                        controller: _namaController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade600),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Color(0xfff012ac0),
                          )),
                          hintText: 'Masukan Nama',
                          hintStyle: GoogleFonts.lato(
                              fontWeight: FontWeight.w600, letterSpacing: 1),
                          border: OutlineInputBorder(),
                        ),
                        textCapitalization: TextCapitalization.characters,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Nama Tidak Boleh Kosong";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Pendidikan Terakhir:',
                            style: GoogleFonts.lato(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.5),
                          ),
                          SizedBox(height: 10),
                          InputDecorator(
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 20.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: _pendidikanterakhir,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _pendidikanterakhir = newValue!;
                                  });
                                },
                                items:
                                    _schoolTypes.map<DropdownMenuItem<String>>(
                                  (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: GoogleFonts.lato(
                                            color: Colors.grey.shade600,
                                            fontWeight: FontWeight.w900,
                                            letterSpacing: 1),
                                      ),
                                    );
                                  },
                                ).toList(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                          height:
                              10), // Tambahkan jarak antara Pendidikan Terakhir dan Status/Profesi
                      // Status/Profesi
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Status/Profesi:',
                            style: GoogleFonts.lato(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1),
                          ),
                          SizedBox(height: 10),
                          InputDecorator(
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 20),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: _listprofesi,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _listprofesi = newValue!;
                                  });
                                },
                                items: profesi.map<DropdownMenuItem<String>>(
                                  (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: GoogleFonts.lato(
                                          color: Colors.grey.shade600,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                    );
                                  },
                                ).toList(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Container(
                        padding:
                            EdgeInsets.all(10.0), // Tambahkan padding di sini
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey, // Warna border
                            width: 1.0, // Lebar border
                          ),
                          borderRadius: BorderRadius.all(
                              Radius.circular(8.0)), // Radius sudut border
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Jenis Kelamin:',
                              style: GoogleFonts.lato(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1),
                            ),
                            RadioListTile(
                              activeColor: Color(0xfff012ac0),
                              title: Text(
                                'Laki-laki',
                                style: GoogleFonts.lato(
                                    color: Colors.grey.shade600,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 1),
                              ),
                              value: 'Laki-laki',
                              groupValue: _gender,
                              onChanged: (String? value) {
                                setState(() {
                                  _gender = value;
                                });
                              },
                            ),
                            RadioListTile(
                              activeColor: Color(0xfff012ac0),
                              title: Text(
                                'Perempuan',
                                style: GoogleFonts.lato(
                                    color: Colors.grey.shade600,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 1),
                              ),
                              value: 'Perempuan',
                              groupValue: _gender,
                              onChanged: (String? value) {
                                setState(() {
                                  _gender = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 10),
                      Text(
                        'Email:',
                        style: GoogleFonts.lato(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1),
                      ),
                      SizedBox(height: 5),
                      TextFormField(
                        style: GoogleFonts.lato(
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1),
                        controller: _emailController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade600),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Color(0xfff012ac0),
                          )),
                          hintText: 'Masukan Email',
                          hintStyle: GoogleFonts.lato(
                              fontWeight: FontWeight.w600, letterSpacing: 1),
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value != null && value.isNotEmpty) {
                            if (!_emailRegExp.hasMatch(value)) {
                              return "Isi Email Dengan Benar";
                            }
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Alamat Sesuai KTP:',
                            style: GoogleFonts.lato(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1),
                          ),
                          Container(
                            width: mediaQueryWidht * 0.427,
                            child: Text(
                              'Alamat Sekarang:',
                              style: GoogleFonts.lato(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Container(
                        child: Row(
                          children: [
                            Container(
                              height: 100,
                              width: mediaQueryWidht * 0.429,
                              // width: 178,

                              child: Container(
                                child: TextFormField(
                                  style: GoogleFonts.lato(
                                      color: Colors.grey.shade600,
                                      fontWeight: FontWeight.w900,
                                      letterSpacing: 1),
                                  controller: _alamatktp,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade600),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                      color: Color(0xfff012ac0),
                                    )),
                                    contentPadding: EdgeInsets.only(
                                        right: 5, left: 10, top: 5, bottom: 5),
                                    // hintText: 'Masukan Alamat Sesuai KTP',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Alamat TIdak Boleh Kosong";
                                    }
                                    return null;
                                  },
                                  maxLines: 4,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Container(
                                height: 100,
                                width: mediaQueryWidht * 0.429,
                                // width: 178,
                                child: Container(
                                  child: TextFormField(
                                    style: GoogleFonts.lato(
                                        color: Colors.grey.shade600,
                                        fontWeight: FontWeight.w900,
                                        letterSpacing: 1),
                                    controller: _alamatsekarang,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade600),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                        color: Color(0xfff012ac0),
                                      )),
                                      contentPadding: EdgeInsets.only(
                                          bottom: 5,
                                          right: 5,
                                          top: 5,
                                          left: 10),
                                      // hintText: 'Masukan Alamat Sesuai KTP',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                    maxLines: 4,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Checkbox(
                              activeColor: Color(0xfff012ac0),
                              value: isAlamatSesuaiKTP,
                              onChanged: (value) {
                                setState(() {
                                  isAlamatSesuaiKTP = value ?? false;
                                  if (isAlamatSesuaiKTP) {
                                    _alamatsekarang.text = _alamatktp.text;
                                  } else {
                                    _alamatsekarang.text = '';
                                  }
                                });
                              }),
                          Text(
                            "Silahkan Klik Di Sini Jika Alamat Sama",
                            style: GoogleFonts.lato(
                                fontWeight: FontWeight.w900,
                                letterSpacing: 1,
                                color: Color(0xfff012ac0)),
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Nama Intansi/Sekolah:',
                        style: GoogleFonts.lato(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1),
                      ),
                      SizedBox(height: 5),
                      TextFormField(
                        style: GoogleFonts.lato(
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1),
                        controller: _namaSekolah,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade600),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Color(0xfff012ac0),
                          )),
                          hintText: 'Masukan Nama Intansi/Sekolah',
                          hintStyle: GoogleFonts.lato(
                              fontWeight: FontWeight.w600, letterSpacing: 1),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'No. Telp. / Handphon:',
                        style: GoogleFonts.lato(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1),
                      ),
                      SizedBox(height: 5),
                      TextFormField(
                        style: GoogleFonts.lato(
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1),
                        controller: _nomorhp,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(13),
                        ], // Menetapkan agar hanya angka yang dapat dimasukkan
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade600),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Color(0xfff012ac0),
                          )),
                          hintText: 'Masukan Nomor HP',
                          hintStyle: GoogleFonts.lato(
                              fontWeight: FontWeight.w600, letterSpacing: 1),
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Nomor HP Tidak Boleh Kosong";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Tempat/Tgl Lahir:',
                        style: GoogleFonts.lato(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1),
                      ),
                      SizedBox(height: 5),
                      TextFormField(
                        style: GoogleFonts.lato(
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1),
                        controller: _tglLahir,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade600),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Color(0xfff012ac0),
                          )),
                          hintText: 'Samarinda, 02/02/2002',
                          hintStyle: GoogleFonts.lato(
                              fontWeight: FontWeight.w600, letterSpacing: 1),
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Tanggal Lahir Tidak Boleh Kosong";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xfff012ac0),
                        ),
                        onPressed: () async {
                          if (_gender == null) {
                            scaffoldMessengerKey.currentState
                                ?.hideCurrentSnackBar();
                            errorSnackBar(
                                context, 'Jenis Kelamin Tidak Boleh Kosong');
                            // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            //   content: Text(
                            //     'Jenis Kelamin Tidak Boleh Kosong',
                            //     style: GoogleFonts.lato(
                            //         fontWeight: FontWeight.bold,
                            //         letterSpacing: 1),
                            //   ),
                            //   duration: Duration(milliseconds: 500),
                            //   backgroundColor: Colors.red,
                            // ));
                            return null;
                          }
                          if (formKey.currentState!.validate()) {
                            _navigateToConfirmationPage(context);
                          }
                        },
                        child: Text(
                          'Submit',
                          style: GoogleFonts.lato(
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1,
                              fontSize: 15,
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 10),
                      // SafeArea(
                      //   child: ElevatedButton(
                      //     style: ElevatedButton.styleFrom(
                      //         backgroundColor: Colors.red),
                      //     onPressed: () {
                      //       _resetForm();
                      //     },
                      //     child: Text('Clear'),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _resetForm() {
    _namaController.clear();
    _nikController.clear();
    _emailController.clear();
    _alamatktp.clear();
    _alamatsekarang.clear();
    _nomorhp.clear();
    _tglLahir.clear();
    _namaSekolah.clear();
  }

  void _navigateToConfirmationPage(BuildContext context) {
    String nama = _namaController.text;
    String nik = _nikController.text;
    String email = _emailController.text;
    String alamatktp = _alamatktp.text;
    String alamatsekarang = _alamatsekarang.text;
    String namasekolah = _namaSekolah.text;
    String nomorhp = _nomorhp.text;
    String tgllahir = _tglLahir.text;
    String listprofesi = _listprofesi;
    String pendidikanterakhir = _pendidikanterakhir;
    String gender = _gender ?? '';

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Confirmasi(
          userId: userId,
          nama: nama,
          nik: nik,
          pendidikanterakhir: pendidikanterakhir,
          gender: gender,
          email: email,
          alamatktp: alamatktp,
          alamatsekarang: alamatsekarang,
          namasekolah: namasekolah,
          nomorhp: nomorhp,
          tgllahir: tgllahir,
          listprofesi: listprofesi,
        ),
      ),
    );
  }
}
