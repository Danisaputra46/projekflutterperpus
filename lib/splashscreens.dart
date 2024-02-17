import 'dart:async';
import 'package:flutter/material.dart';
import 'screens/login/login.dart';

class Loading extends StatefulWidget {
  // const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => LoginPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.transparent, // Make the scaffold background transparent
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.white, Colors.green],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft)),
        // color: Colors.grey.shade300,
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage('assets/splash_screens/background.png'),
        //     fit: BoxFit.cover, // Set the image to cover the entire container
        //   ),
        // ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              Container(
                child: Text(
                  'Perpustakaan Kota Samarinda',
                  style: TextStyle(
                    fontSize: 23,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Image.asset(
                'assets/splash_screens/logokotasamarinda.png', // Replace with your image asset path
                height: 200, // Adjust the height of the image
              ),
              const SizedBox(
                height: 130,
              ),
              const CircularProgressIndicator.adaptive(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
              )
            ],
          ),
        ),
      ),
    );
  }
}
