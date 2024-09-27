import 'package:equatable/equatable.dart';
import 'package:football_app/data/matches_model.dart';

abstract class TodayMatchesBlocState extends Equatable {
  const TodayMatchesBlocState();

  @override
  List<Object> get props => [];
}

class LoadingTodayMatches extends TodayMatchesBlocState {}

class LoadedTodayMatches extends TodayMatchesBlocState {
  final List<MatchParams> matchesList;
  const LoadedTodayMatches({required this.matchesList});
}

class ErrorTodayMatches extends TodayMatchesBlocState {
  final String errorMsq;
  const ErrorTodayMatches({required this.errorMsq});
}
