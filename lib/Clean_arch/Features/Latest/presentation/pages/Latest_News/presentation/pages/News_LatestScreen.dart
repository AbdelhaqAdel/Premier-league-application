import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../../../../../../shared/component/components.dart';
import '../../../../../../../../shared/component/list_components.dart';
import '../../../../../../../../modules/archived_tasks/premleague/cubit/cubit/prem_cubit_cubit.dart';
import '../../../../../../../../modules/premScreens/video.dart';

class LatestNewsScreen extends StatefulWidget {
  const LatestNewsScreen({Key? key}) : super(key: key);

  @override
  State<LatestNewsScreen> createState() => _LatestNewsScreenState();
}

class _LatestNewsScreenState extends State<LatestNewsScreen> {
  @override
  Widget build(BuildContext context) {
    return   BlocConsumer<PremCubitCubit, PremCubitState>(
      listener: (context, state) {},
      builder: (context, state) {
        PremCubitCubit cubit =PremCubitCubit.get(context);
        List<Map> newslist = PremCubitCubit.get(context).newsList;
        List<Map> VideosList = PremCubitCubit.get(context).VideosList;

        return Scaffold(
          backgroundColor:Colors.transparent,
          body:
             SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15),
                      child: Column(children: [
                        // Container(
                        //   decoration: BoxDecoration(
                        //     //  color: Colors.blueGrey,
                        //     gradient: LinearGradient(
                        //         begin: Alignment.topLeft,
                        //         end: Alignment.topRight,
                        //         colors: [
                        //           HexColor('#ef74bc'),
                        //           Colors.white70,
                        //         ]),
                        //   ),
                        //   height: 240,
                        //   child: InkWell(
                        //     onTap: () {
                        //       print(currentIndex);
                        //     },
                        //     child: Container(
                        //       height: 500,
                        //       child: CarouselSlider(
                        //         items: imageList
                        //             .map(
                        //               (item) => Image.asset(
                        //                 item['image_path'],
                        //                 fit: BoxFit.cover,
                        //                 width: double.infinity,
                        //
                        //                 //height: 100,
                        //               ),
                        //             )
                        //             .toList(),
                        //         carouselController: carouselController,
                        //         options: CarouselOptions(
                        //           height: 230,
                        //           scrollPhysics:
                        //               const BouncingScrollPhysics(),
                        //           autoPlay: true,
                        //           aspectRatio: 2,
                        //           viewportFraction: 1,
                        //           onPageChanged: (index, reason) {
                        //             setState(() {
                        //               currentIndex = index;
                        //             });
                        //           },
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0,right: 16),
                      child: Container(
                        color: Colors.transparent,
                        child: Column(
                          children: [
                            // Text(
                            //   'Latest News ',
                            //   style: Theme.of(context).textTheme.bodyLarge,
                            // ),
                            Container(
                              height: 480,
                              //width: double.infinity,

                                child: ListView.separated(
                                    physics: BouncingScrollPhysics(),
                                    itemBuilder: (context, index) =>
                                        buildArticleItem(
                                            newslist[index], context),
                                    separatorBuilder: (context, index) =>
                                        SizedBox(height: 10,),
                                    itemCount: newslist.length),
                              )

                          ],
                        ),
                      ),
                    ),


                    Padding(
                      padding: const EdgeInsets.only(right: 8.0,left: 8,top:4),
                      child: Container(
                        color: Colors.transparent,
                        child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 6.0,right: 6,top: 5),
                                child: Container(
                                  width: double.infinity,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: HexColor('#570861'),
                                    borderRadius: BorderRadius.circular(15),

                                  ),
                                  child: Center(
                                    child: Text(
                                      'Latest Highlights',
                                      style: Theme.of(context).textTheme.bodyLarge,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 15,),
                              Container(
                                width: double.infinity,
                                  height: 355,
                                  child: PageView.builder(
                                      physics: BouncingScrollPhysics(),
                                      itemBuilder: (context, index) =>
                                          GestureDetector(
                                            onTap: (){
                                              cubit.ChangeVideos(index);
                                              NavigateTo(context, HomePage());
                                            },
                                            child: buildVideosItem(
                                                VideosList[index], context,index),
                                          ),

                                      itemCount: VideosList.length),

                                  /*
                                        ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: videoUrls.length,
                                          itemBuilder: (context, index) {
                                            return VideoPlayerWidget(videoUrl: videoUrls[index]);
                                          },
                                        )
                                      */
                                  /*PageView.builder(
                                    physics: BouncingScrollPhysics(),
                                    itemBuilder:(context,index)=>buildVideosItem(context),
                                    itemCount: 4,
                                  ),*/
                                ),

                                SizedBox(height: 80,),
                            ],
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





// Padding(
// padding: const EdgeInsets.all(5.0),
// child: Stack(
// children: [
// Container(
// decoration: BoxDecoration(
// gradient: LinearGradient(
// begin: Alignment.topLeft,
// end: Alignment.topRight,
// colors: [
// HexColor('#ef74bc'),
// Colors.white70,
// ]),
// borderRadius: BorderRadius.circular(7),
// ),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// //mainAxisAlignment: MainAxisAlignment.start,
// children: [
// Padding(
// padding: const EdgeInsets.all(15.0),
// child: Text(
// 'Matchs Week time ',
// style: Theme.of(context).textTheme.bodyLarge,
// ),
// ),
// Container(
// height: 500,
// width: double.infinity,
// child: ConditionalBuilder(
// condition: matchesTimeList.length > 0,
// builder: (context) =>  ListView.separated(
// physics: BouncingScrollPhysics(),
// itemBuilder: (context, index) =>
// matchstime(matchesTimeList[index],context),
// separatorBuilder: (context, index) =>
// myDevider(),
// itemCount: matchesTimeList.length),
// fallback: (context) =>
// Center(child: CircularProgressIndicator()),
// ),
//
// ),
// Padding(
// padding: const EdgeInsets.all(15.0),
// child: Container(
// height: 35,
// width: 80,
// decoration: BoxDecoration(
// borderRadius:
// BorderRadius.circular(20),
// color: HexColor('#b14244')),
// child: defaultTextButton(
// function: () {
// NavigateTo(context, MatchDay());
// },
// text: 'See All',
// ),
// ),
// ),
// ],
// ),
// ),
// ],
// ),
// ),