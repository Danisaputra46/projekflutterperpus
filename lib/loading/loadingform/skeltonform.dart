import 'package:flutter/material.dart';

class Skeltonform extends StatelessWidget {
  const Skeltonform({
    super.key,
    this.height,
    this.widhth,
    this.h,
    this.w,
  });
  //  height: 30,
  //             width: 50
  final double? height, widhth, h, w;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: widhth,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.05),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Stack(
        children: [
          Positioned(
            top: 8,
            left: 3,
            child: Container(
              height: h,
              width: w,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.06),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
          ),
          // Widget lain yang ingin ditampilkan di dalam container
        ],
      ),
    );
  }
}

class Skeltonform1 extends StatelessWidget {
  const Skeltonform1({
    super.key,
    this.height,
    this.widhth,
  });

  final double? height, widhth;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: widhth,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.05),
          borderRadius: BorderRadius.all(Radius.circular(5))),
    );
  }
}

class Skeltonform2 extends StatelessWidget {
  const Skeltonform2({
    super.key,
    this.height,
    this.widhth,
  });

  final double? height, widhth;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: widhth,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.05),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Stack(
        children: [
          Positioned(
            top: 5,
            left: 5,
            child: Container(
              height: 25,
              width: 50,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.06),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
          ),
          Positioned(
            top: 12,
            right: 20,
            child: Container(
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.06),
                  borderRadius: BorderRadius.all(Radius.circular(0))),
            ),
          ),
          // Widget lain yang ingin ditampilkan di dalam container
        ],
      ),
    );
  }
}

class Skeltonformjeniskelamin extends StatelessWidget {
  const Skeltonformjeniskelamin({
    super.key,
    this.height,
    this.widhth,
  });

  final double? height, widhth;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: widhth,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.05),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Stack(
        children: [
          Positioned(
            top: 5,
            left: 5,
            child: Container(
              height: 25,
              width: 150,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.06),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
            ),
          ),
          Positioned(
            top: 50,
            left: 28,
            child: Row(
              children: [
                Container(
                  height: 23,
                  width: 23,
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.06),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  height: 23,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.06),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                ),
              ],
            ),
          ),
          Positioned(
            top: 110,
            left: 28,
            child: Row(
              children: [
                Container(
                  height: 23,
                  width: 23,
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.06),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  height: 23,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.06),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                ),
              ],
            ),
          ),
          // Widget lain yang ingin ditampilkan di dalam container
        ],
      ),
    );
  }
}
