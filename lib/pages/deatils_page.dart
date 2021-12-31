import 'package:covid_19/models/spacific_country_mode.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  final SpacifcCountryCasesModel countryCasesModel;

  const DetailsPage({Key? key, required this.countryCasesModel})
      : super(key: key);
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final controller = ScrollController();
  double offset = 0;

  @override
  void initState() {
    super.initState();
    controller.addListener(onScroll);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.countryCasesModel.country,
        ),
      ),
      body: SingleChildScrollView(
        controller: controller,
        child: Column(
          children: <Widget>[
            // MyHeader(
            //   image: "assets/icons/Drcorona.svg",
            //   textTop: "All you need",
            //   textBottom: "is stay at home.",
            //   offset: offset,
            // ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding:const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: const Color(0xFFE5E5E5),
                ),
              ),
              child: Row(
                children: <Widget>[
                  // SvgPicture.asset("assets/icons/maps-and-flags.svg"),
                  const SizedBox(width: 20),
                  Expanded(
                    child: DropdownButton(
                      isExpanded: true,
                      underline: const SizedBox(),
                      // icon: SvgPicture.asset("assets/icons/dropdown.svg"),
                      value: "Indonesia",
                      items: [
                        'Indonesia',
                        'Bangladesh',
                        'United States',
                        'Japan'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {},
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: widget.countryCasesModel.country,
                              // text: 'Case Update\n ${widget.countryCasesModel.country',
                              // style: kTitleTextstyle,
                            ),
                            const TextSpan(
                              text: "Newest update March 28",
                              style: TextStyle(
                                  // color: kTextLightColor,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        "See details",
                        style: TextStyle(
                          // color: kPrimaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(0, 4),
                          blurRadius: 30,
                          // color: kShadowColor,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const <Widget>[
                        Counter(
                          color: Colors.green,
                          number: 1046,
                          title: "Infected",
                        ),
                        Counter(
                          color: Colors.green,
                          number: 87,
                          title: "Deaths",
                        ),
                        Counter(
                          color: Colors.green,
                          number: 46,
                          title: "Recovered",
                        ),
                      ],
                    ),
                  ),
                 const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:const <Widget>[
                      Text(
                        "Spread of Virus",
                        // style: kTitleTextstyle,
                      ),
                      Text(
                        "See details",
                        style: TextStyle(
                          // color: kPrimaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin:const EdgeInsets.only(top: 20),
                    padding:const EdgeInsets.all(20),
                    height: 178,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow:const [
                        BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 30,
                          // color: kShadowColor,
                        ),
                      ],
                    ),
                    child: Image.asset(
                      "assets/images/map.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Counter extends StatelessWidget {
  final int number;
  final Color color;
  final String title;
  const Counter({
    Key? key,
    required this.number,
    required this.color,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding:const EdgeInsets.all(6),
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color.withOpacity(.26),
          ),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(
                color: color,
                width: 2,
              ),
            ),
          ),
        ),
     const   SizedBox(height: 10),
        Text(
          "$number",
          style: TextStyle(
            fontSize: 40,
            color: color,
          ),
        ),
        Text(
          title,
          // style: kSubTextStyle,
        ),
      ],
    );
  }
}
