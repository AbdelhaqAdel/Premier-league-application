import 'package:flutter/cupertino.dart';

import '../../data/models/data_model.dart';

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
