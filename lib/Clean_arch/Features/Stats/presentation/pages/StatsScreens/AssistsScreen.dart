import 'dart:ffi';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:premleague/model/PlayerAssistsModel.dart';
import 'package:premleague/model/ScorersModel.dart';
import '../../../../../../shared/component/components.dart';
import '../../../../../../shared/component/list_components.dart';
import '../../../../../../modules/archived_tasks/premleague/cubit/cubit/prem_cubit_cubit.dart';

class AssitsScreen extends StatelessWidget {
 // const ScorersScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<PremCubitCubit, PremCubitState>(
          listener: (context, state) {},
          builder: (context, state) {
            PremCubitCubit cubit =PremCubitCubit.get(context);
            List<assistsModel> Assistslist= PremCubitCubit.get(context).assists;
            return Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                
                title: Text('Assists'),
              ),
              body: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
//mainAxisAlignment: MainAxisAlignment.start,

                    children: [
                      Container(
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
                                  Text(
                                    'Kevin De Bruyne',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.grey[300],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Text(
                                    'Manchester City',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey[300],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    '16',
                                    style: TextStyle(
                                      fontSize: 50,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.purple,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                           Spacer(),
                            Container(
                              height: 200,
                              width: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/debruyne11.png'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                     Container(
                          decoration: BoxDecoration(color: Colors.grey[200]),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  'Pos',
                                  style: TextStyle(
                                    color: Colors.grey[800],
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Text(
                                  'Player',
                                  style: TextStyle(
                                    color: Colors.grey[800],
                                  ),
                                ),
                                SizedBox(
                                  width: 120,
                                ),
                                Text(
                                  'Team',
                                  style: TextStyle(
                                    color: Colors.grey[800],
                                  ),
                                ),
                                SizedBox(
                                  width: 70,
                                ),
                                Text(
                                  'Assists',
                                  style: TextStyle(
                                    color: Colors.grey[800],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                      Expanded(
                        child: Container(
                          height:430,
                          child: ConditionalBuilder(
                            condition: Assistslist.length > 0,
                            builder: (context) => ListView.separated(
                                physics: BouncingScrollPhysics(),
                                itemBuilder: (context, index) => AssistsBuildItem(
                                    Assistslist[index+1] as assistsModel, context,index+2),
                                separatorBuilder: (context, index) => myDevider(),
                                itemCount: Assistslist.length-1),
                            fallback: (context) =>
                                Center(child: CircularProgressIndicator()),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

            );
          },
        );

  }
}
