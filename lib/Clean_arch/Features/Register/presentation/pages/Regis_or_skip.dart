import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:premleague/Clean_arch/Config/Theme/Color.dart';
import 'package:premleague/Clean_arch/Core/Utils/Strings/app_text.dart';
import 'package:premleague/Clean_arch/Features/Login/presentation/pages/UserLogin.dart';
import '../../../../Core/Utils/components.dart';
import '../../../../../modules/archived_tasks/premleague/cubit/cubit/prem_cubit_cubit.dart';
import 'UserRegister.dart';
import 'SelectFavTeamScreen.dart';

class RegisOrSkip extends StatelessWidget {
  const RegisOrSkip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.registerOrSkipBckgColor,
        title: const Text(AppText.registerOrSkip,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),),
      ),
      body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 5, right: 8.0, left: 8, bottom: 8),
                child: GestureDetector(
                  onTap: (){NavigateTo(context, UserLogin());},
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: HexColor('#570861'),
                    ),
                    child: const Center(child: Text('Login',
                      style: TextStyle(
                        color:Colors.white,
                      ),
                    )),
                  ),
                ),

              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 5, right: 8.0, left: 8, bottom: 8),
                child: GestureDetector(
                  onTap: (){NavigateTo(context, UserRegister());},
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: HexColor('#570861'),
                    ),
                    child: const Center(child: Text('Register',
                      style: TextStyle(
                        color:Colors.white,
                      ),
                    )),
                  ),
                ),

              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 5, right: 8.0, left: 8, bottom: 8),
                child:
                GestureDetector(

                    onTap: (){
                      PremCubitCubit.get(context).getStandingsData();
                      NavigateTo(context, (const SelectBestTeamScreen()));
                      },
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:Colors.grey[500]?.withOpacity(.6),
                      ),
                      child: const Row(
                         children: [
                           SizedBox(width: 170,),
                          Center(child: Text('Later',
                            style: TextStyle(
                              fontSize: 15,
                              color:Colors.black,
                            ),
                          )),
                          Spacer(),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.keyboard_double_arrow_right),
                          )
                        ],
                      ),
                    ),
                  ),

              ),
            ],
          ),
      ),
    );
  }
}
