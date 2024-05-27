import 'dart:ffi';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:premleague/model/ScorersModel.dart';


import '../../../../../../shared/component/components.dart';
import '../../../../../../shared/component/list_components.dart';

class TeamsGoal extends StatelessWidget {
  // const ScorersScreen({Key? key}) : super(key: key);
  List <Map>GoalsTeamList =[
    {
      'pos':'2',
      'TeamNam':'Arsenal',
      'Goals':'81'
    },
    {
      'pos':'3',
      'TeamNam':'LiverPool',
      'Goals':'67'
    },
    {
      'pos':'4',
      'TeamNam':'Tottenham Hostpur',
      'Goals':'64'
    },
    {
      'pos':'5',
      'TeamNam':'Brighton',
      'Goals':'62'
    },
    {
      'pos':'5',
      'TeamNam':'Newcastle United',
      'Goals':'62'
    },
    {
      'pos':'7',
      'TeamNam':'Brentford',
      'Goals':'52'
    },
    {
      'pos':'8',
      'TeamNam':'Manchester United',
      'Goals':'49'
    },
    {
      'pos':'9',
      'TeamNam':'Aston Villa',
      'Goals':'46'
    },
    {
      'pos':'10',
      'TeamNam':'Leicster City',
      'Goals':'46'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Goals',
        style: TextStyle(
          fontSize: 20,
          color: Colors.grey[300],
        ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,

            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: HexColor('#570861'),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '1',
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: Colors.purple,
                            ),
                          ),
                         /* Text(
                            'Kevin De Bruyne',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.grey,
                            ),
                          ),*/
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                            'Manchester City',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[300],
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            '92',
                            style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              color: Colors.purple,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 75,
                    ),
                    Container(
                      height: 200,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/images/manlogo.png'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(color: Colors.grey[300]),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    child: Row(
                      children: [
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Pos',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          'Player',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          width: 210,
                        ),


                        Text(
                          'Goals',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 650,
                child: ConditionalBuilder(
                  condition: GoalsTeamList.length > 0,
                  builder: (context) => ListView.separated(
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) => GoalsTeamsBuildItem(
                          GoalsTeamList[index], context),
                      separatorBuilder: (context, index) => myDevider(),
                      itemCount: GoalsTeamList.length),
                  fallback: (context) =>
                      Center(child: CircularProgressIndicator()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
