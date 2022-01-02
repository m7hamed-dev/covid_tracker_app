import 'package:flutter/material.dart';

class WorldwidePanel extends StatelessWidget {
  final Map worldData;
  const WorldwidePanel({
    Key? key,
    required this.worldData,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2,
      ),
      children: <Widget>[
        StatusPanel(
          title: 'todayCases',
          panelColor: Colors.red[100]!,
          textColor: Colors.red,
          count: worldData['todayCases'].toString(),
        ),
        StatusPanel(
          title: 'CONFIRMED',
          panelColor: Colors.red[100]!,
          textColor: Colors.red,
          count: worldData['cases'].toString(),
        ),
        StatusPanel(
          title: 'ACTIVE',
          panelColor: Colors.blue[100]!,
          textColor: Colors.blue[900]!,
          count: worldData['active'].toString(),
        ),
        StatusPanel(
          title: 'RECOVERED',
          panelColor: Colors.green[100]!,
          textColor: Colors.green,
          count: worldData['recovered'].toString(),
        ),
        StatusPanel(
          title: 'DEATHS',
          panelColor: Colors.grey[400]!,
          textColor: Colors.grey[900]!,
          count: worldData['deaths'].toString(),
        ),
      ],
    );
  }
}

class StatusPanel extends StatelessWidget {
  final Color panelColor;
  final Color textColor;
  final String title;
  final String count;

  const StatusPanel({
    Key? key,
    required this.panelColor,
    required this.textColor,
    required this.title,
    required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.all(10),
      // width: width / 2,
      decoration: BoxDecoration(
        color: panelColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Stack(
        // alignment: Alignment.center,
        children: <Widget>[
          // title
          Positioned(
            top: 5.0,
            left: 10.0,
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: textColor,
              ),
            ),
          ),
          // count
          Positioned(
            // top: 10.0,
            left: 10.0 + 30.0,
            // right: 20.0,
            bottom: 30.0,
            child: Text(
              count,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
          ),
          Positioned(
            bottom: 5.0,
            left: 10.0,
            child: Container(
              width: 10.0,
              height: 10.0,
              decoration: BoxDecoration(
                // color: Colors.black,
                color: textColor,
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  width: 2.0,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
