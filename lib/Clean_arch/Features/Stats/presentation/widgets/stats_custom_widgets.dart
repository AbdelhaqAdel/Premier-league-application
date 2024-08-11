import 'package:flutter/material.dart';
import 'package:premleague/Clean_arch/Features/Stats/data/models/PlayerAssistsModel.dart';
import 'package:premleague/Clean_arch/Features/Stats/data/models/StandingsModel.dart';
import '../../data/models/CardsModel.dart';
import '../../data/models/ScorersModel.dart';

Widget ScorersBuildItem(ScorersModel model, context, int? index) => Padding(
  padding: const EdgeInsets.all(5.0),
  child: Container(
    height: 35,
    child: Row(
      children: [
        SizedBox(
          width: 15,
        ),
        Container(
          width: 50,
          child: Text(
            '${index}',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
        Container(
          width: 180,
          child: Text(
            '${model.PlayerName}',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
        Container(
          width: 100,
          child: Text(
            '${model.TeamName} ',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
        Container(
          width: 30,
          child: Text(
            '${model.Goals} ',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
      ],
    ),
  ),
);

Widget BuildLeagueTable(StandingsModel model1, context) => Padding(
  padding: const EdgeInsets.all(3.0),
  child: Container(
    height: 30,
    width: double.infinity,
    child: Container(
      // height: 35,
      child: Row(
        children: [
          SizedBox(
            width: 15,
          ),
          Container(
            width: 50,
            child: Text(
              '${model1.position}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey[300],
              ),
            ),
          ),
          Container(
            width: 160,
            child: Text(
              '${model1.teamName}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey[300],
              ),
            ),
          ),
          Container(
            width: 65,
            child: Text(
              '${model1.matchesPlay}',
              style: TextStyle(
                color: Colors.grey[300],
              ),
            ),
          ),
          Container(
            width: 50,
            child: Text(
              '${model1.goals}',
              style: TextStyle(
                color: Colors.grey[300],
              ),
            ),
          ),
          Container(
            width: 30,
            child: Text(
              '${model1.points}',
              style: TextStyle(
                color: Colors.grey[300],
              ),
            ),
          ),
        ],
      ),
    ),
  ),
);

Widget AssistsBuildItem(assistsModel model2, context, int index) => Container(
  child: Padding(
    padding: const EdgeInsets.all(5.0),
    child: Row(

      children: [
        SizedBox(
          width: 15,
        ),
        Container(
          width: 50,
          child: Text(
            '${index}',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          width: 155,
          child: Text(
            '${model2.player?.name}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        Container(
          width: 75,
          child: Text(
            '${model2.statistics?[0].team?.name} ',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(
          width: 55,
        ),
        Container(
          width: 30,
          child: Text(
            '${model2.statistics?[0].goals?.assists} ',
            style:
            TextStyle(                  color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    ),
  ),
);

Widget GoalsTeamsBuildItem(model, context) => Container(
  child: Row(

    children: [
      SizedBox(
        width: 15,
      ),
      Container(
        width: 50,
        child: Text(
          '${model['pos']}',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Container(
        width: 190,
        child: Text(
          '${model['TeamNam']}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      SizedBox(
        width: 70,
      ),
      Container(
        width: 30,
        child: Text(
          '${model['Goals']} ',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    ],
  ),
);

Widget cleansheetBuildItem(CardsModel model4, context, int index) => Container(
  height: 35,
  child: Padding(
    padding: const EdgeInsets.all(5.0),
    child: Row(
      children: [
        SizedBox(
          width: 15,
        ),
        Container(
          width: 50,
          child: Text(
            '${index}',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          width: 190,
          child: Text(
            '${model4.player?.name}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Container(
          width: 30,
          child: Text(
            '${model4.statistics?[0].cards?.yellow} ',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(
          width: 40,
        ),
        Container(
          width: 20,
          child: Text(
            '${model4.statistics?[0].cards?.red} ',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ],
    ),
  ),
);

