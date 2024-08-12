import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:premleague/Clean_arch/Config/Routes/app_routes.dart';
import 'package:premleague/modules/archived_tasks/premleague/cubit/cubit/prem_cubit_cubit.dart';
import 'package:premleague/Clean_arch/Features/Stats/data/models/StandingsModel.dart';
import '../widgets/stats_custom_widgets.dart';
class Stats extends StatelessWidget {
  const Stats({super.key});

  @override

  Widget build(BuildContext context) {
    return  BlocConsumer<PremCubitCubit, PremCubitState>(
          listener: (context, state) {},
          builder: (context, state) {
            PremCubitCubit cubit =PremCubitCubit.get(context);
            List<StandingsModel> Standingslist= PremCubitCubit.get(context).standings;

            return Scaffold(
              backgroundColor: Colors.transparent,
              // appBar: AppBar(),
              body: Padding(
                padding: const EdgeInsets.only(top: 40),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(
                          'Statistics',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[300],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          ' 2022/23 Top Statistics',
                          style: TextStyle(
                            color: Colors.grey[300],
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SizedBox(
                          width: double.infinity,
                          height: 250,
                          child: Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap:(){
                                   Navigator.pushNamed(context,
                                        Routes.scorer
                                        //AppRoutes.onGenerateRoute(Routes.Scorers as RouteSettings);
                                   );
                                    //   NavigateTo(context,ScorersScreen());
                                  } ,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: HexColor('#570861'),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        const Padding(
                                          padding:
                                              EdgeInsets.only(top: 30.0),
                                          child: Image(
                                            image: AssetImage(
                                                'assets/images/haland11.png'),
                                            height: 105.0,
                                            width: 90,
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: const Color(0xFF17203A),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          width: 150,
                                          height: 100,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Center(
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [

                                                  Text(
                                                    'Scorers',
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 35,
                                                      color: Colors.grey[300],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(

                                width: 10,
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap:(){
                                    cubit.getMatchesTimeData();
                                    Navigator.pushNamed(context,
                                        Routes.assist
                                    );
                                    } ,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: HexColor('#570861'),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Image(
                                            image: AssetImage(
                                                'assets/images/debruyne11.png'),
                                            height: 120.0,
                                            width: 90,
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            color:Color(0xFF17203A),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          width: 150,
                                          height: 100,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Center(
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [

                                                  Text(
                                                    'Assists',
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 35,
                                                      color: Colors.grey[300],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SizedBox(
                          width: double.infinity,
                          height: 250,
                          child: Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context,
                                        Routes.goals
                                    );
                                    },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: HexColor('#570861'),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Image(
                                            image: AssetImage(
                                                'assets/images/manlogo.png'),
                                            height: 120.0,
                                            width: 90,
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            color:Color(0xFF17203A),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          width: 150,
                                          height: 100,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Center(
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [

                                                  Text(
                                                    'Goals',
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 35,
                                                      color: Colors.grey[300],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context,
                                        Routes.cards
                                    );
                                    },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: HexColor('#570861'),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Image(
                                            image: AssetImage(
                                                'assets/images/YRcards.png'),
                                            height: 120.0,
                                            width: 100,
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            color:Color(0xFF17203A),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          width: 150,
                                          height: 100,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Center(
                                              child: Column(

                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [

                                                  Text(
                                                    'Cards',
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 35,
                                                      color: Colors.grey[300],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                'League Table',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.grey[300],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Container(
                                height: 25,
                                decoration: BoxDecoration(color: HexColor('#570861')),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      'Pos',
                                      style: TextStyle(
                                        color: Colors.grey[300],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Text(
                                      'Club',
                                      style: TextStyle(
                                        color: Colors.grey[300],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 140,
                                    ),
                                    Text(
                                      'P',
                                      style: TextStyle(
                                        color: Colors.grey[300],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 50,
                                    ),
                                    Text(
                                      'GF',
                                      style: TextStyle(
                                        color: Colors.grey[300],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Text(
                                      'PTS',
                                      style: TextStyle(
                                        color: Colors.grey[300],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: HexColor('#570861'),
                              ),
                              height:550,
                              width: double.infinity,
                              child:
                               ConditionalBuilder(
                                 condition: Standingslist.length > 0,
                                 builder: (context) => ListView.separated(
                                     physics: BouncingScrollPhysics(),
                                     itemBuilder: (context,int index) => BuildLeagueTable(
                                         Standingslist[index], context),
                                     separatorBuilder: (context, index) =>   Padding(
                                       padding: const EdgeInsets.all(4.0),
                                       child:   Container(

                                         height: 1,

                                         width: double.infinity,

                                         color:Colors.grey[300],

                                       ),
                                     ),
                                     itemCount: Standingslist.length),
                                 fallback: (context) =>
                                     Center(child: CircularProgressIndicator()),
                               ),

                            ),
                          ),
                            SizedBox(height: 60,),
                          ],
                        ),
                      ),

                    /*
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          height: 750,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: AssetImage('assets/images/Hallan.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 20,
                      ),

                       */
                    ],
                  ),
                ),
              ),
            );
          },
        );

  }
}
