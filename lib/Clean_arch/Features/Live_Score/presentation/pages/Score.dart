import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:premleague/Clean_arch/Core/Utils/extention/build_context_extention.dart';
import 'package:premleague/Clean_arch/Features/Latest/data/data_sources/matches_resault_data_source.dart';
import 'package:premleague/Clean_arch/Features/Latest/data/data_sources/matches_result_local_data_source.dart';
import 'package:premleague/Clean_arch/Features/Latest/data/repositories/matches_result_repo_impl.dart';
import 'package:premleague/Clean_arch/Features/Latest/domain/entities/matches_result_entity.dart';
import 'package:premleague/Clean_arch/Features/Latest/domain/use_cases/matches_result_useCase.dart';
import 'package:premleague/Clean_arch/Features/Latest/presentation/manager/cubit/matches_result_cubit.dart';
import 'package:premleague/Clean_arch/Features/Live_Score/presentation/widgets/mathce_soccer_List_builder.dart';

class SoccerMatch extends StatelessWidget {
  const SoccerMatch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   // final cubit = BlocProvider.of<MatchesResultCubit>(context);
   

    return BlocProvider(
      create: (context) => MatchesResultCubit(
          FetchMatchesResultUseCase(
                   //MatchesResultRepoImpl.getInstance()
                   MatchesResultRepoImpl(MatchesResultRemoteDataSourceImpl(),MatchesResultLocalDataSourceImpl())
               )
            )..fetchMatchesResultFromCubit() ,
      
      child: BlocBuilder<MatchesResultCubit, MatchesResultState>(
        builder: (context, state) {
            if(state is FetchMatchesResultLoadingState){
            return const Center(child: CircularProgressIndicator());
          }
          else if(state is FetchMatchesResultSuccessState){
           List<MatchesResultEntity> matchesResultList =
        state.matchesResult;
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: const EdgeInsets.all(0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        //mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 40, left: 5, bottom: 15),
                            child: Row(
                              children: [
                                Container(
                                  height: 40,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    color: Colors.purple.withOpacity(.3),
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                      width: 2.w,
                                      color: HexColor('#570861'),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Center(
                                        child: Text(
                                          'Live',
                                          style: TextStyle(
                                              color: Colors.grey[300],
                                              fontSize: 26),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(bottom: 6.0),
                                        child: Icon(
                                          Icons.album_outlined,
                                          color: Colors.green,
                                          size: 13,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                // Text('Score',
                                //   style: TextStyle(
                                //     color: Colors.grey[300],
                                //     fontSize: 20
                                //   )
                                // ),
                              ],
                            ),
                          ),
                          Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                SizedBox(
                                  height: context.screenHeight/3.8,
                                  width: double.infinity - 40,
                                  child: Container(
                                    //  width: 330,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.topRight,
                                          colors: [
                                            HexColor('#b01570')
                                                .withOpacity(.3),
                                            Colors.deepPurple.withOpacity(.3)
                                          ]),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: context.screenHeight/4,
                                  width: double.infinity - 20,
                                  child: Container(
                                    width: 350,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.topRight,
                                          colors: [
                                            HexColor('#b01570')
                                                .withOpacity(.5),
                                            Colors.deepPurple.withOpacity(.5)
                                          ]),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: context.screenHeight/4.2,
                                  //width: double.infinity,
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.topRight,
                                          colors: [
                                            HexColor('#b01570'),
                                            Colors.deepPurple
                                          ]),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Padding(
                                      padding:  EdgeInsets.only(
                                          left: 4.0.w,
                                          right: 4.w,
                                          top: 12.h,
                                          bottom: 0),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Column(
                                                children: [
                                                  SizedBox(
                                                    width: 150,
                                                    child: Center(
                                                      child: Text(
                                                        '${matchesResultList[0].homeNameE}',
                                                        maxLines: 1,
                                                        style: TextStyle(
                                                          fontSize: 25.sp,
                                                          color: Colors
                                                              .grey[300],
                                                          fontWeight:
                                                              FontWeight
                                                                  .bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 4.h,
                                                  ),
                                                  Container(
                                                    height: 5,
                                                    width: 35,
                                                    decoration:
                                                        BoxDecoration(
                                                      image:
                                                          DecorationImage(
                                                        image: NetworkImage(
                                                            '${matchesResultList[0].homeLogoE}'),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                width: 6,
                                              ),
                                              Container(
                                                height: 40,
                                                width: 40,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          40),
                                                  border: Border.all(
                                                    color:
                                                        const Color(0xFF17203A),
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .center,
                                                  children: [
                                                    Text(
                                                      '90',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 20,
                                                        color: Colors
                                                            .grey[300],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10.w,
                                              ),
                                              Column(
                                                children: [
                                                  Container(
                                                    width: 150,
                                                    child: Center(
                                                      child: Text(
                                                        '${matchesResultList[0].awayNameE}',
                                                        maxLines: 1,
                                                        //overflow:TextOverflow.ellipsis ,
                                                        style: TextStyle(
                                                          fontSize: 25,
                                                          color: Colors
                                                              .grey[300],
                                                          fontWeight:
                                                              FontWeight
                                                                  .bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5.h,
                                                  ),
                                                  Container(
                                                    height: 30.h,
                                                    width: 30.w,
                                                    decoration:
                                                        BoxDecoration(
                                                      image:
                                                          DecorationImage(
                                                        image: NetworkImage(
                                                            '${matchesResultList[0].awayLogoE}'),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                           SizedBox(
                                            height: 10.h,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                '40 %',
                                                style: TextStyle(
                                                  color: Colors.grey[300],
                                                  fontSize: 16,
                                                ),
                                              ),
                                              SizedBox(
                                                width: context.w(30),
                                              ),
                                              Container(
                                                height: 40.h,
                                                width: 100.w,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15),
                                                  border: Border.all(
                                                    color:
                                                        const Color(0xFF17203A),
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .center,
                                                  children: [
                                                    Text(
                                                      '${matchesResultList[0].scoreHomeE}',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 30.sp,
                                                        color: Colors
                                                            .grey[300],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width:  context.w(10),
                                                    ),
                                                    Container(
                                                      height: 15.h,
                                                      width: 15.w,
                                                      decoration:
                                                          const BoxDecoration(
                                                        image:
                                                            DecorationImage(
                                                          image: AssetImage(
                                                              'assets/images/ball1.png'),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: context.w(10),
                                                    ),
                                                    Text(
                                                      '${matchesResultList[0].scoreAwayE}',
                                                      style: TextStyle(
                                                        color: Colors
                                                            .grey[300],
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 30.sp,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                width: context.w(30),
                                              ),
                                              Text(
                                                '60 %',
                                                style: TextStyle(
                                                  color: Colors.grey[300],
                                                  fontSize: 16.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: context.w(7),
                                          ),
                                          Container(
                                                              
                                            height: 30.h,
                                            width: 65.w,
                                            decoration: BoxDecoration(
                                              color: Color(0xFF17203A),
                                              borderRadius: BorderRadius.circular(10),
                                              border: Border.all(
                                                color: Colors.grey,
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  '${matchesResultList[0].stateE}',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15.sp,
                                                    color: Colors.grey[300],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: MediaQuery.removePadding(
                          removeTop: true,
                          context: context,
                          child: const MatchesSoccerBuilder(),
                        )),
                  )),
                ],
              ),
            ),
          );
        }else{
          return const Text('error');
        }
        }
      ),
    );
  }
}














// import 'package:flutter/material.dart';
// import '../../../model/SoccerMatch.dart';
// import 'ScorePageWidgets.dart';
// // BlocConsumer<PremCubitCubit, PremCubitState>(
// // listener: (context, state) {},
// // builder: (context, state) {
// // PremCubitCubit cubit =PremCubitCubit.get(context);
// // List<assistsModel> Assistslist= PremCubitCubit.get(context).assists;
// // return
// // },
// // );
// Widget PageBody() {
//   return Column(
//     children: [
//       Expanded(
//         flex: 2,
//         child: Container(
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 24.0),
//             // child: Row(
//             //   mainAxisAlignment: MainAxisAlignment.center,
//             //   crossAxisAlignment: CrossAxisAlignment.center,
//             //   children: [
//             //     teamStat("Local Team", allmatches[0].home.logoUrl,
//             //         allmatches[0].home.name),
//             //     goalStat(allmatches[0].fixture.status.elapsedTime,
//             //         allmatches[0].goal.home, allmatches[0].goal.away),
//             //     teamStat("Visitor Team", allmatches[0].away.logoUrl,
//             //         allmatches[0].away.name),
//             //   ],
//             // ),
//           ),
//         ),
//       ),
//       Expanded(
//         flex: 5,
//         child: Container(
//           width: double.infinity,
//           decoration: BoxDecoration(
//             color: Color(0xFF4373D9),
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(40.0),
//               topRight: Radius.circular(40.0),
//             ),
//           ),
//           child: Padding(
//             padding: EdgeInsets.all(16.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text(
//                   "MATCHES",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 24.0,
//                   ),
//                 ),
//                 Expanded(
//                   child: ListView.builder(
//                     itemCount: 5,
//                     itemBuilder: (context, index) {
//                       return matchTile();
//                     },
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       )
//     ],
//   );
// }
// // Center(
// //
// //   child: ClipRRect(
// //     child: BackdropFilter(
// //       filter: ImageFilter.blur(sigmaX: 30,
// //           sigmaY: 30,
// //           tileMode: TileMode.clamp),
// //       child: Container(
// //         width: double.infinity,
// //         height: 485,
// //         decoration: BoxDecoration(
// //           borderRadius: BorderRadius.circular(28),
// //           color: Colors.white.withOpacity(.2),
// //           border: Border.all(
// //             color: Colors.black,
// //             width: 1.5,
// //             style: BorderStyle.solid,
// //           ),
// //         ),
// //         // child: Form(
// //         //
// //         //   child: Column(
// //         //     children: [
// //         //       SizedBox(height: 10,),
// //         //       Row(
// //         //         mainAxisAlignment: MainAxisAlignment
// //         //             .center,
// //         //         children: [
// //         //           Text(
// //         //             'Your Card',
// //         //             style: TextStyle(
// //         //               fontSize: 20,
// //         //               fontWeight: FontWeight.bold,
// //         //               color: Colors.black,
// //         //             ),
// //         //           ),
// //         //           Icon(
// //         //             Icons.keyboard_arrow_down,
// //         //             size: 35,
// //         //           ),
// //         //         ],
// //         //       ),
// //         //       Padding(
// //         //         padding: const EdgeInsets.only(
// //         //             right: 20, left: 20, top: 20),
// //         //         child: Container(
// //         //           height: 70,
// //         //           decoration: BoxDecoration(
// //         //             border: Border.all(
// //         //                 color: Colors.black),
// //         //             borderRadius: BorderRadius
// //         //                 .circular(12),
// //         //             color: Colors.white.withOpacity(.4),
// //         //             // boxShadow: [
// //         //             //   BoxShadow(
// //         //             //     color:Colors.black.withOpacity(.2),
// //         //             //     spreadRadius: 2,
// //         //             //     blurRadius: 15,
// //         //             //   )
// //         //             // ],
// //         //           ),
// //         //           child: Center(
// //         //             child: TextFormField(
// //         //
// //         //               keyboardType: TextInputType
// //         //                   .name,
// //         //               onFieldSubmitted: (value) {
// //         //                 print(value);
// //         //               },
// //         //               onChanged: (value) {
// //         //                 print(value);
// //         //               },
// //         //               validator: (value) {
// //         //                 if (value!.isEmpty) {
// //         //                   return 'your Name can\'t be empty';
// //         //                 }
// //         //                 return null;
// //         //               },
// //         //               toolbarOptions:
// //         //               ToolbarOptions(
// //         //                   paste: true, copy: true),
// //         //               cursorColor: Colors.black,
// //         //               style: TextStyle(fontSize: 25),
// //         //               decoration: InputDecoration(
// //         //                 prefixIcon: Icon(
// //         //                   Icons.person,
// //         //                   color: Colors.black,
// //         //                   size: 30,
// //         //                 ),
// //         //                 hintText: 'Your Name',
// //         //                 border: InputBorder.none,
// //         //               ),
// //         //             ),
// //         //           ),
// //         //         ),
// //         //       ),
// //         //       SizedBox(
// //         //         height: 15,
// //         //       ),
// //         //       Padding(
// //         //         padding: const EdgeInsets.only(
// //         //           right: 20,
// //         //           left: 20,
// //         //         ),
// //         //         child: Container(
// //         //           height: 70,
// //         //           decoration: BoxDecoration(
// //         //             border: Border.all(
// //         //                 color: Colors.black),
// //         //             borderRadius: BorderRadius
// //         //                 .circular(12),
// //         //             color: Colors.white.withOpacity(.4),
// //         //             // boxShadow: [
// //         //             //   BoxShadow(
// //         //             //     color:Colors.black.withOpacity(.2),
// //         //             //     spreadRadius: 2,
// //         //             //     blurRadius: 15,
// //         //             //   )
// //         //             // ],
// //         //           ),
// //         //           child: Center(
// //         //             child: TextFormField(
// //         //
// //         //               keyboardType: TextInputType
// //         //                   .name,
// //         //               onFieldSubmitted: (value) {
// //         //                 print(value);
// //         //               },
// //         //               onChanged: (value) {
// //         //                 print(value);
// //         //               },
// //         //               validator: (value) {
// //         //                 if (value!.isEmpty) {
// //         //                   return 'Your Address can\'t be empty';
// //         //                 }
// //         //                 return null;
// //         //               },
// //         //               toolbarOptions:
// //         //               ToolbarOptions(
// //         //                   paste: true, copy: true),
// //         //               cursorColor: Colors.black,
// //         //               style: TextStyle(fontSize: 25),
// //         //               decoration: InputDecoration(
// //         //                 prefixIcon: Icon(
// //         //                   Icons.place,
// //         //                   color: Colors.black,
// //         //                   size: 30,
// //         //                 ),
// //         //                 hintText: 'Your address',
// //         //                 border: InputBorder.none,
// //         //               ),
// //         //             ),
// //         //           ),
// //         //         ),
// //         //       ),
// //         //       SizedBox(
// //         //         height: 15,
// //         //       ),
// //         //       Padding(
// //         //         padding: const EdgeInsets.only(
// //         //             right: 20, left: 20),
// //         //         child: Container(
// //         //           height: 70,
// //         //           decoration: BoxDecoration(
// //         //             border: Border.all(
// //         //                 color: Colors.black),
// //         //             borderRadius: BorderRadius
// //         //                 .circular(12),
// //         //             color: Colors.white.withOpacity(.4),
// //         //             // boxShadow: [
// //         //             //   BoxShadow(
// //         //             //     color:Colors.black.withOpacity(.2),
// //         //             //     spreadRadius: 2,
// //         //             //     blurRadius: 15,
// //         //             //   )
// //         //             // ],
// //         //           ),
// //         //           child: Center(
// //         //             child: TextFormField(
// //         //
// //         //               keyboardType: TextInputType
// //         //                   .number,
// //         //               onFieldSubmitted: (value) {
// //         //                 print(value);
// //         //               },
// //         //               onChanged: (value) {
// //         //                 print(value);
// //         //               },
// //         //               validator: (value) {
// //         //                 if (value!.isEmpty) {
// //         //                   return 'Room Number can\'t be empty';
// //         //                 }
// //         //                 return null;
// //         //               },
// //         //               toolbarOptions:
// //         //               ToolbarOptions(
// //         //                   paste: true, copy: true),
// //         //               cursorColor: Colors.black,
// //         //               style: TextStyle(fontSize: 25),
// //         //               decoration: InputDecoration(
// //         //                 prefixIcon: Icon(
// //         //                   Icons.numbers,
// //         //                   color: Colors.black,
// //         //                   size: 30,
// //         //                 ),
// //         //                 hintText: 'Phone Number',
// //         //                 border: InputBorder.none,
// //         //               ),
// //         //             ),
// //         //           ),
// //         //         ),
// //         //       ),
// //         //       SizedBox(
// //         //         height: 15,
// //         //       ),
// //         //       Padding(
// //         //         padding: const EdgeInsets.only(
// //         //           right: 20, left: 20,),
// //         //         child: Container(
// //         //           width: double.infinity,
// //         //           height: 70,
// //         //           decoration: BoxDecoration(
// //         //             borderRadius: BorderRadius
// //         //                 .circular(12),
// //         //             color: Colors.black,
// //         //             boxShadow: [
// //         //               BoxShadow(
// //         //                 color:
// //         //                 Colors.black.withOpacity(.4),
// //         //                 spreadRadius: 2,
// //         //                 blurRadius: 15,
// //         //               )
// //         //             ],
// //         //           ),
// //         //
// //         //         ),
// //         //       ),
// //         //     ],
// //         //   ),
// //         // ),
// //       ),
// //     ),
// //
// //
// //   ),
// //
// // ),
