import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:premleague/layout/premleaguePro/premier.dart';
import 'package:premleague/modules/On_boarding/User_info/SelectFavTeamScreen.dart';
import 'package:premleague/shared/network/local/cache_helper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../shared/component/components.dart';
import '../../shared/styles/colors.dart';
import 'User_info/Regis_or_skip.dart';
import 'User_info/Login/UserLogin.dart';
class boardingModel {
  late final String image;
  late final String title;
  late final String body;
  boardingModel({
    required this.image,
    required this.title,
    required this.body,
  });
}

class OnBoarding extends StatefulWidget {
  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  bool islast = false;
  bool ismiddle =false;
  List<boardingModel> boarding = [
    boardingModel(
        image: ('assets/images/ph11.jpg'),
        title: 'Premir League',
        body: 'Get start to know who is the heroooo!! '),
    boardingModel(
        image: ('assets/images/liv1.jpg'),
        title: 'on board 2 title',
        body: 'All news , highlights and stats for you'),
    boardingModel(
        image: ('assets/images/ph7.jpg'),
        title: 'All Done',
        body: 'Get start to know who is the heroooo!!'),
  ];

  var boardcontroller = PageController();
  //const OnBoarding({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          defaultTextButton(
            Color: Colors.pink,
            function: () {
              NavigateTo(context, RegisOrSkip());
            },
            text: 'Skip',
            size: 15,
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  physics: BouncingScrollPhysics(),
                  onPageChanged: (index) {
                    if (index == boarding.length - 1) {
                      setState(() {
                        islast = true;
                      });
                    } else if(index == boarding.length - 2)
                    {
                      setState(() {
                        ismiddle = true;
                      });
                    }
                    else{
                      setState(() {
                        islast = false;
                        ismiddle = false;
                      });
                    }
                  },
                  controller: boardcontroller,
                  itemBuilder: (context, index) =>
                      buildBoarditem(boarding[index]),
                  itemCount: boarding.length,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  SmoothPageIndicator(
                      controller: boardcontroller,
                      effect: ExpandingDotsEffect(
                        dotColor: Colors.grey,
                        activeDotColor: defultColor,
                        dotHeight: 10,
                        dotWidth: 10,
                        spacing: 5,
                        expansionFactor: 4,
                      ),
                      count: boarding.length),
                  Spacer(),
                  CircularPercentIndicator(
                     animation: true,
                    // addAutomaticKeepAlive: true,
                    // animateFromLastPercent: true,
                     animationDuration: 1000,
                     radius: 40,
                     lineWidth: 6,
                     percent: islast? 1 : !ismiddle? .4 :.7,
                     progressColor:islast? Colors.pink[800] : !ismiddle? Colors.pink[400] :Colors.pink[600],
                     //backgroundColor: ,
                     circularStrokeCap: CircularStrokeCap.round,
                     center: FloatingActionButton(

                       onPressed: () {
                         if (islast) {
                           NavigateTo(context, RegisOrSkip());
                           // submit;
                         } else {
                           boardcontroller.nextPage(
                             duration: Duration(
                               milliseconds: 750,
                             ),
                             curve: Curves.fastLinearToSlowEaseIn,
                           );
                         }
                       },
                       child: islast
                           ? Container(

                         decoration: BoxDecoration(
                           color: Colors.white,
                           borderRadius: BorderRadius.circular(60)
                         ),
                             child: Icon(Icons.done,
                                                    size: 35,
                                                    ),
                           )
                           : Icon(Icons.arrow_forward_ios),
                     ),
                   ),
                    // Center(
                    //   child:
                    // ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildBoarditem(boardingModel model) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Image(
            image: AssetImage('${model.image}'),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          '${model.title}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          '${model.body}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
