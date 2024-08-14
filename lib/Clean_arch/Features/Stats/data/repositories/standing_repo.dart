import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:premleague/Clean_arch/Core/error_handliing.dart';
import 'package:premleague/Clean_arch/Features/Stats/data/data_sources/Remote/StandingTableDataSource.dart';
import 'package:premleague/Clean_arch/Features/Stats/data/models/StandingsModel.dart';
import 'package:premleague/Clean_arch/Features/Stats/domain/repositories/standing_repo.dart';
//handling the data from data source (handling errors) to user this data in manager(cubit)
class StandingRepoImpl extends StandingRepoAbs{

   final StandingTableDataSource standingDataSource;

   StandingRepoImpl({required this.standingDataSource});
  @override
  Future<Either<Failure, List<StandingsModel>>> fetchStandingTable() async{
    try{
      print('getting data from repo');
      //Fetching data from local data source 
     List<StandingsModel> standinFromRepo=await standingDataSource.getStandingData();
    //.then((value) {
      standinFromRepo.forEach((element) {
        print(element.teamName);
      },);
       return  right( standinFromRepo);
      //});
      
    }catch(e){
      if(e is DioError){
        print('error -----');
      return left( ServerFailuer.FromDioError(e));
      }
     print('Errorrrrr---------${e.toString()}');
      return left(ServerFailuer(e.toString()));
    }
  }
   

   //this method to get one instamce from StandingRepoImpl instead of using GetIt

  //  static _StandingRepoImpl(standingDataSource){} //private constructor to don not get instance from it 

  // static StandingRepoImpl? instance;
  //  static StandingRepoImpl getInstance(){
  //   if(instance==null){return  _StandingRepoImpl(standingDataSource);}
  //   return instance!;
  //  }

}