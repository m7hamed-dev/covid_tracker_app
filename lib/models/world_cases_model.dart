// To parse this JSON data, do
//
//     final worldCasesModel = worldCasesModelFromJson(jsonString);

import 'dart:convert';

Map<String, double> worldCasesModelFromJson(String str) =>
    Map.from(json.decode(str))
        .map((k, v) => MapEntry<String, double>(k, v.toDouble()));

String worldCasesModelToJson(Map<String, double> data) =>
    json.encode(Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v)));
