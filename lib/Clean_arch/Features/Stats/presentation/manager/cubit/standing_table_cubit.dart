import 'package:bloc/bloc.dart';
import 'package:premleague/Clean_arch/Features/Stats/data/models/StandingsModel.dart';
import 'package:premleague/Clean_arch/Features/Stats/data/repositories/standing_repo.dart';
part 'standing_table_state.dart';

class StandingTableCubit extends Cubit<StandingTableState> {
  StandingTableCubit(this.standingRepo) : super(StandingTableInitial());

  final StandingRepoImpl standingRepo;
  Future<void>fetchStandingTable()async{
    emit(FetchStandingTableLoading());
    var result= await standingRepo.fetchStandingTable();
    result.fold(
      (error) => FetchStandingTableError(error.message),
     (standing) {
      //standing.forEach((element) {print(element.teamName);},);
       emit(FetchStandingTableSuccess(standing));
  });  
  }
}
