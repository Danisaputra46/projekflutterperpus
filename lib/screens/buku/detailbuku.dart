import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class detailbuku extends StatefulWidget {
  const detailbuku({super.key});

  @override
  State<detailbuku> createState() => _detailbukuState();
}

class _detailbukuState extends State<detailbuku> {
  @override
  Widget build(BuildContext context) {
    final MediaQueryWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Detail',
          style: GoogleFonts.lato(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 1),
        ),
        backgroundColor: Color(0xfff012ac0),
      ),
      body: Column(
        children: [
          Container(
            // color: Colors.blue,
            height: 400,
            width: MediaQueryWidth * 1,
            decoration: BoxDecoration(
              color: Color(0xfff012ac0),
              image: DecorationImage(
                  opacity: 0.4,
                  image: AssetImage('assets/halamanbuku/overlay.png'),
                  fit: BoxFit.cover),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 230,
                    width: 150,
                    // color: Colors.amber,
                    decoration: BoxDecoration(
                      // color: Colors.amber,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: AssetImage('assets/buku/buku_dongeng.jpg'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Dongeng Nina BOBO ',
                    style: GoogleFonts.lato(
                        fontSize: 23,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'by Tim Laksana',
                    style:
                        GoogleFonts.lato(color: Colors.grey[400], fontSize: 15),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Rating',
                            style: GoogleFonts.lato(
                                fontSize: 15, color: Colors.grey[400]),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Not Avaible',
                            style: GoogleFonts.lato(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'Pages',
                            style: GoogleFonts.lato(
                                fontSize: 15, color: Colors.grey[400]),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '200',
                            style: GoogleFonts.lato(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'Language',
                            style: GoogleFonts.lato(
                                fontSize: 15, color: Colors.grey[400]),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Not Avaible',
                            style: GoogleFonts.lato(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'Publish date',
                            style: GoogleFonts.lato(
                                fontSize: 15, color: Colors.grey[400]),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '2024-13-20',
                            style: GoogleFonts.lato(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  margin:
                      EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
                  width: MediaQueryWidth * 1,
                  // color: Colors.amber,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'What`s it about?',
                        style: GoogleFonts.lato(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.',
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.lato(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
