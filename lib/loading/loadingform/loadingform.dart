import 'package:aplikasi_daftar_angota_perpus/loading/loadingform/skeltonform.dart';
import 'package:flutter/material.dart';

class loadingform extends StatelessWidget {
  const loadingform({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          color: Color.fromARGB(255, 241, 241, 241),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Skeltonform(
                    h: 30,
                    w: 50,
                    height: 60,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //nik
                      Skeltonform1(
                        widhth: 40,
                        height: 20,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Skeltonform(
                        h: 30,
                        w: 110,
                        height: 65,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      //nama
                      Skeltonform1(
                        widhth: 55,
                        height: 20,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Skeltonform(
                        h: 30,
                        w: 125,
                        height: 65,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Pendidikan Terakhir
                      SizedBox(
                        height: 0,
                      ),
                      Skeltonform1(
                        widhth: 160,
                        height: 19,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Skeltonform2(
                        height: 50,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      //Status/Profesi
                      Skeltonform1(
                        widhth: 120,
                        height: 20,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Skeltonform2(
                        height: 50,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Skeltonformjeniskelamin(
                    height: 170,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
