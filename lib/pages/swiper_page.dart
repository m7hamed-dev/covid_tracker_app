import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

final _images = [
  'assets/images/1.png',
  'assets/images/2.png',
  'assets/images/3.png',
  'assets/images/4.png',
];
final _info = [
  'Fever',
  'Dry Cough',
  'Headache',
  'Breathless',
];

class SwiperPage extends StatelessWidget {
  const SwiperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemCount: _images.length,
      itemBuilder: (BuildContext context, int index) {
        return Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              _images[index],
              fit: BoxFit.fill,
            ),
            Positioned(
              bottom: 10,
              left: 0.0,
              child: Text(
                _info[index],
                style: const TextStyle(
                  fontFamily: 'Ubuntu',
                  // color: Colors.orange[800],
                  // fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
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
