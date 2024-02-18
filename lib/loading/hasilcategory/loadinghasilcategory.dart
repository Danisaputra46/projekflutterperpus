import 'package:flutter/material.dart';

class loadinghasilcategory extends StatelessWidget {
  const loadinghasilcategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
      height: 280,
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.04),
          borderRadius: BorderRadius.circular(10)),
      child: Stack(children: [
        Positioned(
          top: 27,
          left: 15,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 220,
                width: 150,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(10)),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    height: 40,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15, top: 10),
                    height: 20,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15, top: 10),
                    height: 20,
                    width: 80,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15, top: 10),
                    height: 20,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15, top: 40),
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.05),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ]),
    );
  }
}
