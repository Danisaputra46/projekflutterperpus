import 'package:flutter/material.dart';

class loadingprofil extends StatelessWidget {
  const loadingprofil({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20),
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.04),
                      borderRadius: BorderRadius.circular(50)),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      height: 28,
                      width: 220,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.04),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      height: 25,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.04),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 18,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Divider(
                height: 2,
                thickness: 2,
                color: Colors.grey.shade400,
              ),
            ),
            IntrinsicHeight(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 20,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.04)),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 20,
                          width: 150,
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.04)),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 90, // Adjust the height as needed
                    child: VerticalDivider(
                      width: 50,
                      thickness: 2,
                      color: Colors.grey.shade400,
                      indent: 5,
                      endIndent: 5,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 20,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.04)),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 20,
                        width: 130,
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.04)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Divider(
                height: 2,
                thickness: 2,
                color: Colors.grey.shade400,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Divider(
              thickness: 10,
              color: Colors.grey.shade300,
            ),
            SizedBox(
              height: 10,
            ),
            NewWidget(
              height: 30,
              width: 200,
            ),
            NewWidget(
              height: 30,
              width: 220,
            ),
            NewWidget(
              height: 30,
              width: 250,
            ),
            NewWidget(
              height: 30,
              width: 150,
            ),
            NewWidget(
              height: 30,
              width: 190,
            ),
            NewWidget(
              height: 30,
              width: 210,
            ),
            SizedBox(
              height: 50,
              child: Divider(
                thickness: 10,
                color: Colors.grey.shade300,
              ),
            ),
            NewWidget(
              height: 30,
              width: 210,
            ),
            SizedBox(
              height: 50,
              child: Divider(
                thickness: 10,
                color: Colors.grey.shade300,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    super.key,
    this.height,
    this.width,
  });
  final double? height, width;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 20),
              height: 30,
              width: 30,
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.04)),
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              height: height,
              width: width,
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.04)),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Divider(
            height: 30,
            thickness: 2,
            color: Colors.grey.shade400,
          ),
        ),
      ],
    );
  }
}
