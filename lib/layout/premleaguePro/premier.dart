import 'dart:ui';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:premleague/modules/archived_tasks/premleague/cubit/cubit/prem_cubit_cubit.dart';

import '../../shared/component/Constants.dart';

class premleague extends StatelessWidget {
  const premleague({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<PremCubitCubit, PremCubitState>(
        listener: (context, state) {},
        builder: (context, state) {

          PremCubitCubit cubit =PremCubitCubit.get(context);

          return Scaffold(
            backgroundColor: Color(0xFF17203A),
            body: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                            Container(
                              width: 180,
                              height: 200,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.purple ,
                              ),
                            ),


                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: 220,
                              height: 220,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.deepPurpleAccent ,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned.fill(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 120, sigmaY:120),
                      child: SizedBox(),
                    ),
                  ),
                  cubit.Screens[cubit.currentIndex],
                  Column(
                    children: [
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(left: 12,right: 12,bottom: 3,),
                        child: Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 80,
                                  sigmaY: 80,
                                  tileMode: TileMode.clamp
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 1.2,
                                    style: BorderStyle.solid,
                                  ),
                                ),

                                child: BottomNavigationBar(
                                  currentIndex: cubit.currentIndex,
                                  onTap: (index){
                                    cubit.ChangeBottomNavBar(index);
                                  },
                                  type: BottomNavigationBarType.fixed,
                                  items: cubit.bottomItems,
                                  //fixedColor: Colors.black,
                                  // selectedItemColor: HexColor('#d4088b'),
                                  // backgroundColor: Colors.white,
                                  elevation: 0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ) ,
            ],
            ),

            // bottomNavigationBar:Padding(
            //   padding: const EdgeInsets.only(left: 10,right: 10,bottom: 10,),
            //   child: ClipRRect(
            //     child: BackdropFilter(
            //       filter: ImageFilter.blur(sigmaX: 40,
            //           sigmaY: 40,
            //           tileMode: TileMode.clamp),
            //       child: Container(
            //
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(20),
            //           color: Colors.white.withOpacity(.3),
            //         ),
            //
            //         child: BottomNavigationBar(
            //           currentIndex: cubit.currentIndex,
            //           onTap: (index){
            //             cubit.ChangeBottomNavBar(index);
            //           },
            //           type: BottomNavigationBarType.fixed,
            //           items: cubit.bottomItems,
            //           //fixedColor: Colors.black,
            //           // selectedItemColor: HexColor('#d4088b'),
            //           // backgroundColor: Colors.white,
            //           elevation: 0,
            //         ),
            //       ),
            //     ),
            //   ),
            // ) ,
            // bottomNavigationBar: CurvedNavigationBar(
            //   index: cubit.currentIndex,
            //   onTap: (index){
            //     cubit.ChangeBottomNavBar(index);
            //   },
            //   items: cubit.bottomItems,
            // ),
          );
        },
      );
    var c2=Color(0xFF17203A);
  }
}