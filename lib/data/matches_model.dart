class MatchParams {
  final int offset;
  final int limit;
  final String countryName;
  final String countryCode;
  final String homeTeamName;
  final String awayTeamName;
  final String homeTeamId;
  final String awayTeamId;
  final String timezone;
  final String season;
  final String leagueId;
  final String leagueName;
  final String date;

  MatchParams({
    required this.offset,
    required this.limit,
    required this.countryName,
    required this.countryCode,
    required this.homeTeamName,
    required this.awayTeamName,
    required this.homeTeamId,
    required this.awayTeamId,
    required this.timezone,
    required this.season,
    required this.leagueId,
    required this.leagueName,
    required this.date,
  });

  // convert from json to model
  factory MatchParams.fromJson(Map<String, dynamic> jsonData) {
    return MatchParams(
      offset: jsonData['offset'] as int,
      limit: jsonData['limit'] as int,
      countryName: jsonData['countryName'] as String,
      countryCode: jsonData['countryCode'] as String,
      homeTeamName: jsonData['homeTeamName'] as String,
      awayTeamName: jsonData['awayTeamName'] as String,
      homeTeamId: jsonData['homeTeamId'] as String,
      awayTeamId: jsonData['awayTeamId'] as String,
      timezone: jsonData['timezone'] as String,
      season: jsonData['season'] as String,
      leagueId: jsonData['leagueId'] as String,
      leagueName: jsonData['leagueName'] as String,
      date: jsonData['date'] as String,
    );
  }

  // تحويل النموذج إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'offset': offset,
      'limit': limit,
      'countryName': countryName,
      'countryCode': countryCode,
      'homeTeamName': homeTeamName,
      'awayTeamName': awayTeamName,
      'homeTeamId': homeTeamId,
      'awayTeamId': awayTeamId,
      'timezone': timezone,
      'season': season,
      'leagueId': leagueId,
      'leagueName': leagueName,
      'date': date,
    };
  }
}
