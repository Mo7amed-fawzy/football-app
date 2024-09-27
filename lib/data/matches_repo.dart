import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class TodayMachesRepo {
  getTodayMaches() async {
    // خدت http protocol من الدوكس

    var client = http.Client();

    var params = {'date': '2023-08-06'};
    var url = 'https://sport-highlights-api.p.rapidapi.com/football/matches' +
        '?' +
        Uri(queryParameters: params).query;
    // var url =
    //     'https://api-football-v1.p.rapidapi.com/v3/fixtures?date=2021-04-07';// طريقة تاني بسيطة للفلتره

    try {
      var response = await client.get(Uri.parse(url), headers: {
        'x-rapidapi-key': 'b4089bc2f7msh720f42d60916b17p1a9a2cjsn0676e2f0f1a5',
        'x-rapidapi-host': 'sport-highlights-api.p.rapidapi.com',
      });
      var decodedResponse = jsonDecode(response.body);
      if (kDebugMode) {
        print(decodedResponse);
      }
    } finally {
      client.close();
    }
  }
}
