import 'package:dartz/dartz.dart';
import 'package:premleague/Clean_arch/Features/Latest/domain/entities/matches_result_entity.dart';

import '../../../../Core/error_handliing.dart';

abstract class MatchesResultRepo{
  Future<Either<Failure,List<MatchesResultEntity>>>fetchMatchesResult();
}