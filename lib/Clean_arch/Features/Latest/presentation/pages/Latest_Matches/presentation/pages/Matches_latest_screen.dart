import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:premleague/Clean_arch/Features/Latest/presentation/pages/LatestScreens/MatchDay.dart';
import 'package:premleague/Clean_arch/Features/Latest/presentation/pages/Latest_News/presentation/pages/video.dart';
import 'package:premleague/shared/component/components.dart';
import '../../../../../../../../model/MatchesResultsModel.dart';
import '../../../../../../../../model/MatchsTimeModel.dart';
import '../../../../../../../../shared/component/list_components.dart';
import '../../../../../../../../modules/archived_tasks/premleague/cubit/cubit/prem_cubit_cubit.dart';
import '../../../../../../Score/presentation/pages/Score.dart';
import '../../../../../../Stats/presentation/pages/StatsScreen.dart';
import '../../../Latest_News/presentation/pages/video.dart';

class LatestMatches extends StatefulWidget {
  const LatestMatches({super.key});

  @override
  State<LatestMatches> createState() => _LatestState();
}

class _LatestState extends State<LatestMatches> {
  @override
  Widget build(BuildContext context) {
    return
      BlocConsumer<PremCubitCubit, PremCubitState>(
        listener: (context, state) {},
        builder: (context, state) {
          List <MatchesResultsModel> matchesResultList =PremCubitCubit.get(context).matchesResults;
          List <MatchTimeModel> matchesTime =PremCubitCubit.get(context).matchsTime;
          return Scaffold(
            backgroundColor:Colors.transparent,
            body:
            Padding(
                padding: const EdgeInsets.all(0),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
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
                                //mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15,left: 5,bottom: 15),
                                    child: Text('Match week Result ',
                                      style: Theme.of(context).textTheme.bodyLarge,
                                    ),
                                  ),
                                  Container(

                                    height: 150,
                                    //width: double.infinity,
                                    child: ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                        physics: BouncingScrollPhysics(),
                                        itemBuilder: (context ,index)=>matchsResult(matchesResultList[index],context),
                                        separatorBuilder: (context, index) => SizedBox(width: 15,),
                                        itemCount: 5),
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
                                      'Matchs Week time ',
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

                                 // Container(
                                 //      height: 35,
                                 //      width: 80,
                                 //      decoration: BoxDecoration(
                                 //          borderRadius:
                                 //              BorderRadius.circular(20),
                                 //          color:  HexColor('#570861') ,
                                 //      ),
                                 //      child: defaultTextButton(
                                 //        Color: Colors.grey[300],
                                 //        function: () {
                                 //          NavigateTo(context, MatchDay());
                                 //        },
                                 //        text: 'See All',
                                 //      ),
                                 //    ),






                    ]
                  ),
                ),
              ),

          );
        },
      );
    //);
  }
}