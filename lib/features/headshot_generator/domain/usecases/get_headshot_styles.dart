import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:easefx_ai/core/error/failures.dart';
import 'package:easefx_ai/features/headshot_generator/domain/entities/headshot_style.dart';
import 'package:easefx_ai/features/headshot_generator/domain/repositories/headshot_repository.dart';

@injectable
class GetHeadshotStyles {
  final HeadshotRepository repository;

  GetHeadshotStyles(this.repository);

  Future<Either<AppFailure, List<HeadshotStyle>>> call() async {
    return await repository.getHeadshotStyles();
  }
}
