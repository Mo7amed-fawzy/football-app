import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/data/matches_repo.dart';
// import 'package:football_app/data/matches_repo.dart';
import 'package:football_app/presentation/today_matches_screen.dart';

void main() {
  // TodayMachesRepo().getTodayMaches();
  runApp(const FootBallApp());
}

class FootBallApp extends StatelessWidget {
  const FootBallApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RepositoryProvider<TodayMachesRepo>(
        // angel pracit
        // بنربط الاسكرين بالحدث
        create: (context) => TodayMachesRepo(),
        child:const TodayMatchesScreen(),
      ),
    );
  }
}
