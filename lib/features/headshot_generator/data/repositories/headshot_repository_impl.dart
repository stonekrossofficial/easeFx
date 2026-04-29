import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:easefx_ai/core/error/failures.dart';
import 'package:easefx_ai/core/utils/app_logger.dart';
import 'package:easefx_ai/features/headshot_generator/data/datasources/headshot_remote_data_source.dart';
import 'package:easefx_ai/features/headshot_generator/domain/entities/headshot_style.dart';
import 'package:easefx_ai/features/headshot_generator/domain/repositories/headshot_repository.dart';

@LazySingleton(as: HeadshotRepository)
class HeadshotRepositoryImpl implements HeadshotRepository {
  final HeadshotRemoteDataSource remoteDataSource;

  HeadshotRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<AppFailure, List<HeadshotStyle>>> getHeadshotStyles() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.none)) {
      return const Left(NetworkFailure(message: 'No internet connection'));
    }

    try {
      final models = await remoteDataSource.getStyles();
      final entities = models.map((model) => model.toEntity()).toList();
      return Right(entities);
    } catch (e, stackTrace) {
      AppLogger.error('Failed to get headshot styles', e, stackTrace);
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
