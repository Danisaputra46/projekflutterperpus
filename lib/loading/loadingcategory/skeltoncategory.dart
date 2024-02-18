import 'package:flutter/material.dart';

class Skeltoncategory extends StatelessWidget {
  const Skeltoncategory({
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
          color: Colors.black.withOpacity(0.04),
          borderRadius: BorderRadius.all(Radius.circular(16))),
    );
  }
}
