import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:premleague/Clean_arch/Core/Utils/Constants.dart';
import 'package:premleague/Clean_arch/Features/Login/presentation/pages/UserLogin.dart';
import 'package:premleague/Clean_arch/Features/Register/presentation/pages/SelectFavTeamScreen.dart';
import '../../../Profile/presentation/pages/UserProfile.dart';
import '../../../Register/presentation/pages/UserRegister.dart';
import '../../../../../modules/archived_tasks/premleague/cubit/cubit/prem_cubit_cubit.dart';
import '../../../../Core/Utils/components.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    var scaffoldKey = GlobalKey<ScaffoldState>();

    return BlocConsumer<PremCubitCubit, PremCubitState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        PremCubitCubit cubit = PremCubitCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.transparent,
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Settings',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: GestureDetector(
                      onTap: (){
                        print('token from settings is ${cubit.tokenn}');
                        //print(CacheHelper.getAllData(key: 'token'));
                        print(cubit.isLogin);
                        cubit.getUserProfile(token: cubit.tokenn);
                        navigateTo(context, cubit.isLogin?UserProfile():UserRegister());

                      },
                      child: const Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.blue,
                            radius:20,
                            //child: Image.network(cubit.loginModel),
                          ),
                          SizedBox(width: 15,),
                          Text('Manage your account or register',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                          ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  myDevider(),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0,right: 15),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: Row(
                        children: [
                          Text(
                            'Change App Mode',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const Spacer(),
                          /* IconButton(
                            onPressed: (){
                              appcubit.get(context).changeAppMode();
                             },
                           icon: Icon(Icons.brightness_4_outlined,
                             size: 50,
                            ),),*/
                          Padding(
                            padding: const EdgeInsets.only(right: 27.0),
                            child: GestureDetector(
                                onTap: () {
                                  print( PremCubitCubit.get(context).selectedImage);
                                },
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.topRight,
                                        colors: [
                                        Color(0xFF17203A),
                                          Colors.grey,
                                        ]),
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                ),
                              ),
                          ),

                        ],
                      ),
                    ),
                  ),
                  myDevider(),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0,right: 15),
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      child: GestureDetector(
                        onTap: (){
                          navigateTo(context, SelectBestTeamScreen());
                        },
                        child: Row(
                          children: [
                            Text(
                              'your best team',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const Spacer(),
                            /* IconButton(
                              onPressed: (){
                                appcubit.get(context).changeAppMode();
                               },
                             icon: Icon(Icons.brightness_4_outlined,
                               size: 50,
                              ),),*/
                            Padding(
                              padding: const EdgeInsets.only(right: 27.0),
                              child: GestureDetector(
                                onTap: () {
                                },
                                child: Container(
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
                              ),
                            ),
                            /*
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.grey[300],
                                          borderRadius: BorderRadius.circular(15),

                                        ),
                                        width: 150,
                                        height: 100,

                                        child: Center(
                                          child: Column(
                                            children: [ ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 15,),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.grey[300],
                                          borderRadius: BorderRadius.circular(15),

                                        ),
                                        width: 150,
                                        height: 100,

                                        child: Center(
                                          child: Column(
                                            children: [    ],
                                          ),
                                        ),
                                      ),
                                   */

                          ],
                        ),
                      ),
                    ),
                  ),
                  myDevider(),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0,right: 15),
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      child: Row(
                        children: [
                          Text(
                           'Rate us',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          Spacer(),
                          /* IconButton(
                            onPressed: (){
                              appcubit.get(context).changeAppMode();
                             },
                           icon: Icon(Icons.brightness_4_outlined,
                             size: 50,
                            ),),*/
                          Padding(
                            padding: const EdgeInsets.only(right: 27.0),
                            child: GestureDetector(
                              onTap: () {
                              },
                              child:  Container(
                                height: 30,
                                width: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                //    color: Colors.red,
                                  ),
                                child: Image.network('https://creazilla-store.fra1.digitaloceanspaces.com/emojis/46760/white-question-mark-emoji-clipart-md.png'),
                              )
                            ),
                          ),
                          /*
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius: BorderRadius.circular(15),

                                      ),
                                      width: 150,
                                      height: 100,

                                      child: Center(
                                        child: Column(
                                          children: [ ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 15,),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius: BorderRadius.circular(15),

                                      ),
                                      width: 150,
                                      height: 100,

                                      child: Center(
                                        child: Column(
                                          children: [    ],
                                        ),
                                      ),
                                    ),
                                 */

                        ],
                      ),
                    ),
                  ),
                     myDevider(),

                       Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: GestureDetector(
                      onTap: (){
                       logOut(context);
                      },
                      child:
                           Text('Logout',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.sp,
                          ),
                          ),
                        
                    ),
                  ),
                ],
              ),
            ),
          ),

        );
      },
    );
  }
}
/* floatingActionButton: FloatingActionButton.large(
            backgroundColor: Colors.white,

            onPressed: () {
              if (isBottomSheetShown) {

              //  Navigator.pop(context);
              //  isBottomSheetShown = false;
               // cubit.changefavteam(cubit.imageindex);
              } else {
                ScaffoldKey.currentState
                    ?.showBottomSheet(
                      (context) => SingleChildScrollView(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          width: double.infinity,
                          height: 500,
                          // color: Colors.white,

                          child:
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Container(
                                      height: 20,
                                      child: Text(
                                        'Select your best team',
                                        style:
                                            Theme.of(context).textTheme.bodyLarge,
                                      )),
                                ),
                             /*  ListView.separated(
                                  //   scrollDirection: Axis.horizontal,
                                  // physics: BouncingScrollPhysics(),
                                  itemBuilder: (context, index) =>matchstime(context),
                                    //  cubit.BuildTeamItem(Favteam[index], context),
                                  separatorBuilder: (context, index) => SizedBox(
                                    height:15,
                                  ),
                                  itemCount: 5,
                                ),*/
                                /*
                    Expanded(child:
                    GestureDetector(
                        onTap: () {
                          cubit.imageindex=0;
                        },
                        child: Container(
                          width: double.infinity,
                          height: 25,
                          decoration: BoxDecoration(
                            color:HexColor('#DA20A9'),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              children: [
                                SizedBox(width: 5),
                                 Text('Arsenal',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            ),
                                 SizedBox(width: 200,),
                                 CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 30,
                                  child:  Container(
                                    height: 30,
                                    width: 30,
                                  decoration: BoxDecoration(
                                   image: DecorationImage(
                                  image: AssetImage('assets/images/arsenal.jpeg'),
                                     fit: BoxFit.cover,
            ),
          ),
                                  ),
                                 ),
                              ],
                            ),
                          ),
                        ),
                    ),
                    ),
                    */
                                // SizedBox(height: 5,),
                                /*    Expanded(child:
                        GestureDetector(
                onTap: () {
                  cubit.imageindex=1;
                  cubit.isLiverSelected=true;
                },
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            color:HexColor('#DA20A9'),
                            borderRadius: BorderRadius.circular(30),

                          ),

                     child:Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              children: [
                                SizedBox(width: 5,),
                                 Text('Liverpoll',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            ),
                                 SizedBox(width: 190,),
                                 CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 30,
                                  child:  Container(
                                    height: 30,
                                    width: 30,
                                  decoration: BoxDecoration(
                                   image: DecorationImage(
                                  image: AssetImage('assets/images/liverLogo.jpeg'),
                                     fit: BoxFit.cover,
            ),
          ),
                                  ),
                                 ),
                              ],
                            ),
                          ) ,

                        ),
                    ),
                    ),
                    SizedBox(height: 5,),
                    Expanded(child:
                    GestureDetector(
                            onTap: () {
                  cubit.imageindex=2;
                  cubit.isLiverSelected=false;
                },

                        child: Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            color:HexColor('#DA20A9'),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                children: [
                                  SizedBox(width: 5,),
                                   Text('Man City',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              ),
                                   SizedBox(width: 190,),
                                   CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 30,
                                    child:  Container(
                                      height: 30,
                                      width: 30,
                                    decoration: BoxDecoration(
                                     image: DecorationImage(
                                    image: AssetImage('assets/images/mancity.jpeg'),
                                       fit: BoxFit.cover,
                                  ),
                                ),
                                    ),
                                   ),
                                ],
                              ),
                            ),
                        ),
                    ),
                    ),
                    SizedBox(height: 5,),
                        Expanded(child:
                        GestureDetector(
                          onTap: () {
                            cubit.imageindex=3;
                          },

                          child: Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              color:HexColor('#DA20A9'),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                children: [
                                  SizedBox(width: 5,),
                                  Text('Man United',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 168,),
                                  CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 30,
                                    child:  Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage('assets/images/unitedlogo.jpeg'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        ),
                    SizedBox(height:5),
                        Expanded(child:
                        GestureDetector(
                          onTap: () {
                            cubit.imageindex=4;
                          },

                          child: Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              color:HexColor('#DA20A9'),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                children: [
                                  SizedBox(width: 5,),
                                  Text('Chelsea',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 200,),
                                  CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 30,
                                    child:  Container(
                                      height: 28,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage('assets/images/chelsea.jpeg'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        ),*/
                              /*  defaultTextButton(
                                    function: () {
                                      NavigateTo(context, favTeamScreen);
                                    },
                                    text: 'All Teams'),*/
                              ],
                            ),
                          ),

                        ),
                      ),
                    )
                    .closed
                    .then((value) {
                  isBottomSheetShown = false;
                 // cubit.changefavteam(cubit.imageindex);
                });
                isBottomSheetShown = true;
              }
              /*ScaffoldKey.currentState!.showBottomSheet(
              (context) =>Container(
                color: Colors.white,
                child: Text('data') ),
              elevation: 20,
              ).closed.then((value) {
                 // cubit.ChangeBottomSheetState(isShow: false, icon: Icons.edit,);
              });
           // cubit.ChangeBottomSheetState(isShow: true, icon: Icons.add,);
*/
            },

            child: Container(
              height: 50,
             // color: Colors.red,
              //  child: Image(image:AssetImage('${cubit.Favteam["image"]}'),)
            ),
            //  Image(image: AssetImage('assets/images/liverLogo.jpeg')))  ,//Icon(cubit.fabIcon),,

/*if(cubit.isBottomSheetShown){
              if(formKey.currentState!.validate()){
               cubit.insertToDatabase(
                  title: titleControler.text,
                   time: timeControler.text,
                    date: DateControler.text);
           /*  cubit. insertToDatabase (
                title: titleControler.text,
                time: timeControler.text,
                date: DateControler.text,
              ).then((value) {
           // cubit.getDataFromDatabase(database);
             Navigator.pop(context);
               // cubit.tasks=value;
              /*setState(() {
                isBottomSheetShown=false;
                fabIcon=Icons.edit;

                print('database opened');
              });*/
              });*/


              }
            }
            else{*/
          ),*/