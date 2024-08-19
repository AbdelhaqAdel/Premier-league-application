import 'package:flutter/material.dart';
import 'package:premleague/Clean_arch/Features/Latest/domain/entities/matches_result_entity.dart';

Widget SoccerMatchResult(MatchesResultEntity results, context) => Container(


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
                '${results.homeNameE}',
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
                  image: NetworkImage('${results.homeLogoE}'),
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
                '${results.scoreHomeE}',
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
                '${results.scoreAwayE}',
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
                  image: NetworkImage('${results.awayLogoE}'),
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
                '${results.awayNameE}',
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