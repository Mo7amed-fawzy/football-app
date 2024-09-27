import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/bloc/today_matches_bloc.dart';
import 'package:football_app/bloc/today_matches_bloc_state.dart';

class TodayMatchesScreen extends StatelessWidget {
  const TodayMatchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Today Matches')),
      ),
      body: BlocBuilder<TodayMatchesBloc, TodayMatchesBlocState>(
        builder: (context, state) {
          if (state is LoadingTodayMatches) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LoadedTodayMatches) {
            return ListView(
              children: List.generate(state.matchesList.length, (index) {
                return Center(
                  child: Card(
                    child: Text(state.matchesList[index].league.name),
                  ),
                );
              }),
            );
          } else if (state is ErrorTodayMatches) {
            return Center(child: Text('Error: ${state.errorMsq}'));
          }
          return const Center(child: Text('Welcome'));
        },
      ),
    );
  }
}
