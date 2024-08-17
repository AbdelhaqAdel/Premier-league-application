import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:premleague/Clean_arch/Features/Latest/data/data_sources/matches_resault_data_source.dart';
import 'package:premleague/Clean_arch/Features/Latest/data/data_sources/matches_result_local_data_source.dart';
import 'package:premleague/Clean_arch/Features/Latest/data/repositories/matches_result_repo_impl.dart';
import 'package:premleague/Clean_arch/Features/Latest/domain/use_cases/matches_result_useCase.dart';
import '../../../data/remote/models/MatchsTimeModel.dart';
import '../../../../../../modules/archived_tasks/premleague/cubit/cubit/prem_cubit_cubit.dart';
import '../../manager/cubit/matches_result_cubit.dart';
import '../../widgets/matches_custom_widgets.dart';
import '../../widgets/matches_result/matches_result_list_builder.dart';

class LatestMatches extends StatefulWidget {
  const LatestMatches({super.key});
  @override
  State<LatestMatches> createState() => _LatestState();
}
class _LatestState extends State<LatestMatches> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create:(context)=>
            MatchesResultCubit(
               FetchMatchesResultUseCase(
                   //MatchesResultRepoImpl.getInstance()
                   MatchesResultRepoImpl(MatchesResultRemoteDataSourceImpl(),MatchesResultLocalDataSourceImpl())
               )
            )..fetchMatchesResultFromCubit() ,
     child: BlocConsumer<MatchesResultCubit,MatchesResultState>(
        listener: (context, state) {},
        builder: (context, state) {
          //List <MatchesResultsModel> matchesResultList =PremCubitCubit.get(context).matchesResults;
          List <MatchTimeModel> matchesTime =PremCubitCubit.get(context).matchsTime;
          return Scaffold(
            backgroundColor:Colors.transparent,
            body:
            Padding(
                padding: const EdgeInsets.all(0),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15,left: 5,bottom: 15),
                                    child: Text('Match week Result ',
                                      style: Theme.of(context).textTheme.bodyLarge,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 150,
                                    //width: double.infinity,
                                    child: MatchesResultBuilder(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child:
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child:
                                 Text(
                                      'Matches Week time ',
                                      style: Theme.of(context).textTheme.bodyLarge,
                                    ),
                            ),),
                                   Container(
                                     padding: const EdgeInsets.all(15.0),
                                    height: 800,
                                      width: double.infinity,
                                      child: ConditionalBuilder(
                                        condition: matchesTime.length > 0,
                                        builder: (context) =>  ListView.separated(
                                            physics: BouncingScrollPhysics(),
                                            itemBuilder: (context, index) =>
                                                matchstime(matchesTime[index],context),
                                            separatorBuilder: (context, index) =>
                                               SizedBox(height: 10),
                                            itemCount:  matchesTime.length),
                                        fallback: (context) =>
                                            Center(child: CircularProgressIndicator()),
                                      ),
                                    ),
                    ]
                  ),
                ),
              ),

          );
        },
      ));
    //);
  }
}