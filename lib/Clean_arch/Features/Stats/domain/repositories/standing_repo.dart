//الهدف منها تحديد اللى هيحصل فى التطبيق بس مش تنفيذه او تحديد هيحصل ازاى 
import 'package:dartz/dartz.dart';
import 'package:premleague/Clean_arch/Core/error_handliing.dart';
import 'package:premleague/Clean_arch/Features/Stats/data/models/StandingsModel.dart';

abstract class StandingRepoAbs{
  
 Future <Either<Failure,List<StandingsModel>>>fetchStandingTable();
}

