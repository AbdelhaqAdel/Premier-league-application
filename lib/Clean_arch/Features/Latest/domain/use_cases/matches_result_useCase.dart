// any action or method the user do it i make use case to implement the method of this action
// all functions in repo have use case .
import 'package:dartz/dartz.dart';
import 'package:premleague/Clean_arch/Features/Latest/domain/repositories/matches_resault_repo.dart';

import '../../../../Core/error_handliing.dart';
import '../entities/matches_result_entity.dart';

class FetchMatchesResultUseCase extends UseCase<List<MatchesResultEntity>,NoParam>{
  final MatchesResultRepo matchesResultRepo;
  FetchMatchesResultUseCase(this.matchesResultRepo);
  @override
  Future<Either<Failure,List<MatchesResultEntity>>> call([NoParam? param])async{
   return await matchesResultRepo.fetchMatchesResult();
  }
}

abstract class UseCase<generateType,Param>{
  Future<Either<Failure,generateType>> call([Param param] );
}

class NoParam{}