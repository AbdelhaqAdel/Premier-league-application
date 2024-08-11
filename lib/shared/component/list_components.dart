import 'dart:ui';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:premleague/Clean_arch/Features/Stats/data/models/PlayerAssistsModel.dart';
import 'package:premleague/Clean_arch/Features/Stats/data/models/StandingsModel.dart';
import 'package:premleague/Clean_arch/Core/Utils/components.dart';
import '../../Clean_arch/Features/Latest/presentation/pages/LatestScreens/AllnewsScreen.dart';
import '../../Clean_arch/Features/Stats/data/models/CardsModel.dart';
import '../../Clean_arch/Features/Latest/data/remote/models/MatchesResultsModel.dart';
import '../../Clean_arch/Features/Latest/data/remote/models/MatchsTimeModel.dart';
import '../../Clean_arch/Features/Stats/data/models/ScorersModel.dart';
import '../../Clean_arch/Features/Latest/presentation/pages/Latest_News/video.dart';



/*
Widget BuildTeamItem(Map teamList,context)=>
    Expanded(child:
    GestureDetector(
      onTap: () {
        cubit.imageindex=0;

      },
      child: Container(
        width: double.infinity,
        height: 25,
        decoration: BoxDecoration(
          color:HexColor('#DA20A9'),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              SizedBox(width: 5),
              Text('${teamList['teamName']}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 200,),
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 30,
                child:  Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('${teamList['image']}'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    );
*/
//
// Widget matchstime(MatchTimeModel model3, context) => Container(
//       decoration: BoxDecoration(
//           color: Colors.grey.withOpacity(.3),
//           // gradient: LinearGradient(
//           //     begin: Alignment.topLeft,
//           //     end: Alignment.topRight,
//           //     colors: [HexColor('#b01570').withOpacity(.3), Colors.deepPurple.withOpacity(.3)]),
//           borderRadius: BorderRadius.circular(10)),
//       height: 80,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//
//             width: 120,
//             child: Padding(
//               padding: const EdgeInsets.only(top: 8),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Container(
//                     width: 70,
//                     child: Text(
//                       '${model3.homeName}',
//                       maxLines: 1,
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 18,
//                         color: Colors.grey[200],
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     width: 8,
//                   ),
//                   Container(
//                     height: 30,
//                     width: 30,
//                     decoration: BoxDecoration(
//                       image: DecorationImage(
//                         image: NetworkImage('${model3.homeLogo}'),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Center(
//             child: Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(top: 8,bottom: 4),
//                   child: Container(child: Text('${DateTime.parse(model3.date).day} / '
//                       '${DateTime.parse(model3.date).month}',
//                     style: TextStyle(
//                       color: Colors.grey[300],
//                       fontWeight: FontWeight.bold,
//                     ),
//                   )
//
//                   ),
//                 ),
//                 Container(
//                   height: 35,
//                   width: 70,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(5),
//                     border: Border.all(
//                       width: 2,
//                       color: Color(0xFF17203A),
//                     ),
//                   ),
//                   child: Center(
//                     child: Text(
//                       '${DateTime.parse(model3.date).hour + 3} : ${DateTime.parse(model3.date).minute}',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 15,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             width: 120,
//             child: Padding(
//               padding: const EdgeInsets.only(top: 8.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Container(
//                     height: 30,
//                     width: 30,
//                     decoration: BoxDecoration(
//                       image: DecorationImage(
//                         image: NetworkImage('${model3.awayLogo}'),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     width: 8,
//                   ),
//                   Container(
//                     width: 70,
//                     child: Text(
//                       '${model3.awayName}',
//                       maxLines: 1,
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 18,
//                         color: Colors.grey[200],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//
// Widget matchsResult(MatchesResultsModel matchesResault, context) => Container(
//       width: 370,
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.topRight,
//             colors: [
//               HexColor('#b01570').withOpacity(.3),
//               Colors.deepPurple.withOpacity(.3)
//             ]),
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Container(
//         //width: double.infinity,
//
//         child: Padding(
//           padding:
//               const EdgeInsets.only(left: 4.0, right: 4, top: 6, bottom: 0),
//           child: Column(
//             //mainAxisAlignment: MainAxisAlignment.center,
//             //  crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Column(
//                     children: [
//                       Container(
//                         width: 150,
//                         child: Center(
//                           child: Text(
//                             '${matchesResault.homeName}',
//                             maxLines: 1,
//                             style: TextStyle(
//                               fontSize: 25,
//                               color: Colors.grey[300],
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 8,
//                       ),
//                       Container(
//                         height: 35,
//                         width: 35,
//                         decoration: BoxDecoration(
//                           image: DecorationImage(
//                             image: NetworkImage('${matchesResault.homeLogo}'),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     width: 8,
//                   ),
//                   Container(
//                     height: 40,
//                     width: 30,
//                     decoration: BoxDecoration(
//                       image: DecorationImage(
//                         image: AssetImage('assets/images/VS.png'),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     width: 8,
//                   ),
//                   Column(
//                     children: [
//                       Container(
//                         width: 150,
//                         child: Center(
//                           child: Text(
//                             '${matchesResault.awayName}',
//                             maxLines: 1,
//                             //overflow:TextOverflow.ellipsis ,
//                             style: TextStyle(
//                               fontSize: 25,
//                               color: Colors.grey[300],
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 8,
//                       ),
//                       Container(
//                         height: 35,
//                         width: 35,
//                         decoration: BoxDecoration(
//                           image: DecorationImage(
//                             image: NetworkImage('${matchesResault.awayLogo}'),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               // Row(children: [
//               //   Container(
//               //     height: 30,
//               //     width: 30,
//               //     decoration: BoxDecoration(
//               //       image: DecorationImage(
//               //         image: NetworkImage('${matchesResault.homeLogo}'),
//               //         fit: BoxFit.cover,
//               //       ),
//               //     ),
//               //   ),
//               //   SizedBox(width: 15,),
//               //   Container(
//               //     decoration: BoxDecoration(
//               //
//               //     ),
//               //   ),
//               //   SizedBox(width: 15,),
//               //
//               // ],),
//               SizedBox(
//                 height: 15,
//               ),
//               Container(
//                 height: 45,
//                 width: 120,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15),
//                   border: Border.all(
//                     color: Color(0xFF17203A),
//                   ),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       '${matchesResault.scoreHome}',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 30,
//                         color: Colors.grey[300],
//                       ),
//                     ),
//                     SizedBox(
//                       width: 10,
//                     ),
//                     Container(
//                       height: 20,
//                       width: 20,
//                       decoration: BoxDecoration(
//                         image: DecorationImage(
//                           image: AssetImage('assets/images/ball1.png'),
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       width: 10,
//                     ),
//                     Text(
//                       '${matchesResault.scoreAway}',
//                       style: TextStyle(
//                         color: Colors.grey[300],
//                         fontWeight: FontWeight.bold,
//                         fontSize: 30,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//
// Widget SoccerMatchResult(MatchesResultsModel results, context) => Container(
//       decoration: BoxDecoration(
//           color: Colors.grey.withOpacity(.2),
//           borderRadius: BorderRadius.circular(10)),
//       height: 65,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//             width: 120,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Container(
//                   width: 70,
//                   child: Text(
//                     '${results.homeName}',
//                     maxLines: 1,
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 18,
//                       color: Colors.grey[200],
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   width: 8,
//                 ),
//                 Container(
//                   height: 30,
//                   width: 30,
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: NetworkImage('${results.homeLogo}'),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Center(
//             child: Container(
//               height: 35,
//               width: 80,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(15),
//                 border: Border.all(
//                   color: Color(0xFF17203A),
//                 ),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     '${results.scoreHome}',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 20,
//                       color: Colors.grey[300],
//                     ),
//                   ),
//                   SizedBox(
//                     width: 5,
//                   ),
//                   Container(
//                     height: 15,
//                     width: 15,
//                     decoration: BoxDecoration(
//                       image: DecorationImage(
//                         image: AssetImage('assets/images/ball1.png'),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     width: 5,
//                   ),
//                   Text(
//                     '${results.scoreAway}',
//                     style: TextStyle(
//                       color: Colors.grey[300],
//                       fontWeight: FontWeight.bold,
//                       fontSize: 20,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Container(
//             width: 120,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 Container(
//                   height: 30,
//                   width: 30,
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: NetworkImage('${results.awayLogo}'),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   width: 8,
//                 ),
//                 Container(
//                   width: 70,
//                   child: Text(
//                     '${results.awayName}',
//                     maxLines: 1,
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 18,
//                       color: Colors.grey[200],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );

// Widget buildVideosItem(Map VideoList, context, int index) => Padding(
//       padding: const EdgeInsets.only(left: 8.0, right: 8),
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.grey[600],
//           borderRadius: BorderRadius.circular(10),
//         ),
//
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(0.0),
//               child: Container(
//                 // width: 360,
//                 height: 270,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   // borderRadius: BorderRadius.circular(15),
//                   image: DecorationImage(
//                     image: NetworkImage('${VideoList['image']}'),
//                     fit: BoxFit.cover,
//                     // image: NetworkImage('${article['urlToImage']}'),
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 14.0, left: 22, bottom: 10,right: 5),
//               child: Container(
//                 height: 60,
//                 width: double.infinity,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   //  crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       width: 260,
//                       child: Text(
//                         '${VideoList['title']}',
//                         style: Theme.of(context).textTheme.bodyLarge,
//                         maxLines: 2,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ),
//                     Spacer(),
//                     // SizedBox(width: 225,),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 10.0),
//                       child: Stack(children: [
//                         Container(
//                           width: 60,
//                           height: 90,
//                           decoration: BoxDecoration(
//                             color: HexColor('#570861'),
//                             borderRadius: BorderRadius.circular(30),
//                           ),
//                         ),
//                         Center(
//                           child: Icon(
//                             Icons.play_arrow,
//                             color: Colors.grey[400],
//                             size: 60,
//                           ),
//                         ),
//                       ]),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//         // SizedBox(width: 20,),
//       ),
//
//       // Container(
//       //   decoration:BoxDecoration(
//       //     borderRadius: BorderRadius.circular(15),
//       //   ) ,
//       //   child: Column(
//       //     crossAxisAlignment: CrossAxisAlignment.start,
//       //     children: [
//       //       Stack(
//       //         alignment: AlignmentDirectional.center,
//       //         children: [
//       //               Container(
//       //                 height: 300,
//       //                 decoration: BoxDecoration(
//       //                   image: DecorationImage(
//       //
//       //                     image:NetworkImage('${VideoList['image']}'),
//       //                     fit: BoxFit.cover,
//       //                   ),
//       //                 ),
//       //               ),
//       //               // Center(
//       //               //   child: Icon(Icons.play_arrow,
//       //               //     color: Colors.white,
//       //               //     size: 80,
//       //               //
//       //               //   ),
//       //               // ),
//       //         ],
//       //       ),
//       //       Text('${VideoList['title']}'),
//       //     ],
//       //   ),
//       // ),
//     );

// Widget ScorersBuildItem(ScorersModel model, context, int? index) => Padding(
//       padding: const EdgeInsets.all(5.0),
//       child: Container(
//         height: 35,
//         child: Row(
//           children: [
//             SizedBox(
//               width: 15,
//             ),
//             Container(
//               width: 50,
//               child: Text(
//                 '${index}',
//                 style: TextStyle(
//                   color: Colors.grey,
//                 ),
//               ),
//             ),
//             Container(
//               width: 180,
//               child: Text(
//                 '${model.PlayerName}',
//                 style: TextStyle(
//                   color: Colors.grey,
//                 ),
//               ),
//             ),
//             Container(
//               width: 100,
//               child: Text(
//                 '${model.TeamName} ',
//                 style: TextStyle(
//                   color: Colors.grey,
//                 ),
//               ),
//             ),
//             Container(
//               width: 30,
//               child: Text(
//                 '${model.Goals} ',
//                 style: TextStyle(
//                   color: Colors.grey,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//
// Widget BuildLeagueTable(StandingsModel model1, context) => Padding(
//       padding: const EdgeInsets.all(3.0),
//       child: Container(
//         height: 30,
//         width: double.infinity,
//         child: Container(
//           // height: 35,
//           child: Row(
//             children: [
//               SizedBox(
//                 width: 15,
//               ),
//               Container(
//                 width: 50,
//                 child: Text(
//                   '${model1.position}',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Colors.grey[300],
//                   ),
//                 ),
//               ),
//               Container(
//                 width: 160,
//                 child: Text(
//                   '${model1.teamName}',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Colors.grey[300],
//                   ),
//                 ),
//               ),
//               Container(
//                 width: 65,
//                 child: Text(
//                   '${model1.matchesPlay}',
//                   style: TextStyle(
//                     color: Colors.grey[300],
//                   ),
//                 ),
//               ),
//               Container(
//                 width: 50,
//                 child: Text(
//                   '${model1.goals}',
//                   style: TextStyle(
//                     color: Colors.grey[300],
//                   ),
//                 ),
//               ),
//               Container(
//                 width: 30,
//                 child: Text(
//                   '${model1.points}',
//                   style: TextStyle(
//                     color: Colors.grey[300],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//
// Widget AssistsBuildItem(assistsModel model2, context, int index) => Container(
//       child: Padding(
//         padding: const EdgeInsets.all(5.0),
//         child: Row(
//
//           children: [
//             SizedBox(
//               width: 15,
//             ),
//             Container(
//               width: 50,
//               child: Text(
//                 '${index}',
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             Container(
//               width: 155,
//               child: Text(
//                 '${model2.player?.name}',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//               ),
//             ),
//             Container(
//               width: 75,
//               child: Text(
//                 '${model2.statistics?[0].team?.name} ',
//                 style: TextStyle(
//                   color: Colors.black,
//                 ),
//               ),
//             ),
//             SizedBox(
//               width: 55,
//             ),
//             Container(
//               width: 30,
//               child: Text(
//                 '${model2.statistics?[0].goals?.assists} ',
//                 style:
//                     TextStyle(                  color: Colors.black,
//                          fontWeight: FontWeight.bold),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//
// Widget GoalsTeamsBuildItem(model, context) => Container(
//       child: Row(
//
//         children: [
//           SizedBox(
//             width: 15,
//           ),
//           Container(
//             width: 50,
//             child: Text(
//               '${model['pos']}',
//               style: TextStyle(
//                 color: Colors.black,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           Container(
//             width: 190,
//             child: Text(
//               '${model['TeamNam']}',
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black,
//               ),
//             ),
//           ),
//           SizedBox(
//             width: 70,
//           ),
//           Container(
//             width: 30,
//             child: Text(
//               '${model['Goals']} ',
//               style: TextStyle(
//                 color: Colors.black,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//
// Widget cleansheetBuildItem(CardsModel model4, context, int index) => Container(
//       height: 35,
//       child: Padding(
//         padding: const EdgeInsets.all(5.0),
//         child: Row(
//           children: [
//             SizedBox(
//               width: 15,
//             ),
//             Container(
//               width: 50,
//               child: Text(
//                 '${index}',
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             Container(
//               width: 190,
//               child: Text(
//                 '${model4.player?.name}',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//               ),
//             ),
//             SizedBox(
//               width: 20,
//             ),
//             Container(
//               width: 30,
//               child: Text(
//                 '${model4.statistics?[0].cards?.yellow} ',
//                 style: TextStyle(
//                   color: Colors.black,
//                 ),
//               ),
//             ),
//             SizedBox(
//               width: 40,
//             ),
//             Container(
//               width: 20,
//               child: Text(
//                 '${model4.statistics?[0].cards?.red} ',
//                 style: TextStyle(
//                   color: Colors.black,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//
