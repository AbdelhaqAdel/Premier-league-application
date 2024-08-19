import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:premleague/Clean_arch/Features/Latest/presentation/manager/cubit/matches_result_cubit.dart';
import 'package:premleague/Clean_arch/Features/Live_Score/presentation/widgets/matches_soccer_list_view.dart';

class MatchesSoccerBuilder extends StatelessWidget {
  const MatchesSoccerBuilder({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MatchesResultCubit,MatchesResultState>(builder: (context,state){
  if(state is FetchMatchesResultSuccessState){
    print('-----------------------------------------------');
    //state.matchesResult.forEach((e){print(e.stateE);});
            return MatchesSoccerListView(matchesSoccer:state.matchesResult);
          }else if(state is FetchMatchesResultErrorState){
            //     print('-----------------------------------------------');
            // print(state.error);
            return Text(state.error);
          }else{
            return const Center(child: CircularProgressIndicator());
          }
    });
  }
}