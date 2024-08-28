import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:premleague/Clean_arch/Config/Theme/Color.dart';
import 'package:premleague/Clean_arch/Core/Utils/Strings/app_text.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../Core/Utils/app_images.dart';
import '../../../../Core/Utils/components.dart';
import '../../../Register/presentation/pages/Regis_or_skip.dart';
import '../../data/models/data_model.dart';
import '../widgets/onBoarding_custom_widget.dart';

class OnBoarding extends StatefulWidget {
  @override
  State<OnBoarding> createState() => _OnBoardingState();
}
class _OnBoardingState extends State<OnBoarding> {
  bool islast = false;
 // bool ismiddle =false;
  List<boardingModel> boarding = [
    boardingModel(
        image: (AppImages.onBoardingImagesP1),
        title: 'Premier League',
        body: AppText.onBoardingTextP1),
    boardingModel(
        image: (AppImages.onBoardingImagesP2),
        title: 'Get start...',
        body: AppText.onBoardingTextP2),
    // boardingModel(
    //     image: (AppImages.onBoardingImagesP3),
    //     title: 'All Done',
    //     body:AppText.onBoardingTextP3 ),
  ];

  var boardcontroller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          defaultTextButton(
            Color: Colors.pink,
            function: () {
              navigateTo(context, RegisOrSkip());
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
                  physics: const BouncingScrollPhysics(),
                  onPageChanged: (index) {
                    if (index == boarding.length - 1) {
                      setState(() {
                        islast = true;
                      });
                     }
                    // else if(index == boarding.length - 2)
                    // {
                    //   setState(() {
                    //     ismiddle = true;
                    //   });
                    // }
                    else{
                      setState(() {
                        islast = false;
                     //   ismiddle = false;
                      });
                    }
                  },
                  controller: boardcontroller,
                  itemBuilder: (context, index) =>
                      buildBoarditem(boarding[index],context),
                  itemCount: boarding.length,
                ),
              ),
               SizedBox(
                height: MediaQuery.of(context).size.height/14,
              ),
              Row(
                children: [
                  SmoothPageIndicator(
                      controller: boardcontroller,
                      effect: const ExpandingDotsEffect(
                        dotColor: Colors.grey,
                        activeDotColor: AppColor.defaultColor,
                        dotHeight: 10,
                        dotWidth: 10,
                        spacing: 5,
                        expansionFactor: 4,
                      ),
                      count: boarding.length),
                  const Spacer(),
                  CircularPercentIndicator(
                     animation: true,
                    // addAutomaticKeepAlive: true,
                    // animateFromLastPercent: true,
                     animationDuration: 1000,
                     radius: 40,
                     lineWidth: 6,
                     percent: islast? 1 :.5,
                      //!ismiddle? .4
                      
                     progressColor:islast? Colors.pink[800]:Colors.pink[600],
                     //backgroundColor: ,
                     circularStrokeCap: CircularStrokeCap.round,
                     center: Container(
                       height: 53.h,
                       width: 60.w,
                       decoration: const BoxDecoration(
                         color: Colors.pink,
                         shape: BoxShape.circle,
                       ),
                       child: FloatingActionButton(
                         shape:const StadiumBorder(),
                         backgroundColor: Colors.pink,
                         onPressed: () {
                           if (islast) {
                             navigateTo(context, const RegisOrSkip());
                             // submit;
                           } else {
                             boardcontroller.nextPage(
                               duration: const Duration(
                                 milliseconds: 750,
                               ),
                               curve: Curves.fastLinearToSlowEaseIn,
                             );
                           }
                         },
                         child:  islast
                                   ? const Icon(Icons.done,
                                 color: Colors.white,
                                  size: 35
                               ):const Icon(Icons.arrow_forward_ios,
                                 color: Colors.white,
                               ),


                       ),
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

