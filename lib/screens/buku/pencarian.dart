import 'package:aplikasi_daftar_angota_perpus/screens/buku/detailbuku.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class hasil extends StatefulWidget {
  const hasil({super.key});

  @override
  State<hasil> createState() => _hasilState();
}

class _hasilState extends State<hasil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfff012ac0),
        centerTitle: true,
        title: Text(
          'Hasil',
          style: GoogleFonts.lato(
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
              color: Colors.white),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 10),
        // width: 150,
        // height: 200,
        child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) => Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            height: 280,
            // width: 100,
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
                            image: AssetImage('assets/buku/buku_dongeng.jpg'),
                            fit: BoxFit.cover),
                        // color: Colors.amber,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 15, top: 30, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text(
                            'Dongeng Nina BOBO yang sangat panjang sekali sampai ke ujung jalan dan tidak pernah berakhir karena banyak hal yang harus diceritakan tentang petualangan mereka bersama-sama di dunia yang penuh dengan keajaiban',
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
                          'by Tim Laksana asdasdasdasdasdas',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.lato(
                              color: Colors.grey[400], fontSize: 15),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Page Count - 300',
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
                                  builder: (context) => detailbuku(),
                                ));
                          },
                          style: ButtonStyle(
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0))),
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.black),
                          ),
                          child: Text(
                            'Details',
                            style: GoogleFonts.lato(
                                color: Colors.white, letterSpacing: 1),
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
