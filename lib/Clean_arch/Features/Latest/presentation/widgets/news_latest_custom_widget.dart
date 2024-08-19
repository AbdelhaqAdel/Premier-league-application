import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../../Core/Utils/components.dart';
import '../pages/LatestScreens/AllnewsScreen.dart';

Widget buildArticleItem(Map newsList, context) => GestureDetector(
  onTap: () {
    NavigateTo(context, AllNewsScreen());
  },
  child: ClipRRect(
    child: BackdropFilter(
      filter: ImageFilter.blur(
          sigmaX: 30, sigmaY: 30, tileMode: TileMode.clamp),
      child: Container(
        //  height: 350,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white.withOpacity(.2),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Container(
                height: 330,

                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  // borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: NetworkImage('${newsList['image']}'),
                    fit: BoxFit.cover,
                    // image: NetworkImage('${article['urlToImage']}'),
                  ),
                ),
              ),

            ),
            Padding(
              padding:
              const EdgeInsets.only(top: 14.0, left: 22, bottom: 10),
              child: Container(
                //  height: 80,
                width: double.infinity,
                child: Column(
                  //mainAxisAli8gnment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${newsList['title']}',
                      style: Theme.of(context).textTheme.bodyLarge,


                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(

                      child: Text(
                        '${newsList['text']}',
                        style: Theme.of(context).textTheme.bodyLarge,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  ),
);

Widget buildVideosItem(Map videoList, context, int index) =>  Container(
    decoration: BoxDecoration(
      color: Colors.grey[600],
      borderRadius: BorderRadius.circular(10),
    ),

    child: Column(
      children: [
         Container(
            // width: 360,
            height: MediaQuery.of(context).size.height/3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              // borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: NetworkImage('${videoList['image']}'),
                fit: BoxFit.cover,
                // image: NetworkImage('${article['urlToImage']}'),
              ),
            ),
          ),
        
        Padding(
          padding:const EdgeInsets.all(10),
          child: SizedBox(
            height: 50.h,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              //  crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 220.h,
                  child: Text(
                    '${videoList['title']}',
                    style: Theme.of(context).textTheme.bodyLarge,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const Spacer(),
                // SizedBox(width: 225,),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Stack(children: [
                    Container(
                      width: 60,
                      height: 90,
                      decoration: BoxDecoration(
                        color: HexColor('#570861'),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    Center(
                      child: Icon(
                        Icons.play_arrow,
                        color: Colors.grey[400],
                        size: 60,
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
    // SizedBox(width: 20,),
  );

  // Container(
  //   decoration:BoxDecoration(
  //     borderRadius: BorderRadius.circular(15),
  //   ) ,
  //   child: Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Stack(
  //         alignment: AlignmentDirectional.center,
  //         children: [
  //               Container(
  //                 height: 300,
  //                 decoration: BoxDecoration(
  //                   image: DecorationImage(
  //
  //                     image:NetworkImage('${VideoList['image']}'),
  //                     fit: BoxFit.cover,
  //                   ),
  //                 ),
  //               ),
  //               // Center(
  //               //   child: Icon(Icons.play_arrow,
  //               //     color: Colors.white,
  //               //     size: 80,
  //               //
  //               //   ),
  //               // ),
  //         ],
  //       ),
  //       Text('${VideoList['title']}'),
  //     ],
  //   ),
  // ),

