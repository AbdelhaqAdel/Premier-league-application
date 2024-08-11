import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:premleague/Clean_arch/Core/Utils/Strings/app_text.dart';
import 'package:premleague/Clean_arch/Features/Stats/data/models/StandingsModel.dart';
import 'package:premleague/Clean_arch/Core/Utils/components.dart';
import '../../../../premier.dart';
import '../../../../../modules/archived_tasks/premleague/cubit/cubit/prem_cubit_cubit.dart';
import '../Widget/fav_team_widget.dart';

class SelectBestTeamScreen extends StatefulWidget {
  const SelectBestTeamScreen({Key? key}) : super(key: key);
  @override
  State<SelectBestTeamScreen> createState() => _SelectBestTeamScreenState();
}
class _SelectBestTeamScreenState extends State<SelectBestTeamScreen> {
   var isSelected;
    var item;
   int selectedIndex = -1;
   @override
  Widget build(BuildContext context) {
    return BlocConsumer<PremCubitCubit, PremCubitState>(
        listener: (context, state) {},
        builder: (context, state) {
          List<StandingsModel> bestTeamList =
              PremCubitCubit.get(context).standings;
          return Scaffold(
            appBar:AppBar(
              backgroundColor: HexColor('#570861'),
              title: const Text(AppText.selectFavTeam,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 595,
                  width: double.infinity,
                  child: ConditionalBuilder(
                    condition: bestTeamList.isNotEmpty,
                    builder: (context) => GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 160,
                        childAspectRatio: 1.1,
                      ),
                      itemCount: bestTeamList.length,
                      itemBuilder: (context, index) {
                        item = bestTeamList[index];
                        isSelected = index == selectedIndex;
                        return GestureDetector(
                        onTap: (){
                          setState(() {
                            selectedIndex=index;
                            PremCubitCubit.get(context).selectedImage=PremCubitCubit.get(context).standings[index].bestTeamLogo;
                            PremCubitCubit.get(context).selectedTeamName=PremCubitCubit.get(context).standings[index].teamName;
                            print( PremCubitCubit.get(context).selectedImage);
                          });
                        },
                        child: bestTeamItem(
                                bestTeamList[index], context,isSelected
                        ),
                      );}
                    ),
                    fallback: (context) =>
                        const Center(child: CircularProgressIndicator()),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 5, right: 8.0, left: 8, bottom: 8),
                  child:
                  IgnorePointer(
                    ignoring: selectedIndex>=0?false:true,
                    child: GestureDetector(
                      onTap: (){
                        NavigateTo(context, const premleague());
                        },
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color:selectedIndex>=0? HexColor('#570861'):Colors.grey[500],
                        ),
                        child: const Center(child: Text('Done',
                        style: TextStyle(
                          color:Colors.white,
                        ),
                        )),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );

        }
        );
  }
  // Widget BestTeamItem(StandingsModel teams,context)=>Padding(
  //   padding: const EdgeInsets.all(8.0),
  //   child: Container(
  //       height: 40,
  //       // width: 60,
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(15),
  //         border: Border.all(
  //           width: 4,
  //           color: isSelected?HexColor('#570861'):Colors.transparent,
  //         ),
  //         color: Colors.grey.withOpacity(.2),
  //       ),
  //       child: Column(
  //         children: [
  //           Padding(
  //             padding: const EdgeInsets.all(8.0),
  //             child: Container(
  //               child:(teams.bestTeamLogo.contains('svg')) ?
  //               SvgPicture.network(teams.bestTeamLogo,
  //                 height: 50,
  //                 width: 50,
  //               ) :
  //               Image.network(teams.bestTeamLogo,
  //                 height: 50,
  //                 width: 50,
  //               ),
  //             ),
  //           ),
  //           //(imageName.contains('svg')) ? SvgPicture.network(imageName) : Image.network(imageName),
  //           Text('${teams.teamName}',
  //             style: TextStyle(
  //                 fontWeight: FontWeight.bold
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //
  // );
}

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:premleague/modules/premScreens/premierScrenCubits/LatestScreen/cubit/latest_screen_cubit.dart';
//
// import '../archived_tasks/premleague/cubit/cubit/prem_cubit_cubit.dart';
// import '../../shared/component/list_components.dart';
//
// class favTeamScreen extends StatelessWidget {
//   const favTeamScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<LatestScreenCubit, LatestScreenState>(
//         listener: (context, state) {},
//         builder: (context, state) {
//           List imageList = [
//             {"id": 1, "image_path": 'assets/images/bk11.jpg'},
//             {"id": 2, "image_path": 'assets/images/img1.jpg'},
//             {"id": 3, "image_path": 'assets/images/img3.jpg'}
//           ];
//           List<Map> newslist= LatestScreenCubit.get(context).newsList;
//           PremCubitCubit cubit = PremCubitCubit.get(context);
//           return Scaffold(
//             appBar: AppBar(),
//             body: SingleChildScrollView(
//               child:  Container(
//
//                 height: 200,
//                 //width: double.infinity,
//                 decoration: BoxDecoration(
//                   // color:  HexColor('#f0e4e4'),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child:Container(
//                   height: 500,
//                  child: ListView.separated(
//                       //scrollDirection: Axis.horizontal,
//                       physics: BouncingScrollPhysics(),
//                       itemBuilder: (context ,index)=>matchstime(context),
//                       separatorBuilder: (context, index) => SizedBox(width: 20,),
//                       itemCount:5,
//                   ),
//                 ),
//               ),
//
//
// /*
//               Column(
//                 children:
//                   [
//                     ListView.separated(
//                       //   scrollDirection: Axis.horizontal,
//                       // physics: BouncingScrollPhysics(),
//                       itemBuilder: (context, index) =>cubit.BuildTeamItem(
//                           cubit.Favteam[index], context),
//                       separatorBuilder: (context, index) => SizedBox(
//                         height: 10,
//                       ),
//                       itemCount: 3,
//                     ),
//                   ]
//                     /*
//                 [
//                   GestureDetector(
//                     onTap: () {
//                       cubit.imageindex1 = 0;
//                     },
//                     child: Container(
//                       width: double.infinity,
//                       height: 50,
//                       decoration: BoxDecoration(
//                         color: Color.fromRGBO(135, 233, 151, 1),
//                         borderRadius: BorderRadius.circular(30),
//
//                       ),
//
//                       child: Padding(
//                         padding: const EdgeInsets.all(5.0),
//                         child: Row(
//                           children: [
//                             SizedBox(width: 5,),
//                             Text('Liverpoll',
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             SizedBox(width: 190,),
//                             CircleAvatar(
//                               backgroundColor: Colors.white,
//                               radius: 30,
//                               child: Container(
//                                 height: 30,
//                                 width: 30,
//                                 decoration: BoxDecoration(
//                                   image: DecorationImage(
//                                     image: AssetImage(
//                                         'assets/images/liverLogo.jpeg'),
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//
//                     ),
//                   ),
//                   SizedBox(height: 7,),
//                   GestureDetector(
//                     onTap: () {
//                       cubit.imageindex1 = 1;
//                     },
//                     child: Container(
//                       width: double.infinity,
//                       height: 50,
//                       decoration: BoxDecoration(
//                         color: Color.fromRGBO(135, 233, 151, 1),
//                         borderRadius: BorderRadius.circular(30),
//
//                       ),
//
//                       child: Padding(
//                         padding: const EdgeInsets.all(5.0),
//                         child: Row(
//                           children: [
//                             SizedBox(width: 5,),
//                             Text('Liverpoll',
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             SizedBox(width: 190,),
//                             CircleAvatar(
//                               backgroundColor: Colors.white,
//                               radius: 30,
//                               child: Container(
//                                 height: 30,
//                                 width: 30,
//                                 decoration: BoxDecoration(
//                                   image: DecorationImage(
//                                     image: AssetImage(
//                                         'assets/images/liverLogo.jpeg'),
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//
//                     ),
//                   ),
//                   SizedBox(height: 7,),
//                   GestureDetector(
//                     onTap: () {
//                       cubit.imageindex1 = 2;
//                     },
//                     child: Container(
//                       width: double.infinity,
//                       height: 50,
//                       decoration: BoxDecoration(
//                         color: Color.fromRGBO(135, 233, 151, 1),
//                         borderRadius: BorderRadius.circular(30),
//
//                       ),
//
//                       child: Padding(
//                         padding: const EdgeInsets.all(5.0),
//                         child: Row(
//                           children: [
//                             SizedBox(width: 5,),
//                             Text('Liverpoll',
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             SizedBox(width: 190,),
//                             CircleAvatar(
//                               backgroundColor: Colors.white,
//                               radius: 30,
//                               child: Container(
//                                 height: 30,
//                                 width: 30,
//                                 decoration: BoxDecoration(
//                                   image: DecorationImage(
//                                     image: AssetImage(
//                                         'assets/images/liverLogo.jpeg'),
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//
//                     ),
//                   ),
//                   SizedBox(height: 7,),
//                   GestureDetector(
//                     onTap: () {
//                       cubit.imageindex1 = 3;
//                     },
//                     child: Container(
//                       width: double.infinity,
//                       height: 50,
//                       decoration: BoxDecoration(
//                         color: Color.fromRGBO(135, 233, 151, 1),
//                         borderRadius: BorderRadius.circular(30),
//
//                       ),
//
//                       child: Padding(
//                         padding: const EdgeInsets.all(5.0),
//                         child: Row(
//                           children: [
//                             SizedBox(width: 5,),
//                             Text('Liverpoll',
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             SizedBox(width: 190,),
//                             CircleAvatar(
//                               backgroundColor: Colors.white,
//                               radius: 30,
//                               child: Container(
//                                 height: 30,
//                                 width: 30,
//                                 decoration: BoxDecoration(
//                                   image: DecorationImage(
//                                     image: AssetImage(
//                                         'assets/images/liverLogo.jpeg'),
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//
//                     ),
//                   ),
//                   SizedBox(height: 7,),
//                   GestureDetector(
//                     onTap: () {
//                       cubit.imageindex1 = 4;
//                     },
//                     child: Container(
//                       width: double.infinity,
//                       height: 50,
//                       decoration: BoxDecoration(
//                         color: Color.fromRGBO(135, 233, 151, 1),
//                         borderRadius: BorderRadius.circular(30),
//
//                       ),
//
//                       child: Padding(
//                         padding: const EdgeInsets.all(5.0),
//                         child: Row(
//                           children: [
//                             SizedBox(width: 5,),
//                             Text('Liverpoll',
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             SizedBox(width: 190,),
//                             CircleAvatar(
//                               backgroundColor: Colors.white,
//                               radius: 30,
//                               child: Container(
//                                 height: 30,
//                                 width: 30,
//                                 decoration: BoxDecoration(
//                                   image: DecorationImage(
//                                     image: AssetImage(
//                                         'assets/images/liverLogo.jpeg'),
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//
//                     ),
//                   ),
//                   SizedBox(height: 7,),
//                   GestureDetector(
//                     onTap: () {
//                       cubit.imageindex1 = 5;
//                     },
//                     child: Container(
//                       width: double.infinity,
//                       height: 50,
//                       decoration: BoxDecoration(
//                         color: Color.fromRGBO(135, 233, 151, 1),
//                         borderRadius: BorderRadius.circular(30),
//
//                       ),
//
//                       child: Padding(
//                         padding: const EdgeInsets.all(5.0),
//                         child: Row(
//                           children: [
//                             SizedBox(width: 5,),
//                             Text('Liverpoll',
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             SizedBox(width: 190,),
//                             CircleAvatar(
//                               backgroundColor: Colors.white,
//                               radius: 30,
//                               child: Container(
//                                 height: 30,
//                                 width: 30,
//                                 decoration: BoxDecoration(
//                                   image: DecorationImage(
//                                     image: AssetImage(
//                                         'assets/images/liverLogo.jpeg'),
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//
//                     ),
//                   ),
//                   SizedBox(height: 7,),
//                   GestureDetector(
//                     onTap: () {
//                       cubit.imageindex1 = 6;
//                     },
//                     child: Container(
//                       width: double.infinity,
//                       height: 50,
//                       decoration: BoxDecoration(
//                         color: Color.fromRGBO(135, 233, 151, 1),
//                         borderRadius: BorderRadius.circular(30),
//
//                       ),
//
//                       child: Padding(
//                         padding: const EdgeInsets.all(5.0),
//                         child: Row(
//                           children: [
//                             SizedBox(width: 5,),
//                             Text('Liverpoll',
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             SizedBox(width: 190,),
//                             CircleAvatar(
//                               backgroundColor: Colors.white,
//                               radius: 30,
//                               child: Container(
//                                 height: 30,
//                                 width: 30,
//                                 decoration: BoxDecoration(
//                                   image: DecorationImage(
//                                     image: AssetImage(
//                                         'assets/images/liverLogo.jpeg'),
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//
//                     ),
//                   ),
//                   SizedBox(height: 7,),
//                   GestureDetector(
//                     onTap: () {
//                       cubit.imageindex1 = 7;
//                     },
//                     child: Container(
//                       width: double.infinity,
//                       height: 50,
//                       decoration: BoxDecoration(
//                         color: Color.fromRGBO(135, 233, 151, 1),
//                         borderRadius: BorderRadius.circular(30),
//
//                       ),
//
//                       child: Padding(
//                         padding: const EdgeInsets.all(5.0),
//                         child: Row(
//                           children: [
//                             SizedBox(width: 5,),
//                             Text('Liverpoll',
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             SizedBox(width: 190,),
//                             CircleAvatar(
//                               backgroundColor: Colors.white,
//                               radius: 30,
//                               child: Container(
//                                 height: 30,
//                                 width: 30,
//                                 decoration: BoxDecoration(
//                                   image: DecorationImage(
//                                     image: AssetImage(
//                                         'assets/images/liverLogo.jpeg'),
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//
//                     ),
//                   ),
//                   SizedBox(height: 7,),
//                   GestureDetector(
//                     onTap: () {
//                       cubit.imageindex1 = 8;
//                     },
//                     child: Container(
//                       width: double.infinity,
//                       height: 50,
//                       decoration: BoxDecoration(
//                         color: Color.fromRGBO(135, 233, 151, 1),
//                         borderRadius: BorderRadius.circular(30),
//
//                       ),
//
//                       child: Padding(
//                         padding: const EdgeInsets.all(5.0),
//                         child: Row(
//                           children: [
//                             SizedBox(width: 5,),
//                             Text('Liverpoll',
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             SizedBox(width: 190,),
//                             CircleAvatar(
//                               backgroundColor: Colors.white,
//                               radius: 30,
//                               child: Container(
//                                 height: 30,
//                                 width: 30,
//                                 decoration: BoxDecoration(
//                                   image: DecorationImage(
//                                     image: AssetImage(
//                                         'assets/images/liverLogo.jpeg'),
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//
//                     ),
//                   ),
//                   SizedBox(height: 7,),
//                   GestureDetector(
//                     onTap: () {
//                       cubit.imageindex1 = 9;
//                     },
//                     child: Container(
//                       width: double.infinity,
//                       height: 50,
//                       decoration: BoxDecoration(
//                         color: Color.fromRGBO(135, 233, 151, 1),
//                         borderRadius: BorderRadius.circular(30),
//
//                       ),
//
//                       child: Padding(
//                         padding: const EdgeInsets.all(5.0),
//                         child: Row(
//                           children: [
//                             SizedBox(width: 5,),
//                             Text('Liverpoll',
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             SizedBox(width: 190,),
//                             CircleAvatar(
//                               backgroundColor: Colors.white,
//                               radius: 30,
//                               child: Container(
//                                 height: 30,
//                                 width: 30,
//                                 decoration: BoxDecoration(
//                                   image: DecorationImage(
//                                     image: AssetImage(
//                                         'assets/images/liverLogo.jpeg'),
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//
//                     ),
//                   ),
//                   SizedBox(height: 7,),
//                   GestureDetector(
//                     onTap: () {
//                       cubit.imageindex1 = 10;
//                     },
//                     child: Container(
//                       width: double.infinity,
//                       height: 50,
//                       decoration: BoxDecoration(
//                         color: Color.fromRGBO(135, 233, 151, 1),
//                         borderRadius: BorderRadius.circular(30),
//
//                       ),
//
//                       child: Padding(
//                         padding: const EdgeInsets.all(5.0),
//                         child: Row(
//                           children: [
//                             SizedBox(width: 5,),
//                             Text('Liverpoll',
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             SizedBox(width: 190,),
//                             CircleAvatar(
//                               backgroundColor: Colors.white,
//                               radius: 30,
//                               child: Container(
//                                 height: 30,
//                                 width: 30,
//                                 decoration: BoxDecoration(
//                                   image: DecorationImage(
//                                     image: AssetImage(
//                                         'assets/images/liverLogo.jpeg'),
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//
//                     ),
//                   ),
//                   SizedBox(height: 7,),
//                   GestureDetector(
//                     onTap: () {
//                       cubit.imageindex1 = 11;
//                     },
//                     child: Container(
//                       width: double.infinity,
//                       height: 50,
//                       decoration: BoxDecoration(
//                         color: Color.fromRGBO(135, 233, 151, 1),
//                         borderRadius: BorderRadius.circular(30),
//
//                       ),
//
//                       child: Padding(
//                         padding: const EdgeInsets.all(5.0),
//                         child: Row(
//                           children: [
//                             SizedBox(width: 5,),
//                             Text('Liverpoll',
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             SizedBox(width: 190,),
//                             CircleAvatar(
//                               backgroundColor: Colors.white,
//                               radius: 30,
//                               child: Container(
//                                 height: 30,
//                                 width: 30,
//                                 decoration: BoxDecoration(
//                                   image: DecorationImage(
//                                     image: AssetImage(
//                                         'assets/images/liverLogo.jpeg'),
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//
//                     ),
//                   ),
//                   SizedBox(height: 7,),
//                   GestureDetector(
//                     onTap: () {
//                       cubit.imageindex1= 12;
//                     },
//                     child: Container(
//                       width: double.infinity,
//                       height: 50,
//                       decoration: BoxDecoration(
//                         color: Color.fromRGBO(135, 233, 151, 1),
//                         borderRadius: BorderRadius.circular(30),
//
//                       ),
//
//                       child: Padding(
//                         padding: const EdgeInsets.all(5.0),
//                         child: Row(
//                           children: [
//                             SizedBox(width: 5,),
//                             Text('Liverpoll',
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             SizedBox(width: 190,),
//                             CircleAvatar(
//                               backgroundColor: Colors.white,
//                               radius: 30,
//                               child: Container(
//                                 height: 30,
//                                 width: 30,
//                                 decoration: BoxDecoration(
//                                   image: DecorationImage(
//                                     image: AssetImage(
//                                         'assets/images/liverLogo.jpeg'),
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//
//                     ),
//                   ),
//                   SizedBox(height: 7,),
//                   GestureDetector(
//                     onTap: () {
//                       cubit.imageindex1 = 13;
//                     },
//                     child: Container(
//                       width: double.infinity,
//                       height: 50,
//                       decoration: BoxDecoration(
//                         color: Color.fromRGBO(135, 233, 151, 1),
//                         borderRadius: BorderRadius.circular(30),
//
//                       ),
//
//                       child: Padding(
//                         padding: const EdgeInsets.all(5.0),
//                         child: Row(
//                           children: [
//                             SizedBox(width: 5,),
//                             Text('Liverpoll',
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             SizedBox(width: 190,),
//                             CircleAvatar(
//                               backgroundColor: Colors.white,
//                               radius: 30,
//                               child: Container(
//                                 height: 30,
//                                 width: 30,
//                                 decoration: BoxDecoration(
//                                   image: DecorationImage(
//                                     image: AssetImage(
//                                         'assets/images/liverLogo.jpeg'),
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//
//                     ),
//                   ),
//                   SizedBox(height: 7,),
//                   GestureDetector(
//                     onTap: () {
//                       cubit.imageindex1 = 14;
//                     },
//                     child: Container(
//                       width: double.infinity,
//                       height: 50,
//                       decoration: BoxDecoration(
//                         color: Color.fromRGBO(135, 233, 151, 1),
//                         borderRadius: BorderRadius.circular(30),
//
//                       ),
//
//                       child: Padding(
//                         padding: const EdgeInsets.all(5.0),
//                         child: Row(
//                           children: [
//                             SizedBox(width: 5,),
//                             Text('Liverpoll',
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             SizedBox(width: 190,),
//                             CircleAvatar(
//                               backgroundColor: Colors.white,
//                               radius: 30,
//                               child: Container(
//                                 height: 30,
//                                 width: 30,
//                                 decoration: BoxDecoration(
//                                   image: DecorationImage(
//                                     image: AssetImage(
//                                         'assets/images/liverLogo.jpeg'),
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//
//                     ),
//                   ),
//                   SizedBox(height: 7,),
//                   GestureDetector(
//                     onTap: () {
//                       cubit.imageindex1 = 15;
//                     },
//                     child: Container(
//                       width: double.infinity,
//                       height: 50,
//                       decoration: BoxDecoration(
//                         color: Color.fromRGBO(135, 233, 151, 1),
//                         borderRadius: BorderRadius.circular(30),
//
//                       ),
//
//                       child: Padding(
//                         padding: const EdgeInsets.all(5.0),
//                         child: Row(
//                           children: [
//                             SizedBox(width: 5,),
//                             Text('Liverpoll',
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             SizedBox(width: 190,),
//                             CircleAvatar(
//                               backgroundColor: Colors.white,
//                               radius: 30,
//                               child: Container(
//                                 height: 30,
//                                 width: 30,
//                                 decoration: BoxDecoration(
//                                   image: DecorationImage(
//                                     image: AssetImage(
//                                         'assets/images/liverLogo.jpeg'),
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//
//                     ),
//                   ),
//                   SizedBox(height: 7,),
//                   GestureDetector(
//                     onTap: () {
//                       cubit.imageindex1 = 16;
//                     },
//                     child: Container(
//                       width: double.infinity,
//                       height: 50,
//                       decoration: BoxDecoration(
//                         color: Color.fromRGBO(135, 233, 151, 1),
//                         borderRadius: BorderRadius.circular(30),
//
//                       ),
//
//                       child: Padding(
//                         padding: const EdgeInsets.all(5.0),
//                         child: Row(
//                           children: [
//                             SizedBox(width: 5,),
//                             Text('Liverpoll',
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             SizedBox(width: 190,),
//                             CircleAvatar(
//                               backgroundColor: Colors.white,
//                               radius: 30,
//                               child: Container(
//                                 height: 30,
//                                 width: 30,
//                                 decoration: BoxDecoration(
//                                   image: DecorationImage(
//                                     image: AssetImage(
//                                         'assets/images/liverLogo.jpeg'),
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//
//                     ),
//                   ),
//                   SizedBox(height: 7,),
//                   GestureDetector(
//                     onTap: () {
//                       cubit.imageindex1 = 17;
//                     },
//                     child: Container(
//                       width: double.infinity,
//                       height: 50,
//                       decoration: BoxDecoration(
//                         color: Color.fromRGBO(135, 233, 151, 1),
//                         borderRadius: BorderRadius.circular(30),
//
//                       ),
//
//                       child: Padding(
//                         padding: const EdgeInsets.all(5.0),
//                         child: Row(
//                           children: [
//                             SizedBox(width: 5,),
//                             Text('Liverpoll',
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             SizedBox(width: 190,),
//                             CircleAvatar(
//                               backgroundColor: Colors.white,
//                               radius: 30,
//                               child: Container(
//                                 height: 30,
//                                 width: 30,
//                                 decoration: BoxDecoration(
//                                   image: DecorationImage(
//                                     image: AssetImage(
//                                         'assets/images/liverLogo.jpeg'),
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//
//                     ),
//                   ),
//                   SizedBox(height: 7,),
//                   GestureDetector(
//                     onTap: () {
//                       cubit.imageindex1 = 18;
//                     },
//                     child: Container(
//                       width: double.infinity,
//                       height: 50,
//                       decoration: BoxDecoration(
//                         color: Color.fromRGBO(135, 233, 151, 1),
//                         borderRadius: BorderRadius.circular(30),
//
//                       ),
//
//                       child: Padding(
//                         padding: const EdgeInsets.all(5.0),
//                         child: Row(
//                           children: [
//                             SizedBox(width: 5,),
//                             Text('Liverpoll',
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             SizedBox(width: 190,),
//                             CircleAvatar(
//                               backgroundColor: Colors.white,
//                               radius: 30,
//                               child: Container(
//                                 height: 30,
//                                 width: 30,
//                                 decoration: BoxDecoration(
//                                   image: DecorationImage(
//                                     image: AssetImage(
//                                         'assets/images/liverLogo.jpeg'),
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//
//                     ),
//                   ),
//                   SizedBox(height: 7,),
//                   GestureDetector(
//                     onTap: () {
//                       cubit.imageindex1 = 19;
//                     },
//                     child: Container(
//                       width: double.infinity,
//                       height: 50,
//                       decoration: BoxDecoration(
//                         color: Color.fromRGBO(135, 233, 151, 1),
//                         borderRadius: BorderRadius.circular(30),
//
//                       ),
//
//                       child: Padding(
//                         padding: const EdgeInsets.all(5.0),
//                         child: Row(
//                           children: [
//                             SizedBox(width: 5,),
//                             Text('Liverpoll',
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             SizedBox(width: 190,),
//                             CircleAvatar(
//                               backgroundColor: Colors.white,
//                               radius: 30,
//                               child: Container(
//                                 height: 30,
//                                 width: 30,
//                                 decoration: BoxDecoration(
//                                   image: DecorationImage(
//                                     image: AssetImage(
//                                         'assets/images/liverLogo.jpeg'),
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//
//                     ),
//                   ),
//
//
//
//                 ],*/
//               ),
// */
//             ),
//           );
//         }
//     );
//   }
// }
