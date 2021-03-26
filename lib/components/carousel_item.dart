import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_for_web/models/carousel_item.dart';
import 'package:google_fonts/google_fonts.dart';

List<CarouselItemModel> carouselItems = List.generate(
  5,
  (index) => CarouselItemModel(
    text: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Icon(
                Icons.play_arrow_rounded,
                color: Colors.white,
              ),
              AnimatedTextKit(
                isRepeatingAnimation: true,
                animatedTexts: [
                  TyperAnimatedText('Flutter Developer',
                      textStyle: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.w200,
                          color: Colors.white)),
                  TyperAnimatedText('Web Developer',
                      textStyle: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.w200,
                          color: Colors.white)),
                  TyperAnimatedText('Elementor Lover',
                      textStyle: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.w200,
                          color: Colors.white)),
                  TyperAnimatedText('Divi Expert',
                      textStyle: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.w200,
                          color: Colors.white)),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 18.0,
          ),
          Text(
            "Muhideen",
            style: GoogleFonts.montserrat(
              color: Colors.white,
              fontSize: 40.0,
              height: 1.3,
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            "MUJEEB",
            style: GoogleFonts.montserrat(
              color: Colors.white,
              fontSize: 40.0,
              fontWeight: FontWeight.w900,
              height: 1.3,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            "Full-stack developer, based in Nigeria",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.0,
              height: 1.0,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            child: Wrap(
              children: [
                Text(
                  "Need a full custom website?",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                    height: 1.5,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Text(
                      " Got a project? Let's talk.",
                      style: TextStyle(
                        height: 1.5,
                        color: Colors.white,
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
              ),
              height: 48.0,
              padding: EdgeInsets.symmetric(
                horizontal: 28.0,
              ),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "RESUME",
                  style: TextStyle(
                    color: Color(0xFFBA0000),
                    fontSize: 13.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ),
    image: Container(
      child: Image.asset(
        "assets/images/me.png",
        fit: BoxFit.contain,
      ),
    ),
  ),
);
