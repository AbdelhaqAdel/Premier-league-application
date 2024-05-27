import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../modules/archived_tasks/premleague/cubit/cubit/prem_cubit_cubit.dart';

class FavTeam extends StatelessWidget {
  const FavTeam({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PremCubitCubit,PremCubitState>(
        listener: (context,state){},
      builder:(context,state){
          PremCubitCubit cubit=PremCubitCubit.get(context);
          return  Scaffold(
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 35),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,

                      children: [
                        Text(
                              '${cubit.selectedTeamName}',
                              style: TextStyle(
                                color: Colors.grey[300],
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                        Spacer(),
                         CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.transparent,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child:Container(
                                  height: 30,
                                  width: 30,
                                  child: (PremCubitCubit.get(context).selectedImage!.contains('svg')) ?
                                  SvgPicture.network('${PremCubitCubit.get(context).selectedImage}',
                                    height: 50,
                                    width: 50,
                                  ) :
                                  Image.network('${PremCubitCubit.get(context).selectedImage}',
                                    height: 50,
                                    width: 50,
                                    //    color: Colors.red,
                                  ),
                                )
                                //Icon(Icons.card_giftcard,size:25,color: Colors.grey[300],),
                              )),

                        SizedBox(width: 10,),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
      },
    );
  }
}
