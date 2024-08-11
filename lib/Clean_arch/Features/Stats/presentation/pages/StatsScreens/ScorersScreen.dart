import 'dart:ffi';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:premleague/Clean_arch/Features/Stats/data/models/ScorersModel.dart';
import '../../../../../Core/Utils/components.dart';
import '../../../../../../shared/component/list_components.dart';
import '../../../../../../modules/archived_tasks/premleague/cubit/cubit/prem_cubit_cubit.dart';
import '../../widgets/stats_custom_widgets.dart';
class ScorersScreen extends StatelessWidget {
  const ScorersScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<PremCubitCubit, PremCubitState>(
            listener: (context, state) {},
            builder: (context, state) {
              PremCubitCubit cubit = PremCubitCubit.get(context);
             // List scorersList=ScorersModel2.scorers;
                List<ScorersModel>scorersList= PremCubitCubit.get(context).scorers;
              return Scaffold(
                appBar: AppBar(
                  title: const Text('Players'),
                ),
                body: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.start,

                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: HexColor('#570861'),
                          ),
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      '1',
                                      style: TextStyle(
                                        fontSize: 35,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.purple,
                                      ),
                                    ),
                                    Text(
                                      'Erling Haland',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.grey[300],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    const Text(
                                      'Manchester City',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    const Text(
                                      '36',
                                      style: TextStyle(
                                        fontSize: 50,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.purple,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                          const Spacer(),
                              Container(
                                height: 200,
                                width: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: const DecorationImage(
                                    image: AssetImage(
                                        'assets/images/haland11.png'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(color: Colors.grey[200]),
                          child: const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  'Pos',
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Text(
                                  'Player',
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(
                                  width: 138.5,
                                ),
                                Text(
                                  'Team',
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                Text(
                                  'Goals',
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: ConditionalBuilder(
                            condition: scorersList.isNotEmpty,
                            builder: (context) => ListView.separated(
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) => ScorersBuildItem(
                                    scorersList[index+1], context,index+2),
                                separatorBuilder: (context, index) => myDevider(),
                                itemCount: scorersList.length-1),
                            fallback: (context) =>
                                const Center(child: CircularProgressIndicator()),
                          ),
                        ),
                      ],
                    ),
                  ),

              );
            });
  }
}
