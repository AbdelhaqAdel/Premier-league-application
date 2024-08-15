import 'package:flutter/material.dart';
import '../../data/models/data_model.dart';

Widget buildBoarditem(boardingModel model) => Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Expanded(
      child: Image(
        image: AssetImage(model.image),
      ),
    ),
    const SizedBox(
      height: 20,
    ),
    Text(
      model.title,
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
    ),
    const SizedBox(
      height: 20,
    ),
    Text(
      model.body,
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
    ),
    const SizedBox(
      height: 20,
    ),
  ],
);
