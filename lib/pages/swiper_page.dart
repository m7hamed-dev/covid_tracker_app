import 'package:covid_19/data_layer/data_layer.dart';
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
        return Container(
          color: Colors.black.withOpacity(.8),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                _images[index],
                fit: BoxFit.fill,
              ),
              Positioned(
                bottom: 10,
                left: 5.0,
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.2),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    DataLayer.symptomsDiseaseData[index],
                    style: const TextStyle(
                      fontFamily: 'Ubuntu',
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      // duration: 9000,
      // autoplayDelay: 1000,
      indicatorLayout: PageIndicatorLayout.SCALE,
      autoplay: true,
      pagination: const SwiperPagination(
        alignment: Alignment.centerLeft,
      ),
      // control: const SwiperControl(),
      // fade: 1.0,
      // viewportFraction: 0.98,
    );
  }
}
