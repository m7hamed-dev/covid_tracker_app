import 'package:flutter/material.dart';

class SymptomsDisease extends StatelessWidget {
  const SymptomsDisease({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      // color: Colors.amber.shade100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(
          4,
          (index) => Container(
            width: 90,
            height: 60,
            margin: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              color: Colors.amber.shade100,
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: AssetImage(
                  _imagePath(index),
                ),
              ),
              boxShadow: [
                BoxShadow(),
              ],
            ),
            child: Container(
              padding: const EdgeInsets.only(bottom: 10.0, left: 4.0),
              alignment: Alignment.bottomLeft,
              // decoration: BoxDecoration(
              //   color: Colors.amber.shade100,
              //   borderRadius: BorderRadius.circular(10.0),
              //   boxShadow: [
              //     BoxShadow(),
              //   ],
              // ),
              child: Text('data'),
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
