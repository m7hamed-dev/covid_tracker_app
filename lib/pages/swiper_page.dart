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
              child: Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  _info[index],
                  style: const TextStyle(
                    fontFamily: 'Ubuntu',
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        );
      },
      // duration: 9000,
      // autoplayDelay: 1000,
      indicatorLayout: PageIndicatorLayout.SCALE,
      autoplay: true,
      pagination: const SwiperPagination(),
      control: const SwiperControl(),
      fade: 1.0,
      viewportFraction: 0.98,
    );
  }
}
