import 'package:covid_19/data_layer/data_layer.dart';
import 'package:covid_19/tools/txt_style.dart';
import 'package:flutter/material.dart';

class SymptomsDisease extends StatelessWidget {
  const SymptomsDisease({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(
          4,
          (index) => Container(
            width: 90,
            margin: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(.01),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Stack(
              children: [
                Image.asset(
                  _imagePath(index),
                ),
                Positioned(
                  bottom: 2.0,
                  left: 5.0,
                  right: 5.0,
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.2),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Text(
                      DataLayer.symptomsDiseaseData[index],
                      style: TxtStyle.style(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _imagePath(int index) {
    if (index == 0) {
      index++;
      return 'assets/images/$index.png';
    }
    return 'assets/images/$index.png';
  }
}
