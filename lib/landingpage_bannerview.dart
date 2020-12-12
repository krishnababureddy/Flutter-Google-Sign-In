import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class LandingPageBannerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: FittedBox(
          child: Image(
            image: AssetImage('assets/landing_banner.jpg'),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
