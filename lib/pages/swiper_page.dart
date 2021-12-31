import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

final _images = [
  'assets/images/1.png',
  'assets/images/2.png',
  'assets/images/3.png',
  'assets/images/4.png',
];

class SwiperPage extends StatelessWidget {
  const SwiperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemCount: _images.length,
      itemBuilder: (BuildContext context, int index) {
        return Image.asset(
          _images[index],
          fit: BoxFit.fill,
        );
      },
      indicatorLayout: PageIndicatorLayout.SCALE,
      autoplay: true,
      autoplayDelay: 1000,
      pagination: const SwiperPagination(),
      control: const SwiperControl(),
      fade: 1.0,
      viewportFraction: 0.85,
    );
  }
}
