import 'dart:ffi';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:premleague/model/CardsModel.dart';
import 'package:premleague/model/ScorersModel.dart';

import '../../../shared/component/components.dart';
import '../../../shared/component/list_components.dart';
import '../../archived_tasks/premleague/cubit/cubit/prem_cubit_cubit.dart';

class CleanSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<PremCubitCubit, PremCubitState>(
          listener: (context, state) {},
          builder: (context, state) {
            PremCubitCubit cubit =PremCubitCubit.get(context);
            List<CardsModel> cardsList= PremCubitCubit.get(context).cards;

            return Scaffold(
              appBar: AppBar(
                title: Text('Cards'),
              ),
              body:  Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.start,

                    children: [
                      Container(
                        height: 169,
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
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Text(
                                    'João Palhinha',
                                    /*${cardsList[0].player?.name}*/
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey[300],
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    '12',
                                    /*${cardsList[0].statistics?[0].cards?.yellow}*/
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
                              width: 80,
                            ),
                            Container(
                              width: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  image:AssetImage('assets/images/joao.png'),
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
                                width: 150,
                              ),


                              Text(
                                'Yellow',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),

                              SizedBox(width: 45,),
                              Text(
                                'Red',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 430,
                        child: ConditionalBuilder(
                          condition: cardsList.length > 0,
                          builder: (context) => ListView.separated(
                              physics: BouncingScrollPhysics(),
                              itemBuilder: (context, index) => cleansheetBuildItem(
                                  cardsList[index+1], context,index+2),
                              separatorBuilder: (context, index) => myDevider(),
                              itemCount: cardsList.length-2),
                          fallback: (context) =>
                              Center(child: CircularProgressIndicator()),
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
