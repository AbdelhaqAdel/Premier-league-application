import 'package:get_it/get_it.dart';
import 'package:premleague/Clean_arch/Features/Stats/data/data_sources/Remote/StandingTableDataSource.dart';
import 'package:premleague/Clean_arch/Features/Stats/data/repositories/standing_repo.dart';
  final getIt=GetIt.instance;
void setupLocator(){
  getIt.registerSingleton<StandingRepoImpl>(StandingRepoImpl
    (standingDataSource: StandingTableDataSourceImpl()));
}
