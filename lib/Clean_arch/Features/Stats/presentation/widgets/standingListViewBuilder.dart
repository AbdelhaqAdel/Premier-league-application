import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:premleague/Clean_arch/Features/Stats/presentation/manager/cubit/standing_table_cubit.dart';
import 'package:premleague/Clean_arch/Features/Stats/presentation/widgets/standing_table_listView.dart';

class StandingListViewBuilder extends StatelessWidget {
  const StandingListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StandingTableCubit,StandingTableState>(builder:(context,state){
       if(state is FetchStandingTableSuccess){
        return StandingListView(standingList: state.standing,);
       }else if(state is FetchStandingTableError){
        return Text(state.errorMessage);
       }else{
        return const CircularProgressIndicator();
       }

    });
  }
}