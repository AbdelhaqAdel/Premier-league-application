import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../Stats/data/models/StandingsModel.dart';

Widget bestTeamItem(StandingsModel teams,context,bool isSelected)=>Padding(
  padding: const EdgeInsets.all(8.0),
  child: Container(
    height: 40,
    // width: 60,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      border: Border.all(
        width: 4,
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
              height: 50,
              width: 50,
            ) :
            Image.network(teams.bestTeamLogo,
              height: 50,
              width: 50,
            ),
          ),
        ),
        Text(teams.teamName,
          style: const TextStyle(
              fontWeight: FontWeight.bold
          ),
        ),
      ],
    ),
  ),
);