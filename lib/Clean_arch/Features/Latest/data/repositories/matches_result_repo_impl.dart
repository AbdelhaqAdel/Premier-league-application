import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:premleague/Clean_arch/Core/error_handliing.dart';
import 'package:premleague/Clean_arch/Features/Latest/data/data_sources/matches_resault_data_source.dart';

import 'package:premleague/Clean_arch/Features/Latest/domain/entities/matches_resault_entity.dart';

import '../../../../Core/remote/DioHelper.dart';
import '../../../../Core/remote/endPoints.dart';
import '../../domain/repositories/matches_resault_repo.dart';

class MatchesResultRepoImpl extends MatchesResultRepo{
 final MatchesResultDataSource matchesResultDataSource;
  MatchesResultRepoImpl(this.matchesResultDataSource);
  @override
  Future<Either<Failure, List<MatchesResultEntity>>> fetchMatchesResult() async{
   try {
     List<MatchesResultEntity>matchesResult = await matchesResultDataSource
         .getMatchesResultFromDataSource();
     return right(matchesResult);
   }catch(e){
     if(e is DioError){
       return left(ServerFailuer.FromDioError(e));
     }else{
       return left(ServerFailuer(e.toString()));
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

