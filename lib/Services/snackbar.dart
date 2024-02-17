import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

errorSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            height: 100,
            decoration: BoxDecoration(
              color: Color(0xFFC72C41),
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 48,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Warning !!!',
                        style: GoogleFonts.lato(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1),
                      ),
                      SizedBox(
                          height:
                              4), // Optionally add some spacing between texts
                      Expanded(
                        child: Text(
                          text,
                          style: GoogleFonts.lato(
                              fontSize: 12,
                              color: Colors.white,
                              letterSpacing: 1),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20)),
              child: SvgPicture.asset(
                "assets/icons/bubbles.svg",
                height: 48,
                width: 40,
                color: Color(0xFF801336),
              ),
            ),
          ),
          Positioned(
            top: -14,
            left: 0,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/fail.svg',
                  height: 40,
                ),
                Positioned(
                  top: 10,
                  child: SvgPicture.asset(
                    'assets/icons/close.svg',
                    height: 16,
                  ),
                )
              ],
            ),
          )
        ],
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
  );
}

successSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            height: 100,
            decoration: BoxDecoration(
              color: Color(0xff2D6A4F),
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 48,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Success',
                        style: GoogleFonts.lato(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1),
                      ),
                      SizedBox(
                          height:
                              4), // Optionally add some spacing between texts
                      Expanded(
                        child: Text(
                          text,
                          style: GoogleFonts.lato(
                              fontSize: 12,
                              color: Colors.white,
                              letterSpacing: 1),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20)),
              child: SvgPicture.asset(
                "assets/icons/bubbles.svg",
                height: 48,
                width: 40,
                color: Color.fromARGB(255, 29, 70, 51),
              ),
            ),
          ),
          Positioned(
            top: -14,
            left: 10,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/fail.svg',
                  height: 40,
                  color: Color.fromARGB(255, 29, 70, 51),
                ),
                Positioned(
                  top: 10,
                  child: SvgPicture.asset(
                    'assets/icons/success.svg',
                    height: 16,
                  ),
                )
              ],
            ),
          )
        ],
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
  );
}
