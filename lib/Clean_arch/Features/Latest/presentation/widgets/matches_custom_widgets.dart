import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../data/remote/models/MatchesResultsModel.dart';
import '../../data/remote/models/MatchsTimeModel.dart';
import '../../domain/entities/matches_resault_entity.dart';



Widget matchstime(MatchTimeModel model3, context) => Container(
  decoration: BoxDecoration(
      color: Colors.grey.withOpacity(.3),
      // gradient: LinearGradient(
      //     begin: Alignment.topLeft,
      //     end: Alignment.topRight,
      //     colors: [HexColor('#b01570').withOpacity(.3), Colors.deepPurple.withOpacity(.3)]),
      borderRadius: BorderRadius.circular(10)),
  height: 80,
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(

        width: 120,
        child: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 70,
                child: Text(
                  '${model3.homeName}',
                  maxLines: 1,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.grey[200],
                  ),
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage('${model3.homeLogo}'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8,bottom: 4),
              child: Container(child: Text('${DateTime.parse(model3.date).day} / '
                  '${DateTime.parse(model3.date).month}',
                style: TextStyle(
                  color: Colors.grey[300],
                  fontWeight: FontWeight.bold,
                ),
              )

              ),
            ),
            Container(
              height: 35,
              width: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  width: 2,
                  color: Color(0xFF17203A),
                ),
              ),
              child: Center(
                child: Text(
                  '${DateTime.parse(model3.date).hour + 3} : ${DateTime.parse(model3.date).minute}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      Container(
        width: 120,
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage('${model3.awayLogo}'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Container(
                width: 70,
                child: Text(
                  '${model3.awayName}',
                  maxLines: 1,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.grey[200],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  ),
);

Widget matchsResult(MatchesResultEntity matchesResult, context) => Container(
  width: 370,
  decoration: BoxDecoration(
    gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.topRight,
        colors: [
          HexColor('#b01570').withOpacity(.3),
          Colors.deepPurple.withOpacity(.3)
        ]),
    borderRadius: BorderRadius.circular(20),
  ),
  child: Container(
    //width: double.infinity,

    child: Padding(
      padding:
      const EdgeInsets.only(left: 4.0, right: 4, top: 6, bottom: 0),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        //  crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                    width: 150,
                    child: Center(
                      child: Text(
                        '${matchesResult.homeNameE}',
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.grey[300],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage('${matchesResult.homeLogoE}'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 8,
              ),
              Container(
                height: 40,
                width: 30,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/VS.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Column(
                children: [
                  Container(
                    width: 150,
                    child: Center(
                      child: Text(
                        '${matchesResult.awayNameE}',
                        maxLines: 1,
                        //overflow:TextOverflow.ellipsis ,
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.grey[300],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage('${matchesResult.awayLogoE}'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            height: 45,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Color(0xFF17203A),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${matchesResult.scoreHomeE}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.grey[300],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/ball1.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  '${matchesResult.scoreAwayE}',
                  style: TextStyle(
                    color: Colors.grey[300],
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  ),
);

Widget SoccerMatchResult(MatchesResultsModel results, context) => Container(
  decoration: BoxDecoration(
      color: Colors.grey.withOpacity(.2),
      borderRadius: BorderRadius.circular(10)),
  height: 65,
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        width: 120,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 70,
              child: Text(
                '${results.homeName}',
                maxLines: 1,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.grey[200],
                ),
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('${results.homeLogo}'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
      Center(
        child: Container(
          height: 35,
          width: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: Color(0xFF17203A),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${results.scoreHome}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.grey[300],
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Container(
                height: 15,
                width: 15,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/ball1.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                '${results.scoreAway}',
                style: TextStyle(
                  color: Colors.grey[300],
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
      Container(
        width: 120,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('${results.awayLogo}'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Container(
              width: 70,
              child: Text(
                '${results.awayName}',
                maxLines: 1,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.grey[200],
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  ),
);