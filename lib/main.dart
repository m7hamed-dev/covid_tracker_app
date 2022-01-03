import 'package:covid_19/models/spacific_country_mode.dart';
import 'package:covid_19/pages/deatils_page.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'widgets/symptoms_disease.dart';
import 'widgets/tips_advice.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyThemeData.themeData,
      home: HomePage(),

      // home: DetailsPage(
      //   countryCasesModel: SpacifcCountryCasesModel(
      //     updated: 3,
      //     country: 'sudan',
      //     countryInfo: CountryInfo(
      //       id: 2,
      //       iso2: 'iso2',
      //       iso3: 'iso3',
      //       lat: 1.2,
      //       long: 3.4,
      //       flag: 'flag',
      //     ),
      //     cases: 33,
      //     todayCases: 22,
      //     deaths: 33,
      //     todayDeaths: 33,
      //     recovered: 33,
      //     todayRecovered: 33,
      //     active: 33,
      //     critical: 33,
      //     casesPerOneMillion: 33,
      //     deathsPerOneMillion: 33,
      //     tests: 33,
      //     testsPerOneMillion: 33,
      //     population: 33,
      //     continent: '33',
      //     oneCasePerPeople: 33,
      //     oneDeathPerPeople: 33,
      //     oneTestPerPeople: 33,
      //     activePerOneMillion: 33,
      //     recoveredPerOneMillion: 33,
      //     criticalPerOneMillion: 33,
      //   ),
      // ),
    );
  }
}

class MyThemeData {
  static ThemeData themeData = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Colors.grey[50],
    primaryColor: Colors.grey,
  );
}
