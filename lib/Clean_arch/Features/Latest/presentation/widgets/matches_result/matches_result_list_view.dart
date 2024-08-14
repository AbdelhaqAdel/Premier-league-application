import 'package:flutter/cupertino.dart';

import '../../../domain/entities/matches_resault_entity.dart';
import '../matches_custom_widgets.dart';

class MatchesResultListView extends StatelessWidget {
  final List<MatchesResultEntity>?matchesResult;
  const MatchesResultListView({this.matchesResult});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context ,index)=>matchsResult(matchesResult![index],context),
        separatorBuilder: (context, index) => SizedBox(width: 15,),
        itemCount: matchesResult!.length);
  }
}
