import 'package:football_app/data/matches_model.dart';

abstract class TodayMatchesBlocState {}

class LoadingTodayMatches extends TodayMatchesBlocState {}

class LoadedTodayMatches extends TodayMatchesBlocState {
  final List<MatchParams> matchesList;
  LoadedTodayMatches({required this.matchesList});
}

class ErrorTodayMatches extends TodayMatchesBlocState {
  final String errorMsq;
  ErrorTodayMatches({required this.errorMsq});
}
