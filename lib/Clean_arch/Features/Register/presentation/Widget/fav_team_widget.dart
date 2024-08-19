import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../Stats/data/models/StandingsModel.dart';
Widget bestTeamItem(StandingsModel teams,context,bool isSelected)=>Padding(
  padding: const EdgeInsets.all(8.0),
  child: Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      border: Border.all(
        width: 2.w,
        color: isSelected?HexColor('#570861'):Colors.transparent,
      ),
      color: Colors.grey.withOpacity(.2),
    ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child:(teams.bestTeamLogo.contains('svg')) ?
              SvgPicture.network(teams.bestTeamLogo,
                height: 45.h,
                width: 45.w,
              ) :
              Image.network(teams.bestTeamLogo,
                height: 45.h,
                width: 45.w,
              ),
            ),
          ),
           SizedBox(
              width: 100.w,
              child: Center(
                child: Text(teams.teamName,
                  maxLines: 1,
                  style:  TextStyle(
                    color: Colors.black,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                      fontSize: 13.sp,
                  ),
                ),
              ),
            ),
        
        ],
      ),
  
  ),
);