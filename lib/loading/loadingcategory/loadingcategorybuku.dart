import 'package:aplikasi_daftar_angota_perpus/loading/loadingcategory/skeltoncategory.dart';
import 'package:flutter/material.dart';

class loadingbuku extends StatelessWidget {
  const loadingbuku({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Column(
            children: [
              Skeltoncategory(
                height: 210,
                widhth: 140,
              ),
              SizedBox(
                height: 8,
              ),
              Skeltoncategory(
                widhth: 130,
              )
            ],
          ),
        ],
      ),
    );
  }
}
