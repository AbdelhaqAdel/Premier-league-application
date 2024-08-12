import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:premleague/Clean_arch/Core/error_handliing.dart';
import 'package:premleague/Clean_arch/Features/Stats/data/data_sources/Remote/StandingTableDataSource.dart';
import 'package:premleague/Clean_arch/Features/Stats/data/models/StandingsModel.dart';
import 'package:premleague/Clean_arch/Features/Stats/domain/repositories/standing_repo.dart';

class StandingRepoImpl extends StandingRepoAbs{
   final StandingTableDataSource standingDataSource;
   StandingRepoImpl({required this.standingDataSource});
  @override
  Future<Either<Failure, List<StandingsModel>>> fetchStandingTable() async{
    try{
      //Fetching data from local data source 
    var standingFromRepo=await standingDataSource.getStandingData();
    return right(standingFromRepo);
    }catch(e){
      if(e is DioError){
      return left( ServerFailuer.FromDioError(e));
      }
      return left(ServerFailuer(e.toString()));
    }
  }
   

}