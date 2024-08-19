import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:premleague/Clean_arch/Core/Utils/extention/build_context_extention.dart';
import '../../../../../Core/Utils/components.dart';
import '../../../../../../modules/archived_tasks/premleague/cubit/cubit/prem_cubit_cubit.dart';
import '../../widgets/news_latest_custom_widget.dart';
import 'video.dart';

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
        List<Map> videosList = PremCubitCubit.get(context).videosList;

        return Scaffold(
          backgroundColor:Colors.transparent,
          body:
             SingleChildScrollView(
                child: Padding(
                  padding:  const EdgeInsets.all(10),
                  child: Column(
                    children: [                   
                  
                        Container(
                          //   padding:  EdgeInsets.only(left: 16.w,right: 16.w),
                  
                          color: Colors.transparent,
                          child: Column(
                            children: [
                        
                              SizedBox(
                                height: context.screenHeight/1.8,
                                //width: double.infinity,
                  
                                  child: ListView.separated(
                                      physics: const BouncingScrollPhysics(),
                                      itemBuilder: (context, index) =>
                                          buildArticleItem(
                                              newslist[index], context),
                                      separatorBuilder: (context, index) =>
                                          SizedBox(height: context.w(10.0),),
                                      itemCount: newslist.length),
                                )
                  
                            ],
                          ),
                        ),
                  
                    Container(
                          color: Colors.transparent,
                          child: Column(
                              children: [
                              Container(
                                    width: double.infinity,
                                    height: 50.h,
                                    decoration: BoxDecoration(
                                      color: HexColor('#570861'),
                                      borderRadius: BorderRadius.circular(15),
                  
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Latest Highlights',
                                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                
                                SizedBox(height:  context.w(15.0),),
                                SizedBox(
                                  width: double.infinity,
                                    height: context.screenHeight/2.3,
                                    child: PageView.builder(
                                        physics: const BouncingScrollPhysics(),
                                        itemBuilder: (context, index) =>
                                            Padding(
                                              padding:EdgeInsets.only(left: 6.0.w,right: 6.w),
                                              child: GestureDetector(
                                                onTap: (){
                                                  cubit.changeVideos(index);
                                                  NavigateTo(context, const HomePage());
                                                },
                                                child: buildVideosItem(
                                                    videosList[index], context,index),
                                              ),
                                            ),
                  
                                        itemCount: videosList.length),
                  
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
                  
                                 const SizedBox(height: 80,),
                              ],
                            ),
                  
                        ),
                      
                    ],
                  ),
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