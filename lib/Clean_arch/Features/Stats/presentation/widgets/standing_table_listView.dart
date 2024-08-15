import 'package:flutter/material.dart';
import 'package:premleague/Clean_arch/Features/Stats/data/models/StandingsModel.dart';
import 'package:premleague/Clean_arch/Features/Stats/data/repositories/standing_repo.dart';
import 'package:premleague/Clean_arch/Features/Stats/presentation/widgets/stats_custom_widgets.dart';

class StandingListView extends StatelessWidget {
  final List<StandingsModel>?standingList;
 const StandingListView({this.standingList});
// final StandingRepoImpl standingRepoImpl=new StandingRepoImpl(getIt.get<>());
  @override
  Widget build(BuildContext context) {
    standingList?.forEach((element) {
      print(element.goals);
    });
    return ListView.separated(
       physics: const BouncingScrollPhysics(),
                                    itemBuilder: (context, int index) =>
                                        BuildLeagueTable(
                                            standingList![index], context),
                                    separatorBuilder: (context, index) =>
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Container(
                                            height: 1,
                                            width: double.infinity,
                                            color: Colors.grey[300],
                                          ),
                                        ),
                                    itemCount: standingList!.length
      );
  }
}