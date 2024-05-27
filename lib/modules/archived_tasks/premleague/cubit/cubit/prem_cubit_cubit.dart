import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:meta/meta.dart';
import 'package:premleague/Clean_arch/Features/Latest/presentation/pages/LatestScreen.dart';
import 'package:premleague/Clean_arch/Features/Score/presentation/pages/Score.dart';
import 'package:premleague/Clean_arch/Features/Stats/presentation/pages/StatsScreen.dart';
import 'package:premleague/Clean_arch/Features/FavTeam/presentation/pages/Fav_Teams.dart';
import 'package:premleague/Clean_arch/Features/Settings/presentation/pages/settingsScreen.dart';
import '../../../../../model/CardsModel.dart';
import '../../../../../model/MatchesResultsModel.dart';
import '../../../../../model/MatchsTimeModel.dart';
import '../../../../../model/PlayerAssistsModel.dart';
import '../../../../../model/ScorersModel.dart';
import '../../../../../model/StandingsModel.dart';
import '../../../../../model/user/shop_model/LoginShopModel.dart';
import '../../../../../model/user/shop_model/RegisterModel.dart';
import '../../../../../model/user/shop_model/SearchModel/SearchModel.dart';
import '../../../../../shared/component/Constants.dart';
import '../../../../../shared/network/endPoints.dart';
import '../../../../../shared/network/remote/DioHelper.dart';
part 'prem_cubit_state.dart';

class PremCubitCubit extends Cubit<PremCubitState> {
  PremCubitCubit() : super(PremCubitInitial());
  static PremCubitCubit get(context) => BlocProvider.of(context);
  int currentIndex=0;
  int videoIndex=0;
  int imageindex=0;
  int imageindex1=0;
  bool isLiverSelected=true;
  String? Tokenn;
  String?regTokenn;
  String? selectedImage;
  String?selectedTeamName;
  List<BottomNavigationBarItem>bottomItems=[
    BottomNavigationBarItem(
      icon: Icon(Icons.article_outlined),
      label: 'Latest'
      ),
    BottomNavigationBarItem(
        icon: Icon(Icons.center_focus_strong_outlined),
        label: 'Fav Team'
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.slow_motion_video_outlined,size: 25,),
      label: 'Score',
     // backgroundColor: Colors.black,
      ),
    BottomNavigationBarItem(
      icon: Icon(Icons.assessment_outlined),
      label: 'Stats'
      ),
    BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        label: 'Settings'
    ),
  ];
  List<Widget>Screens=[
    test(),
    FavTeam(),
    SoccerMatch(),
    Stats(),
    settingss(),
  ];
  void ChangeBottomNavBar (int index){
    currentIndex=index;
    emit(PremBottomNavBarState());
  }
  List<Map>Favteam=[
    {
    'image':'assets/images/arsenal.jpeg',
    'teamName': 'Arsenal',
    },
    {
      'image':'assets/images/liverLogo.jpeg',
      'teamName': 'Liverpoll',
    },
    {
      'image':'assets/images/mancity.jpeg',
      'teamName': 'Man city',
    },
    {
      'image':'assets/images/unitedlogo.jpeg',
      'teamName': 'Man united',
    },
    {
      'image':'assets/images/chelsea.jpeg',
      'teamName': 'Chelsea',
    },
  ];

  void changefavteam(index){
    imageindex=index;
    emit(changefavteamimageState());
  }

  List <Map>newsList = [
    {
      'image': 'https://resources.premierleague.com/photos/2023/05/23/fd126160-693f-4f64-afad-4bb51478303f/Marcus-Rashford.jpg?width=930&height=620',
      'title': 'Rashford returns to Man Utd training',
      'text': 'Rashford is healed and fully functional to start rolling into the premier league matches again',
    },
    {
      'image': 'https://resources.premierleague.com/photos/2023/05/23/ed47c2aa-7f88-4548-8260-2680d69c2f40/XaZvrdw3.jpg?width=500&height=333',
      'title': 'See Man City title celebrations like never before',
      'text': 'See Man City title celebrations like never before',
    },
    {
      'image': 'https://resources.premierleague.com/photos/2023/05/23/73e53515-de2f-473b-9cbc-bc096cc6bec8/De-Zerbi-and-Pep.jpg?width=500&height=380',
      'title': 'Guardiola: De Zerbi is one of the most influential coaches',
      'text': 'Guardiola: De Zerbi is one of the most influential coaches',
    },
    {
      'image': 'https://resources.premierleague.com/photos/2023/05/23/e33f00f9-65a7-4b97-8b1e-7f9f898f1084/Roberto-Firmino.jpg?width=930&height=620',
      'title': 'The Scout on why Brazilian can enjoy a successful send-off for Liverpool against Southampton',
      'text': 'The Scout on why Brazilian can enjoy a successful send-off for Liverpool against Southampton',
    },
    {
      'image': 'https://resources.premierleague.com/photos/2023/05/23/2bccf98f-2678-4595-84a6-ee542581da2b/1RELEGATION-BATTLE-NEW.jpg?width=930&height=620',
      'title': 'What each club needs on the final day',
      'text': 'ssdfgdjghkjhldjs',
    },

  ];

  List <Map>VideosList = [
    {
      'image': 'https://cdn.dnaindia.com/sites/default/files/styles/full/public/2018/05/06/679510-manchester-city-reuters.jpg',
      'title': 'See Man City title celebrations like never before',
      'video': 'https://youtu.be/ilkHg8ghVSs?list=PLQ_voP4Q3cfeT5QqIr7RA7BEc2zGMn0nl',
    },
    {
      'image': 'https://i2-prod.leeds-live.co.uk/sport/leeds-united/article19991434.ece/ALTERNATES/s1200/0_Untitled-design.jpg',
      'title': 'West Ham 3-1 Leeds United | The Hammers Comeback With A Vengeance | Premier League',
      'video': 'https://youtu.be/nxR-fMdbLvo?list=PLQ_voP4Q3cfeT5QqIr7RA7BEc2zGMn0nl',
    },
    {
      'image': 'https://mrfixitstips.co.uk/wp-content/uploads/2020/11/MRF2020_BrightonvSouthampton-1038x519.jpg',
      'title': 'Albion 3 Southampton 1',
      'video': 'https://youtu.be/bisnX6Zipm0?list=PLQ_voP4Q3cfeT5QqIr7RA7BEc2zGMn0nl',
    },
    {
      'image': 'https://mrfixitstips.co.uk/wp-content/uploads/2023/05/MRF2023_TottenhamvBrentford.jpg',
      'title': 'Tottenham 1-3 Brentford | Extended Premier League ',
      'video': 'https://youtu.be/HbUPlLslnPs?list=PLQ_voP4Q3cfeT5QqIr7RA7BEc2zGMn0nl',
    },
    {
      'image': 'https://mrfixitstips.co.uk/wp-content/uploads/2023/05/MRF2023_NottinghamForestvArsenal.jpg',
      'title': ' PREMIER LEAGUE STATUS SECURED | FOREST 1-0 ARSENAL',
      'video': 'https://youtu.be/8vud6pSMMOo?list=PLQ_voP4Q3cfeT5QqIr7RA7BEc2zGMn0nl',
    },
  ];

  void ChangeVideos (int index){
    videoIndex=index;
    emit(ChangeVideosState());
  }

  List<MatchTimeModel>matchsTime=[];

  void getMatchesTimeData(){
    emit(MatchsTimeLoadingState());
    //  ss.getAllScorers();
    DioHelper2.GetData(
      EndPoint: MATCHSTIME,
    ).then((value) {
      if(value.statusCode==200){
print(value.data);
        List Json = value.data['response'];

        for (var element in Json) {
          matchsTime.add(MatchTimeModel.fromJson(element));
        }
        for(var ss in matchsTime) {
          print(ss?.date.toString());
        }
        emit(MatchsTimeSuccessState(matchsTime));
      }}).catchError((onError){
      print(onError.toString());
      emit(MatchsTimeErrorState());
    });
  }

  List<MatchesResultsModel>matchesResults=[];
  void getMatchesResultsData(){
    emit(MatchesResultsLoadingState());
    //  ss.getAllScorers();
    DioHelper2.GetData(
      EndPoint: MATCHESRESULTS,
    ).then((value) {
      if(value.statusCode==200){

        List Json = value.data['response'];

        for (var element in Json) {
          matchesResults.add(MatchesResultsModel.fromJson(element));
        }
        emit(MatchesResultsSuccessState(matchesResults));
      }}).catchError((onError){
      print(onError.toString());
      emit(MatchesResultsErrorState());
    });
  }

  List<StandingsModel>standings=[];
  void getStandingsData(){
    emit(premStatesLoadingState());
    //  ss.getAllScorers();
    DioHelper.GetData(
      EndPoint: STANDINGS,
    ).then((value) {
      if(value.statusCode==200){
        // var Json= json.decode(jsonEncode(value.data));

        List Json = value.data['standings'][0]['table'];

        for (var element in Json) {
          standings.add(StandingsModel.fromJson(element));
        }
        emit(premStatesSuccessState(standings));
      }}).catchError((onError){
      print(onError.toString());
      emit(premStatesErrorState());
    });
  }

  List<CardsModel>cards=[];
  void getCardsData(){
    emit(CardsLoadingState());
    //  ss.getAllScorers();
    DioHelper2.GetData(
      EndPoint: CARDS,
    ).then((value) {
      if(value.statusCode==200){

        List Json = value.data['response'];

        for (var element in Json) {
          cards.add(CardsModel.fromJson(element));

        }
        // for(var card in cards) {
        //   print(card.player?.name);
        // }
        emit(CardsSuccessState(cards));
      }}).catchError((onError){
      print(onError.toString());
      emit(CardsErrorState());
    });
  }


  List<ScorersModel>scorers=[];
  void getScorrersData(){
    emit(ScorersLoadingState());
    //  ss.getAllScorers();
    DioHelper.GetData(
      EndPoint: SCORERS,
    ).then((value) {
      if(value.statusCode==200){
        List Json = value.data['scorers'];
        for (var element in Json) {
          scorers.add(ScorersModel.fromJson(element));
        }
        emit(ScorersSuccessState(scorers));
      }}).catchError((onError){
      print(onError.toString());
      emit(ScorersStatesErrorState());
    });
  }

  List<assistsModel>assists=[];
  void getAssistsData(){
    emit(PlayerAssistLoadingState());
    //  ss.getAllScorers();
    DioHelper2.GetData(
      EndPoint: ASSISTS,
    ).then((value) {
      if(value.statusCode==200){
        List Json = value.data['response'];
        for (var element in Json) {
          assists.add(assistsModel.fromJson(element));
        }
        // for(var scorer in assists) {
        //   print(scorer.player?.name);
        // }

        emit(PlayerAssistSuccessState(assists));
      }}).catchError((onError){
      print(onError.toString());
      emit(PlayerAssistErrorState());
    });
  }

  /*-----------------------LOGIN-----------------------*/
  bool isLogin=false;
  IconData suffix=Icons.visibility_outlined;
  bool ispassowrdShown=true;
  void IsUserLogin({
    required bool isLogin,
}){
    this.isLogin=isLogin;
    emit(isUserLoginState());
  }

  shopLoginModel ?loginModel;
  void UserLogin({
    required String email,
    required String password,
  }){
    emit(shopLoginLoadingState());
    DioHelper3.PostData(
        url: LOGIN,
        data:{
          'email':email,
          'password':password,
        }).then((value) {
      loginModel= shopLoginModel.fromJson(value.data);
      emit(shopLoginSuccessState(loginModel!));
      print(value.data);
    }).catchError((Error){
      print(Error.toString());
      emit(shopLoginErrorState(Error.toString()));
    });
  }
  void changePasswordVisibility(){
    ispassowrdShown=!ispassowrdShown;

    suffix=ispassowrdShown?Icons.visibility_off_outlined:Icons.visibility_outlined;
    emit(shopLoginIsbasswordState());
  }
  // shopLoginModel ?userData;
  // void GetUserData({
  //   required String email,
  //   required String password,
  // }){
  //   emit(shopLoginLoadingState());
  //   DioHelper3.PostData(
  //       url: LOGIN,
  //       data:{
  //         'email':email,
  //         'password':password,
  //       }).then((value) {
  //     loginModel= shopLoginModel.fromJson(value.data);
  //     emit(shopLoginSuccessState(loginModel!));
  //     print(value.data);
  //   }).catchError((Error){
  //     print(Error.toString());
  //     emit(shopLoginErrorState(Error.toString()));
  //   });
  // }


  UserProfileModel ? getuserData;
  void GetUserProfile({
    required String? token,
  }) {
    DioHelper3.GetData(url: PROFILE, token: Tokenn).then((value) {
      emit(shopGetUserLoadingState());
      print('Tokenn is ${Tokenn}');
      getuserData=UserProfileModel.fromJson(value?.data);
      print(value?.data);
      // print(homedata?.status);
      print('//////////');
      print('User Name is ${getuserData?.data?.name}');
      print('user image is ${getuserData?.data?.image}');
      emit(shopGetUserLSuccessState(getuserData!));
    }).catchError((error) {
      print(error.toString());
      emit(shopGetUserErrorState());
    });
  }

  /*-------------------------*/
  UserRegisterModel ?registerModel;
  void UserRegister({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String image,

  }){
    emit(shopRegisterLoadingState());
    DioHelper3.PostData(
        url: REGISTER,
        data:{
          'name':name,
          'email':email,
          'password':password,
          'phone':phone,
          'image':image
        }).then((value) {
      registerModel= UserRegisterModel.fromJson(value.data);
      emit(shopRegisterSuccessState(registerModel!));
      print(value.data);
    }).catchError((Error){
      print(Error.toString());
      emit(shopRegisterErrorState());
    });
  }

  /*--------------------*/
  void UserUppdate({
    required String name,
    required String email,
    required String phone,
  }){
    emit(shopUpdateLoadingState());
    DioHelper3.PutData(
      token: Tokenn,
        url: UPDATE,
        data:{
          'name':name,
          'email':email,
          'phone':phone,
        }).then((value) {
          print('RegToken is from cubit ${Tokenn}');
          getuserData= UserProfileModel.fromJson(value.data);
      print(value.data);

      emit(shopUpdateSuccessState(getuserData!));
    }).catchError((Error){
      print(Error.toString());
      emit(shopUpdateErrorState(Error.toString()));
    });
  }

  /*-------------------------------------*/
  SearchModel? searchModel;

  void SearchProduct({
    required String Text,
  }){
    emit(shopSearchLoadingState());
    DioHelper3.PostData(
        token: Tokenn,
        url: SEARCH,
        data:{
          'text':Text,
        }).then((value) {
      print('RegToken is from cubit in Search ${Tokenn}');
      searchModel= SearchModel.fromJson(value.data);
      print(value.data);

      emit(shopSearchSuccessState(searchModel!));
    }).catchError((Error){
      print(Error.toString());
      emit(shopSearchErrorState(Error.toString()));
    });
  }


}

