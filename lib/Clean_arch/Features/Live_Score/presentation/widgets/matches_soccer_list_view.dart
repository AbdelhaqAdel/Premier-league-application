import 'package:flutter/material.dart';
import 'package:premleague/Clean_arch/Features/Latest/domain/entities/matches_result_entity.dart';
import 'package:premleague/Clean_arch/Features/Live_Score/presentation/widgets/matches_socer_custom_widget.dart';

class MatchesSoccerListView extends StatelessWidget {
   final List<MatchesResultEntity>?matchesSoccer;
  const MatchesSoccerListView({required this.matchesSoccer, super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
     physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return  SoccerMatchResult(matchesSoccer![index+1],context);},
      separatorBuilder: (context, index) =>
          const SizedBox(height: 10),
      itemCount: matchesSoccer!.length-1);
  }
}