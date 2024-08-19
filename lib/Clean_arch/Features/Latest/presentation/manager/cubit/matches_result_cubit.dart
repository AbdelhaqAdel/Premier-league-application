import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/matches_result_entity.dart';
import '../../../domain/use_cases/matches_result_useCase.dart';
part 'matches_result_state.dart';

class MatchesResultCubit extends Cubit<MatchesResultState> {
  MatchesResultCubit(this.fetchMatchesResultUseCase) : super(FetchMatchesResultInitial());
   // static MatchesResultCubit get(context) => BlocProvider.of(context);
  static List<MatchesResultEntity>?matchesResults;
  final FetchMatchesResultUseCase fetchMatchesResultUseCase;
  Future<void>fetchMatchesResultFromCubit()async{
    emit(FetchMatchesResultLoadingState());
    var result= await fetchMatchesResultUseCase.call();
    result.fold((error) {
      emit(FetchMatchesResultErrorState(error.message));
    },
        (matchesResult){
            matchesResults=matchesResult;
      // matchesResult.forEach((element) { print(element.homeNameE);});
      emit(FetchMatchesResultSuccessState(matchesResult));
            });
  }
}