part of 'matches_result_cubit.dart';

abstract class MatchesResultState {}

class FetchMatchesResultInitial extends MatchesResultState {}
class FetchMatchesResultLoadingState extends MatchesResultState {}
class FetchMatchesResultSuccessState extends MatchesResultState {
  final List<MatchesResultEntity>matchesResult;
  FetchMatchesResultSuccessState(this.matchesResult);
}
class FetchMatchesResultErrorState extends MatchesResultState {
  final String error;
  FetchMatchesResultErrorState(this.error);
}
