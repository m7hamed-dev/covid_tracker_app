import 'package:covid_19/data_layer/data_layer.dart';
import 'package:covid_19/tools/txt_style.dart';
import 'package:flutter/material.dart';

class TipsAdvice extends StatelessWidget {
  const TipsAdvice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(
          DataLayer.tips.length,
          (index) => Container(
            width: 135.0,
            margin: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(.05),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  DataLayer.tips[index].imageUrl,
                  alignment: Alignment.center,
                  width: 90.0,
                  height: 90.0,
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(5.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(.05),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    DataLayer.tips[index].advice,
                    style: TxtStyle.style(
                      color: Colors.black.withOpacity(.8),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
