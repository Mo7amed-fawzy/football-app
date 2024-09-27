import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/data/matches_model.dart';
import 'package:football_app/data/matches_repo.dart';
import 'today_matches_bloc_event.dart';
import 'today_matches_bloc_state.dart';

class TodayMatchesBloc
    extends Bloc<TodayMatchesBlocEvent, TodayMatchesBlocState> {
  final TodayMachesRepo todayMatchesRepository;

  TodayMatchesBloc(this.todayMatchesRepository) : super(LoadingTodayMatches()) {
    on<TodayMatchesBlocEvent>((event, emit) async {
      emit(LoadingTodayMatches());
      try {
        final List<MatchParams> matchesList =
            await todayMatchesRepository.getTodayMaches();
        emit(LoadedTodayMatches(matchesList: matchesList));
      } catch (e) {
        emit(ErrorTodayMatches(errorMsq: e.toString()));
      }
    });
  }
}
