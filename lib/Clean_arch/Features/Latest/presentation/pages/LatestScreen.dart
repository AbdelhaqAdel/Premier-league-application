import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:premleague/Clean_arch/Features/Login/presentation/pages/UserLogin.dart';
import 'Latest_Matches/Matches_latest_screen.dart';
import 'Latest_News/News_LatestScreen.dart';
class LatestScreen extends StatefulWidget {
  @override
  State<LatestScreen> createState() => _LatestScreenState();
}
//-----------------change test ---------------
class _LatestScreenState extends State<LatestScreen> {
  int navbar=1;
  List Screen2=[
     const LatestNewsScreen(),
     const LatestMatches()
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor:Colors.transparent,

      body:  Column(
        children: [
                Padding(
                  padding: const EdgeInsets.only(top: 45,left: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,

                    children: [
                      CircleAvatar(
                        radius: 30,
                        child: Image.asset('assets/images/premlogo44.png',color:const Color(0xFF17203A),),
                      
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width/20,),
                      Column(
                        children: [
                          Text(
                            'Premier',
                            style: TextStyle(
                              color: Colors.grey[300],
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'League',
                            style: TextStyle(
                              color: Colors.grey[300],
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0,top: 10),
                        child: CircleAvatar(
                            radius: 28,
                            backgroundColor: Colors.white.withOpacity(.2),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset('assets/images/cup1.png',
                                height: 25.h,
                                width: 25.w,
                              ),
                            )),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width/23,),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height/30,
                ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child:  SizedBox(
              width: double.infinity,
              height: 40.h,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            navbar=1;
                            print(navbar);
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: navbar == 1 ?HexColor('#570861') : Colors.white.withOpacity(.3),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Icon(Icons.clear_all_outlined,size: 30,color:navbar == 1 ?Colors.grey[300]:Color(0xFF17203A),),
                                SizedBox(width: 10,),
                                Text('News',
                                  style: TextStyle(
                                    color: navbar == 1 ?Colors.grey[300]: Color(0xFF17203A),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                  ),),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 15,),
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            navbar=2;
                            print(navbar);
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: navbar == 2 ? HexColor('#570861') : Colors.white.withOpacity(.3),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Icon(Icons.sports_soccer_outlined,size: 30,color:navbar == 2 ?Colors.grey[300]:Color(0xFF17203A),),
                                SizedBox(width: 10,),
                                Text('Matches',
                                  style: TextStyle(
                                    color: navbar == 2 ?Colors.grey[300]: Color(0xFF17203A),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                  ),),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),


                  ],
                ),
            ),

          ),
          Expanded(
            child: Container(
              child: Screen2[navbar-1],
            ),
          )
        ],
      ),

    );
  }
}

// import 'package:carousel_slider/carousel_controller.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:premleague/modules/premScreens/teamsNews/LatestScreens/MatchDay.dart';
// import 'package:premleague/modules/premScreens/teamsNews/LatestScreens/MatchDayResult.dart';
// import 'package:premleague/modules/premScreens/premierScrenCubits/LatestScreen/cubit/latest_screen_cubit.dart';
// import 'package:premleague/modules/premScreens/video.dart';
// import 'package:premleague/shared/component/components.dart';
// import 'package:premleague/shared/cubit/testcubit/states.dart';
// import '../../../model/MatchsTimeModel.dart';
// import '../../../shared/component/list_components.dart';
// import '../Score.dart';
// import '../StatsScreens/AssistsScreen.dart';
// import '../StatsScreens/StatsScreen.dart';
// import '../video.dart';
// import 'Matches_latest_screen.dart';
// import 'News_LatestScreen.dart';
//
// class Latest extends StatefulWidget {
//   @override
//   State<Latest> createState() => _LatestState();
// }
//
// class _LatestState extends State<Latest> {
//   int navbar=1;
//   List<Widget> Screens=[
//     // Stats(),
//     // AssitsScreen()
//     LatestNewsScreen(),
//     LatestMatches()
//   ];
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       backgroundColor:Colors.transparent,
//       body:
//         /*
//               Container(
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                     image: AssetImage('assets/images/BK7.jpg'),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               */
//         Padding(
//           padding: const EdgeInsets.all(0),
//           child: SingleChildScrollView(
//             physics: BouncingScrollPhysics(),
//             child: Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(top: 45,left: 15),
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//
//                     children: [
//                       Container(
//                         child: CircleAvatar(
//                           radius: 30,
//                           child: Image.asset('assets/images/premlogo44.png',color:Color(0xFF17203A),),
//
//                         ),
//                       ),
//                       SizedBox(width: 15,),
//                       Column(
//                         children: [
//                           Text(
//                             'Premier',
//                             style: TextStyle(
//                               color: Colors.grey[300],
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Text(
//                             'League',
//                             style: TextStyle(
//                               color: Colors.grey[300],
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                       Spacer(),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 5.0,top: 10),
//                         child: CircleAvatar(
//                             radius: 28,
//                             backgroundColor: Colors.white.withOpacity(.2),
//                             child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Image.asset('assets/images/cup1.png',
//
//                                 height: 30,
//                                 width: 30,
//                               ),
//                               //Icon(Icons.card_giftcard,size:25,color: Colors.grey[300],),
//                             )),
//                       ),
//                       SizedBox(width: 10,),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 12,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 15.0),
//                   child: Container(
//                     width: double.infinity,
//                     height: 60,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Expanded(
//                           child: GestureDetector(
//                             onTap: (){
//                               setState(() {
//                                 navbar=1;
//                                 print(navbar);
//                               });
//                             },
//                             child: Container(
//
//
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(10),
//                                 color: navbar == 1 ? Colors.purple : Colors.white.withOpacity(.3),
//                               ),
//                               child: Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Row(
//                                   children: [
//                                     Icon(Icons.newspaper,size: 30,color:navbar == 1 ?Colors.grey[300]:Color(0xFF17203A),),
//                                     SizedBox(width: 10,),
//                                     Text('News',
//                                       style: TextStyle(
//                                         color: navbar == 1 ?Colors.grey[300]: Color(0xFF17203A),
//                                         fontWeight: FontWeight.w500,
//                                         fontSize: 20,
//                                       ),),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(width: 15,),
//                         Expanded(
//                           child: GestureDetector(
//                             onTap: (){
//                               setState(() {
//                                 navbar=2;
//                                 print(navbar);
//                               });
//                             },
//                             child: Container(
//
//
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(10),
//                                 color: navbar == 2 ? Colors.purple : Colors.white.withOpacity(.3),
//                               ),
//                               child: Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Row(
//                                   children: [
//                                     Icon(Icons.newspaper,size: 30,color:navbar == 2 ?Colors.grey[300]:Color(0xFF17203A),),
//                                     SizedBox(width: 10,),
//                                     Text('News',
//                                       style: TextStyle(
//                                         color: navbar == 2 ?Colors.grey[300]: Color(0xFF17203A),
//                                         fontWeight: FontWeight.w500,
//                                         fontSize: 20,
//                                       ),),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//
//
//                       ],
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: Container(
//                     child: Screens[navbar-1],
//                   ),
//                 ),
//                 // Padding(
//                 //   padding: const EdgeInsets.only(left: 5.0, right: 5),
//                 //   child: Column(children: [
//                 //     Container(
//                 //       decoration: BoxDecoration(
//                 //         //  color: Colors.blueGrey,
//                 //         gradient: LinearGradient(
//                 //             begin: Alignment.topLeft,
//                 //             end: Alignment.topRight,
//                 //             colors: [
//                 //               HexColor('#ef74bc'),
//                 //               Colors.white70,
//                 //             ]),
//                 //       ),
//                 //       height: 240,
//                 //       child: InkWell(
//                 //         onTap: () {
//                 //           print(currentIndex);
//                 //         },
//                 //         child: Container(
//                 //           height: 500,
//                 //           child: CarouselSlider(
//                 //             items: imageList
//                 //                 .map(
//                 //                   (item) => Image.asset(
//                 //                     item['image_path'],
//                 //                     fit: BoxFit.cover,
//                 //                     width: double.infinity,
//                 //
//                 //                     //height: 100,
//                 //                   ),
//                 //                 )
//                 //                 .toList(),
//                 //             carouselController: carouselController,
//                 //             options: CarouselOptions(
//                 //               height: 230,
//                 //               scrollPhysics:
//                 //                   const BouncingScrollPhysics(),
//                 //               autoPlay: true,
//                 //               aspectRatio: 2,
//                 //               viewportFraction: 1,
//                 //               onPageChanged: (index, reason) {
//                 //                 setState(() {
//                 //                   currentIndex = index;
//                 //                 });
//                 //               },
//                 //             ),
//                 //           ),
//                 //         ),
//                 //       ),
//                 //     ),
//                 //   ]),
//                 // ),
//                 // SizedBox(
//                 //   height: 3,
//                 // ),
//                 // //Container(child: myDevider(),),
//                 // Padding(
//                 //   padding: const EdgeInsets.all(7.0),
//                 //   child: Container(
//                 //     color: Colors.white,
//                 //     child: Column(
//                 //       children: [
//                 //         Text(
//                 //           'Latest News ',
//                 //           style: Theme.of(context).textTheme.bodyLarge,
//                 //         ),
//                 //         Container(
//                 //           height: 190,
//                 //           //width: double.infinity,
//                 //           decoration: BoxDecoration(
//                 //               // color:  HexColor('#f0e4e4'),
//                 //               // borderRadius: BorderRadius.circular(7),
//                 //               ),
//                 //           child: Container(
//                 //             //height: 150,
//                 //             child: ListView.separated(
//                 //                 scrollDirection: Axis.horizontal,
//                 //                 physics: BouncingScrollPhysics(),
//                 //                 itemBuilder: (context, index) =>
//                 //                     buildArticleItem(
//                 //                         newslist[index], context),
//                 //                 separatorBuilder: (context, index) =>
//                 //                     SizedBox(
//                 //                       width: 20,
//                 //                     ),
//                 //                 itemCount: newslist.length),
//                 //           ),
//                 //         ),
//                 //       ],
//                 //     ),
//                 //   ),
//                 // ),
//                 // Padding(
//                 //   padding: const EdgeInsets.all(5.0),
//                 //   child: Stack(
//                 //     children: [
//                 //       Container(
//                 //         decoration: BoxDecoration(
//                 //           gradient: LinearGradient(
//                 //               begin: Alignment.topLeft,
//                 //               end: Alignment.topRight,
//                 //               colors: [
//                 //                 HexColor('#ef74bc'),
//                 //                 Colors.white70,
//                 //               ]),
//                 //           borderRadius: BorderRadius.circular(7),
//                 //         ),
//                 //         child: Column(
//                 //           crossAxisAlignment: CrossAxisAlignment.start,
//                 //           //mainAxisAlignment: MainAxisAlignment.start,
//                 //           children: [
//                 //             Padding(
//                 //               padding: const EdgeInsets.all(15.0),
//                 //               child: Text(
//                 //                 'Matchs Week time ',
//                 //                 style: Theme.of(context).textTheme.bodyLarge,
//                 //               ),
//                 //             ),
//                 //             Container(
//                 //               height: 500,
//                 //               width: double.infinity,
//                 //               child: ConditionalBuilder(
//                 //                 condition: matchesTimeList.length > 0,
//                 //                 builder: (context) =>  ListView.separated(
//                 //                     physics: BouncingScrollPhysics(),
//                 //                     itemBuilder: (context, index) =>
//                 //                         matchstime(matchesTimeList[index],context),
//                 //                     separatorBuilder: (context, index) =>
//                 //                         myDevider(),
//                 //                     itemCount: matchesTimeList.length),
//                 //                 fallback: (context) =>
//                 //                     Center(child: CircularProgressIndicator()),
//                 //               ),
//                 //
//                 //             ),
//                 //             Padding(
//                 //               padding: const EdgeInsets.all(15.0),
//                 //               child: Container(
//                 //                 height: 35,
//                 //                 width: 80,
//                 //                 decoration: BoxDecoration(
//                 //                     borderRadius:
//                 //                         BorderRadius.circular(20),
//                 //                     color: HexColor('#b14244')),
//                 //                 child: defaultTextButton(
//                 //                   function: () {
//                 //                     NavigateTo(context, MatchDay());
//                 //                   },
//                 //                   text: 'See All',
//                 //                 ),
//                 //               ),
//                 //             ),
//                 //           ],
//                 //         ),
//                 //       ),
//                 //     ],
//                 //   ),
//                 // ),
//                 // SizedBox(
//                 //   height: 10,
//                 // ),
//                 //
//                 // Container(
//                 //   color: Colors.white70,
//                 //   child: Padding(
//                 //     padding: const EdgeInsets.all(8.0),
//                 //     child: Column(
//                 //       children: [
//                 //         Text(
//                 //           'Latest Videos ',
//                 //           style: Theme.of(context).textTheme.bodyLarge,
//                 //         ),
//                 //
//                 //             Container(
//                 //             height: 400,
//                 //             child: PageView.builder(
//                 //                 physics: BouncingScrollPhysics(),
//                 //                 itemBuilder: (context, index) =>
//                 //                     buildVideosItem(
//                 //                         VideosList[index], context,index),
//                 //                 itemCount: VideosList.length),
//                 //
//                 //             /*
//                 //                   ListView.builder(
//                 //                     scrollDirection: Axis.horizontal,
//                 //                     itemCount: videoUrls.length,
//                 //                     itemBuilder: (context, index) {
//                 //                       return VideoPlayerWidget(videoUrl: videoUrls[index]);
//                 //                     },
//                 //                   )
//                 //                 */
//                 //             /*PageView.builder(
//                 //               physics: BouncingScrollPhysics(),
//                 //               itemBuilder:(context,index)=>buildVideosItem(context),
//                 //               itemCount: 4,
//                 //             ),*/
//                 //           ),
//                 //
//                 //       ],
//                 //     ),
//                 //   ),
//                 // ),
//                 /*
//                           Padding(
//                             padding: const EdgeInsets.all(12.0),
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 color: HexColor('fcf0e0'),
//                                 borderRadius: BorderRadius.circular(15),
//                               ),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 //mainAxisAlignment: MainAxisAlignment.start,
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.all(15.0),
//                                     child: Text('Match week Result ',
//                                       style: Theme.of(context).textTheme.bodyLarge,
//                                     ),
//                                   ),
//                                   Container(
//
//                                     height: 500,
//                                     width: double.infinity,
//                                     child:ListView.separated(
//                                         physics: BouncingScrollPhysics(),
//                                         itemBuilder: (context ,index)=>matchsResult(context),
//                                         separatorBuilder: (context, index) => myDevider(),
//                                         itemCount: 6),
//                                   ),
//                               Padding(
//                                 padding: const EdgeInsets.all(15.0),
//                                 child: Container(
//                                   height: 35,
//                                   width: 80,
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(20),
//                                       color: HexColor('#b14244')
//                                   ),
//                                   child: defaultTextButton(function: (){
//                                     NavigateTo(context, MatchDay());
//                                   }, text: 'See All',
//                                   ),
//                                 ),
//                               ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                        */
//               ],
//             ),
//           ),
//         ),
//
//     );
//
//   }
// }
// // BlocProvider(
// // create: (context) => LatestScreenCubit()..getMatchesTimeData(),
// // child: BlocConsumer<LatestScreenCubit, LatestScreenState>(
// // listener: (context, state) {},
// // builder: (context, state) {
// // List<Map> newslist = LatestScreenCubit.get(context).newsList;
// // List<Map> VideosList = LatestScreenCubit.get(context).VideosList;
// // List <MatchTimeModel> matchesTimeList =LatestScreenCubit.get(context).matchsTime;
// //
// // },
// // ),
// // );