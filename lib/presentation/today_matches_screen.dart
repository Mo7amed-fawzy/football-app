import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/bloc/today_matches_bloc.dart';
import 'package:football_app/bloc/today_matches_bloc_state.dart';
import 'package:intl/intl.dart';

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
                String date = state.matchesList[index].date.toString();

                DateTime datetime = DateTime.parse(date);

                String formatedDateTime = DateFormat('h:mm a').format(datetime);
                return Center(
                  child: Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Text(state.matchesList[index].league.name),
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              // league
                              Row(
                                children: [
                                  Text(state.matchesList[index].country.name),
                                  const Text(' - '),
                                  logoNameLegue(
                                      logo:
                                          state.matchesList[index].league.logo,
                                      name:
                                          state.matchesList[index].league.name),
                                ],
                              ),
                              state.matchesList[index].state == 'Finished' ||
                                      state.matchesList[index].state ==
                                          'Finished after penalties' ||
                                      state.matchesList[index].state ==
                                          'Finished after extra time'
                                  ? Row(
                                      children: [
                                        const Text(
                                          'live   ',
                                          style: TextStyle(color: Colors.red),
                                        ),
                                        Text(
                                            state.matchesList[index].state.clock
                                                .toString(),
                                            style: const TextStyle(
                                                color: Colors.green)),
                                        const Text(
                                          '',
                                          style: TextStyle(color: Colors.green),
                                        )
                                      ],
                                    )
                                  : const SizedBox.shrink(),
                              state.matchesList[index].state.score.current
                                      .toString()
                                      .isEmpty
                                  ? Text(
                                      formatedDateTime,
                                      style: const TextStyle(
                                          color: Colors.deepOrange,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    )
                                  : const SizedBox.shrink(),
                              Row(
                                children: [
                                  logoNameTeams(
                                      logo: state
                                          .matchesList[index].homeTeam.logo,
                                      name: state
                                          .matchesList[index].homeTeam.name),
                                  // ignore: unnecessary_null_comparison
                                  state.matchesList[index].state.score != null
                                      ? Row(
                                          children: [
                                            Text(
                                              state.matchesList[index].state
                                                  .score.current
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.deepOrange),
                                            ),
                                            // Text(
                                            //   ' : ',
                                            //   style: TextStyle(fontWeight: FontWeight.bold),
                                            // ),
                                          ],
                                        )
                                      : const SizedBox.shrink(),
                                  logoNameTeams(
                                      logo: state
                                          .matchesList[index].awayTeam.logo,
                                      name: state
                                          .matchesList[index].awayTeam.name)
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
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

  logoNameLegue({required String? logo, required String? name}) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.transparent,
          child: logo != null && logo.isNotEmpty
              ? Image.network(
                  logo,
                  height: 50,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.image_not_supported, size: 50);
                  },
                )
              : const Icon(Icons.image_not_supported, size: 50),
        ),
        const SizedBox(
          width: 10,
        ),
        SizedBox(
          width: 200,
          child: Text(
            name ?? 'League name unavailable',
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  logoNameTeams({required String? logo, required String? name}) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.transparent,
          child: logo != null && logo.isNotEmpty
              ? Image.network(
                  logo,
                  height: 35,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.image_not_supported, size: 35);
                  },
                )
              : const Icon(Icons.image_not_supported, size: 35),
        ),
        const SizedBox(
          width: 5,
        ),
        SizedBox(
          width: 120,
          child: Text(
            name ?? 'Team name unavailable',
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
