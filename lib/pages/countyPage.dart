import 'package:covid_19/models/spacific_country_mode.dart';
import 'package:covid_19/models/world_cases_model.dart';
import 'package:covid_19/pages/deatils_page.dart';
import 'package:covid_19/pages/search.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CountryPage extends StatefulWidget {
  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  List<SpacifcCountryCasesModel> countryData = [];
  List<SpacifcCountryCasesModel> searchCountryData = [];

  fetchCountryData() async {
    http.Response response =
        await http.get(Uri.parse('https://corona.lmao.ninja/v2/countries'));
    setState(() {
      final spacifcCountryCasesModel =
          spacifcCountryCasesModelFromJson(response.body);

      searchCountryData = countryData = spacifcCountryCasesModel;
      // searchCountryData = countryData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    fetchCountryData();
    super.initState();
  }

  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          // IconButton(
          //   icon: Icon(Icons.search),
          //   onPressed: () {
          //     showSearch(context: context, delegate: Search(countryData));
          //   },
          // )
        ],
        title: const Text('Country Stats'),
      ),
      body: countryData.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                TextFormField(
                  controller: _searchController,
                  onChanged: (value) {
                    searchCountryData = _searchController.text.isEmpty
                        ? countryData
                        : searchCountryData.where((e) {
                            // print('country = ${e.country}');
                            print(
                                'country ${e.country.startsWith(_searchController.text.trim())}');
                            if (_searchController.text
                                .trim()
                                .contains(e.country)) {
                              return true;
                            }
                            return false;
                          }).toList();
                    setState(() {});
                  },
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: searchCountryData.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return DetailsPage(
                                countryCasesModel: searchCountryData[index],
                              );
                            },
                          ));
                        },
                        child: Card(
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  width: 200,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        countryData[index].country,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Image.network(
                                        countryData[index].countryInfo.flag,
                                        height: 50,
                                        width: 60,
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                    child: Container(
                                  child: Column(
                                    children: <Widget>[
                                      // Text(
                                      //   'CONFIRMED:' +
                                      //       countryData[index]['cases']
                                      //           .toString(),
                                      //   style: const TextStyle(
                                      //       fontWeight: FontWeight.bold,
                                      //       color: Colors.red),
                                      // ),
                                      // Text(
                                      //   'ACTIVE:' +
                                      //       countryData[index]['active']
                                      //           .toString(),
                                      //   style: const TextStyle(
                                      //       fontWeight: FontWeight.bold,
                                      //       color: Colors.blue),
                                      // ),
                                      // Text(
                                      //   'RECOVERED:' +
                                      //       countryData[index]['recovered']
                                      //           .toString(),
                                      //   style: const TextStyle(
                                      //       fontWeight: FontWeight.bold,
                                      //       color: Colors.green),
                                      // ),
                                      // Text(
                                      //   'DEATHS:' +
                                      //       countryData[index]['deaths']
                                      //           .toString(),
                                      //   style: TextStyle(
                                      //       fontWeight: FontWeight.bold,
                                      //       color: Theme.of(context).brightness ==
                                      //               Brightness.dark
                                      //           ? Colors.grey[100]
                                      //           : Colors.grey[900]),
                                      // ),
                                    ],
                                  ),
                                ))
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
