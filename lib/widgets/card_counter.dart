import 'package:covid_19/models/spacific_country_mode.dart';
import 'package:covid_19/tools/txt_style.dart';
import 'package:flutter/material.dart';

class CardCounter extends StatelessWidget {
  const CardCounter({
    Key? key,
    required this.data,
  }) : super(key: key);

  ///
  final SpacifcCountryCasesModel data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      // decoration: BoxDecoration(),
      child: Column(
        children: <Widget>[
          // row 1
          _buildCircleDot(
            index: 1,
            child: Row(
              children: [
                // todayCases
                Column(
                  children: [
                    Text(' todayCases ${data.todayCases}',
                        style: TxtStyle.style()),
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    Text('CONFIRMED', style: TxtStyle.style()),
                    Text('${data.cases}', style: TxtStyle.style()),
                  ],
                ),
              ],
            ),
          ),
          // row 2
          _buildCircleDot(
            index: 0,
            child: Row(
              children: [
                Column(
                  children: [
                    Text('ACTIVE', style: TxtStyle.style()),
                    Text('${data.active}', style: TxtStyle.style()),
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    Text('RECOVERED', style: TxtStyle.style()),
                    Text('${data.recovered}', style: TxtStyle.style()),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Column _buildCircleDot({required int index, required Widget child}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.transparent,
          border: Border.all(
            color: getColorCase(index),
            width: 2,
          ),
        ),
      ),
     const Text('data'),
      child,
    ],
  );
}

Color getColorCase(int index) {
  switch (index) {
    case 0:
      return Colors.grey;
    case 1:
      return Colors.green;
    case 2:
      return Colors.red;
    case 3:
      return Colors.blue;
  }
  return Colors.blue;
}
