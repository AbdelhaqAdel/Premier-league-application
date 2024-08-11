part of '../../../../../modules/archived_tasks/premleague/cubit/cubit/prem_cubit_cubit.dart';

@immutable
abstract class PremCubitState {}

class PremCubitInitial extends PremCubitState {}
class PremBottomNavBarState extends PremCubitState{}
class changefavteamimageState extends PremCubitState{}
class changefavteamimageState1 extends PremCubitState{}
class ChangeVideosState extends PremCubitState{}
/*---------------------------------------------*/
class MatchsTimeLoadingState extends PremCubitState {}
class MatchsTimeSuccessState extends PremCubitState {
  List <MatchTimeModel> matchsTime;
  MatchsTimeSuccessState(this.matchsTime);
}
class MatchsTimeErrorState extends PremCubitState {}
/*----------------------------------------------*/
class MatchesResultsLoadingState extends PremCubitState {}
class MatchesResultsSuccessState extends PremCubitState {
  List <MatchesResultsModel> matchsResults;
  MatchesResultsSuccessState(this.matchsResults);
}
class MatchesResultsErrorState extends PremCubitState {}
/*---------------------------------------------------*/

class premStatesLoadingState extends PremCubitState {}

class premStatesSuccessState extends PremCubitState {
  List <dynamic> standings;
  premStatesSuccessState(this.standings);
}
class premStatesErrorState extends PremCubitState {}
/*-------------------------------------------------*/
class CardsLoadingState extends PremCubitState {}
class CardsSuccessState extends PremCubitState {
  List <dynamic> cards;
  CardsSuccessState(this.cards);
}
class CardsErrorState extends PremCubitState {}
/*------------------------------------------------*/
class ScorersScreenInitial extends PremCubitState {}

class ScorersLoadingState extends PremCubitState {}

class ScorersSuccessState extends PremCubitState {
  List <dynamic> scorers;
  ScorersSuccessState(this.scorers);
}
class ScorersStatesErrorState extends PremCubitState {}
/*--------------------------------------------------*/
class PlayerAssistLoadingState extends PremCubitState {}
class PlayerAssistSuccessState extends PremCubitState {
  List <dynamic> assists;
  PlayerAssistSuccessState(this.assists);
}
class PlayerAssistErrorState extends PremCubitState {}
/*-------------------------------------------------*/
class SoccerLoadingState extends PremCubitState {}
class SoccerSuccessState extends PremCubitState {
  List <dynamic> Soccer;
  SoccerSuccessState(this.Soccer);
}
class SoccerErrorState extends PremCubitState {}
/*----------------------------LOGIN------------*/
class shopLoginInitialState extends PremCubitState {}

class shopLoginLoadingState extends PremCubitState {}

class shopLoginSuccessState extends PremCubitState {
  final LoginModel loginmodel;

  shopLoginSuccessState(this.loginmodel);

}

class shopLoginErrorState extends PremCubitState {
  String? error;
  shopLoginErrorState(this.error);
}
class isUserLoginState extends PremCubitState {}
class shopLoginIsbasswordState extends PremCubitState {}

/*-------------------------------------------*/
class premTeamsLoadingState extends PremCubitState {}

class premTeamsSuccessState extends PremCubitState {
  List <dynamic> standings;
  premTeamsSuccessState(this.standings);
}
class premTeamsErrorState extends PremCubitState {}

/*-----------------------------------------------*/
class shopGetUserLoadingState extends PremCubitState {

  shopGetUserLoadingState();
}
class shopGetUserLSuccessState extends PremCubitState {
  final UserProfileModel userData;

  shopGetUserLSuccessState(this.userData);
}
class shopGetUserErrorState extends PremCubitState {

  shopGetUserErrorState();
}
/*----------------------------------------------*/
class shopRegisterLoadingState extends PremCubitState {}

class shopRegisterSuccessState extends PremCubitState {
  final UserRegisterModel userModel;

  shopRegisterSuccessState(this.userModel);
}
class shopRegisterErrorState extends PremCubitState {
  shopRegisterErrorState();
}
/*----------------------*/


class shopUpdateLoadingState extends PremCubitState {}

class shopUpdateSuccessState extends PremCubitState {
  final UserProfileModel loginmodel;

  shopUpdateSuccessState(this.loginmodel);

}

class shopUpdateErrorState extends PremCubitState {
  String? error;
  shopUpdateErrorState(this.error);
}

/*--------------------Search--------------------*/
class shopSearchLoadingState extends PremCubitState {}

class shopSearchErrorState extends PremCubitState {
  String? error;
  shopSearchErrorState(this.error);
}