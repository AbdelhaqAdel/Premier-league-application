import 'package:bloc/bloc.dart';
import '../../../domain/entities/matches_result_entity.dart';
import '../../../domain/use_cases/matches_result_useCase.dart';
part 'matches_result_state.dart';

class MatchesResultCubit extends Cubit<MatchesResultState> {
  MatchesResultCubit(this.fetchMatchesResultUseCase) : super(FetchMatchesResultInitial());
  final FetchMatchesResultUseCase fetchMatchesResultUseCase;
  Future<void>fetchMatchesResultFromCubit()async{
    emit(FetchMatchesResultLoadingState());
    var result= await fetchMatchesResultUseCase.call();
    result.fold((error) {
      emit(FetchMatchesResultErrorState(error.message));
    },
        (matchesResult){
      // matchesResult.forEach((element) { print(element.homeNameE);});
      emit(FetchMatchesResultSuccessState(matchesResult));
            });
  }
}