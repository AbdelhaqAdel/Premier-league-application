import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:premleague/Clean_arch/Core/error_handliing.dart';
import 'package:premleague/Clean_arch/Features/Latest/data/data_sources/matches_resault_data_source.dart';
import 'package:premleague/Clean_arch/Features/Latest/data/data_sources/matches_result_local_data_source.dart';
import 'package:premleague/Clean_arch/Features/Latest/domain/entities/matches_result_entity.dart';
import '../../domain/repositories/matches_resault_repo.dart';

class MatchesResultRepoImpl extends MatchesResultRepo{
 final MatchesResultRemoteDataSource matchesResultDataSource;
 final MatchesResultLocalDataSource matchesResultLocalDataSource;
  MatchesResultRepoImpl(this.matchesResultDataSource,this.matchesResultLocalDataSource);
  @override
  Future<Either<Failure, List<MatchesResultEntity>>> fetchMatchesResult() async{
   try {
     List<MatchesResultEntity>cachedMatchesResult = await matchesResultLocalDataSource
         .getMatchesResultFromLocalDataSource();
     if(cachedMatchesResult.isNotEmpty){
       return right(cachedMatchesResult);
     }
     List<MatchesResultEntity>matchesResult = await matchesResultDataSource
         .getMatchesResultFromDataSource();
     return right(matchesResult);
   }catch(e){
     if(e is DioError){
       return left(ServerFailure.fromDioError(e));
     }else{
       return left(ServerFailure(e.toString()));
     }
   }
  }

//  static _MatchesResultRepoImpl(matchesResultDataSource){} //private constructor to don not get instance from it
//
// static MatchesResultRepoImpl? instance;
//  static MatchesResultRepoImpl getInstance(){
//   if(instance==null){return  _MatchesResultRepoImpl(matchesResultDataSource);}
//   return instance!;
//  }



}

