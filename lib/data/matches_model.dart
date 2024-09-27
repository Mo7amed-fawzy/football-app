class MatchParams {
  final int id;
  final String round;
  final String date;
  final Country country;
  final State state;
  final Team awayTeam;
  final Team homeTeam;
  final League league;

  MatchParams({
    required this.id,
    required this.round,
    required this.date,
    required this.country,
    required this.state,
    required this.awayTeam,
    required this.homeTeam,
    required this.league,
  });

  factory MatchParams.fromJson(Map<String, dynamic> jsonData) {
    return MatchParams(
      id: jsonData['id'] is int ? jsonData['id'] as int : 0, // التأكد من النوع
      round: jsonData['round'] is String ? jsonData['round'] as String : '',
      date: jsonData['date'] is String ? jsonData['date'] as String : '',
      country: Country.fromJson(jsonData['country']),
      state: State.fromJson(jsonData['state']),
      awayTeam: Team.fromJson(jsonData['awayTeam']),
      homeTeam: Team.fromJson(jsonData['homeTeam']),
      league: League.fromJson(jsonData['league']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'round': round,
      'date': date,
      'country': country.toJson(),
      'state': state.toJson(),
      'awayTeam': awayTeam.toJson(),
      'homeTeam': homeTeam.toJson(),
      'league': league.toJson(),
    };
  }
}

class Country {
  final String code;
  final String name;
  final String logo;

  Country({
    required this.code,
    required this.name,
    required this.logo,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      code: json['code'] is String ? json['code'] as String : '',
      name: json['name'] is String ? json['name'] as String : '',
      logo: json['logo'] is String ? json['logo'] as String : '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'name': name,
      'logo': logo,
    };
  }
}

class State {
  final int clock;
  final Score score;
  final String description;

  State({
    required this.clock,
    required this.score,
    required this.description,
  });

  factory State.fromJson(Map<String, dynamic> json) {
    return State(
      clock: json['clock'] is int ? json['clock'] as int : 0,
      score: Score.fromJson(json['score']),
      description:
          json['description'] is String ? json['description'] as String : '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'clock': clock,
      'score': score.toJson(),
      'description': description,
    };
  }
}

class Score {
  final String current;
  final String? penalties;

  Score({
    required this.current,
    this.penalties,
  });

  factory Score.fromJson(Map<String, dynamic> json) {
    String currentScore = json['current'] is String ? json['current'] : '0 - 0';
    return Score(
      current: currentScore,
      penalties:
          json['penalties'] != null ? json['penalties'].toString() : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'current': current,
      'penalties': penalties,
    };
  }
}

class Team {
  final int id;
  final String logo;
  final String name;

  Team({
    required this.id,
    required this.logo,
    required this.name,
  });

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      id: json['id'] is int ? json['id'] as int : 0,
      logo: json['logo'] is String ? json['logo'] as String : '',
      name: json['name'] is String ? json['name'] as String : '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'logo': logo,
      'name': name,
    };
  }
}

class League {
  final int id;
  final String logo;
  final String name;
  final String season;

  League({
    required this.id,
    required this.logo,
    required this.name,
    required this.season,
  });

  factory League.fromJson(Map<String, dynamic> json) {
    return League(
      id: json['id'] is int ? json['id'] as int : 0,
      logo: json['logo'] is String ? json['logo'] as String : '',
      name: json['name'] is String ? json['name'] as String : '',
      season: json['season'] is String ? json['season'] as String : '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'logo': logo,
      'name': name,
      'season': season,
    };
  }
}
