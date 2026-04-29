import 'package:get_it/get_it.dart';
import 'package:easefx_ai/core/network/dio_client.dart';
import 'package:easefx_ai/features/headshot_generator/data/datasources/headshot_remote_data_source.dart';
import 'package:easefx_ai/features/headshot_generator/data/repositories/headshot_repository_impl.dart';
import 'package:easefx_ai/features/headshot_generator/domain/repositories/headshot_repository.dart';
import 'package:easefx_ai/features/headshot_generator/domain/usecases/get_headshot_styles.dart';
import 'package:easefx_ai/features/headshot_generator/presentation/bloc/headshot_generator_bloc.dart';

final getIt = GetIt.instance;

void configureDependencies() {
  getIt.registerLazySingleton<DioClient>(() => DioClient());
  getIt.registerLazySingleton<HeadshotRemoteDataSource>(() => HeadshotRemoteDataSourceImpl(getIt()));
  getIt.registerLazySingleton<HeadshotRepository>(() => HeadshotRepositoryImpl(getIt()));
  getIt.registerFactory<GetHeadshotStyles>(() => GetHeadshotStyles(getIt()));
  getIt.registerFactory<HeadshotGeneratorBloc>(() => HeadshotGeneratorBloc(getIt()));
}
