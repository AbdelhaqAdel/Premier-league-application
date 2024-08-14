part of 'standing_table_cubit.dart';


abstract class StandingTableState {}

class StandingTableInitial extends StandingTableState {}

class FetchStandingTableLoading extends StandingTableState {}

class FetchStandingTableSuccess extends StandingTableState {
  final List<StandingsModel> standing;
  FetchStandingTableSuccess(this.standing);
}

class FetchStandingTableError extends StandingTableState {
  final String errorMessage;
  FetchStandingTableError(this.errorMessage);
}
