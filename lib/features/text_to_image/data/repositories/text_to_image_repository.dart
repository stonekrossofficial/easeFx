import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fpdart/fpdart.dart';
import '../../../../features/onboarding/data/repositories/auth_repository.dart';

class TextToImageRepository {
  final String _baseUrl = 'https://my-worker.scratched.workers.dev/api/generate';

  Future<Either<String, String>> generateImage(String prompt) async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse(_baseUrl));
      
      final String token = AuthRepository().accessToken ?? '';
      
      request.headers.addAll({
        'Authorization': 'Bearer $token',
      });
      
      request.fields['prompt'] = prompt;

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map<String, dynamic> data = json.decode(response.body);
        
        if (data['status'] == 'completed' && data['finalImageUrl'] != null) {
          return Right(data['finalImageUrl']);
        } else {
          return Left("Failed to get image URL from response");
        }
      } else {
        return Left("Failed to generate image. Status: ${response.statusCode}");
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
