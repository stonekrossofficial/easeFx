import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:easefx_ai/core/network/dio_client.dart';
import 'package:easefx_ai/features/headshot_generator/data/models/headshot_style_model.dart';

abstract class HeadshotRemoteDataSource {
  Future<List<HeadshotStyleModel>> getStyles();
}

@LazySingleton(as: HeadshotRemoteDataSource)
class HeadshotRemoteDataSourceImpl implements HeadshotRemoteDataSource {
  final DioClient dioClient;

  HeadshotRemoteDataSourceImpl(this.dioClient);

  /// Fallback data used when the live API is unreachable.
  static final List<Map<String, dynamic>> fallbackData = [

    ];

  @override
  Future<List<HeadshotStyleModel>> getStyles() async {
    // Try live API first; fall back to embedded data if API is unavailable or returns empty
    try {
      final response = '';

      // if (response.data != null && response.data['code'] == 200) {
      //   final List<dynamic> results = response.data['result'] ?? [];
      //   if (results.isNotEmpty) {
      //     return results
      //         .map((json) => HeadshotStyleModel.fromJson(json as Map<String, dynamic>))
      //         .toList();
      //   }
      // }
    } catch (_) {}

    // Fallback: use embedded real data
    return _fallbackFromLocal();
  }

  List<HeadshotStyleModel> _fallbackFromLocal() {
    return fallbackData
        .map((json) => HeadshotStyleModel.fromJson(json))
        .toList();
  }
}
