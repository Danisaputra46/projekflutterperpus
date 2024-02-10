import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CardWidget extends StatelessWidget {
  List data = [
    {'color': Colors.grey},
    {'color': Colors.lightBlue.shade400},
    {'color': Colors.black},
    {'color': Colors.yellow},
    {'color': Colors.yellow},
    {'color': Colors.yellow},
    {'color': Colors.yellow},
    {'color': Colors.yellow},
  ];
  final List<String> img = [
    'assets/buku/buku_flutter.jpg',
    'assets/buku/buku_flutter.jpg',
    'assets/buku/buku_flutter.jpg',
    'assets/buku/buku_flutter.jpg',
    'assets/buku/buku_flutter.jpg',
    'assets/buku/buku_flutter.jpg',
    'assets/buku/buku_flutter.jpg',
    'assets/buku/buku_flutter.jpg',
  ];
  final Colorwhite = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 25.0, right: 25, top: 15, bottom: 15),
          child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: data.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 18,
                mainAxisSpacing: 18,
                mainAxisExtent: 300),
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    // color: data[index]['color'],
                    color: Colors.grey),
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.only(top: 10)),
                    ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        child: Image.asset(
                          img[index],
                          height: 170,
                          width: 150,
                          fit: BoxFit.fill,
                        )),
                    Padding(
                      padding: const EdgeInsets.only(left: 5, top: 5),
                      child: Text('Pengantar Pemrograman Dart dan Flutter'),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: Text(
                          'Jubilee Enterprise',
                          // textAlign: TextAlign.right,
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
