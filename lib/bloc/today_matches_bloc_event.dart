import 'package:equatable/equatable.dart';

abstract class TodayMatchesBlocEvent extends Equatable {
  const TodayMatchesBlocEvent();

  @override
  List<Object> get props => [];
}

final class LoadTodayMatchesEvent extends TodayMatchesBlocEvent {}
