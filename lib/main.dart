import 'package:aplikasi_daftar_angota_perpus/screens/form/form.dart';
import 'package:flutter/material.dart';
import 'splashscreens.dart';
import 'screens/login/login.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(primaryColor: Colors.green),
      debugShowCheckedModeBanner: false,
      home: Loading(),
      routes: {
        '/form': (context) => MyFormPage(),
        '/login': (context) => LoginPage(),
        '/loading': (context) => Loading(),
      },
    );
  }
}
