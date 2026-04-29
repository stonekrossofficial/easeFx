import 'package:fpdart/fpdart.dart';
import 'package:easefx_ai/core/error/failures.dart';
import 'package:easefx_ai/features/headshot_generator/domain/entities/headshot_style.dart';

abstract class HeadshotRepository {
  Future<Either<AppFailure, List<HeadshotStyle>>> getHeadshotStyles();
}
