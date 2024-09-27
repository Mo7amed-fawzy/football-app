import 'dart:convert';

import 'package:football_app/data/matches_model.dart';
import 'package:http/http.dart' as http;

class TodayMachesRepo {
  Future<List<MatchParams>> getTodayMaches() async {
    var client = http.Client();

    var params = {'date': '2023-08-06'};
    var url = 'https://sport-highlights-api.p.rapidapi.com/football/matches' +
        '?' +
        Uri(queryParameters: params).query;

    try {
      var response = await client.get(Uri.parse(url), headers: {
        'x-rapidapi-key': 'b4089bc2f7msh720f42d60916b17p1a9a2cjsn0676e2f0f1a5',
        'x-rapidapi-host': 'sport-highlights-api.p.rapidapi.com',
      });

      List decodedResponse = jsonDecode(response.body);

      return decodedResponse.map((e) => MatchParams.fromJson(e)).toList();
    } catch (e) {
      print('Error occurred: $e');
      return []; // إرجاع قائمة فارغة في حالة الخطأ
    } finally {
      client.close();
    }
  }
}
