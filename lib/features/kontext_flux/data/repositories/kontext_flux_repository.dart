import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:fpdart/fpdart.dart';
import '../../../../features/onboarding/data/repositories/auth_repository.dart';

class KontextFluxRepository {
  final String _baseUrl = 'https://my-worker.scratched.workers.dev/api/kontext';

  Future<Either<String, String>> generateImage(File imageFile, String prompt) async {
    try {
      final String token = AuthRepository().accessToken ?? '';
      
      var request = http.MultipartRequest('POST', Uri.parse(_baseUrl));
      
      request.headers.addAll({
        'Authorization': 'Bearer $token',
      });
      
      request.fields['prompt'] = prompt;
      
      request.files.add(await http.MultipartFile.fromPath(
        'image',
        imageFile.path,
      ));

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map<String, dynamic> data = json.decode(response.body);
        
        // Attempting to extract imageUrl, fallback if response structure is unknown
        String? imageUrl;
        if (data['finalImageUrl'] != null) {
          imageUrl = data['finalImageUrl'];
        } else if (data['data'] != null && data['data']['result'] != null && data['data']['result']['images'] != null) {
          imageUrl = data['data']['result']['images'][0]['url'];
        }
        
        if (imageUrl != null) {
          return Right(imageUrl);
        } else {
          // Temporarily return success with a raw response string to debug or mock until real response format is known
          print("Unknown Response Format: ${response.body}");
          return Left("Parsed successfully, but couldn't find image URL. Check console for raw response.");
        }
      } else {
        return Left("Failed to generate image. Status: ${response.statusCode}");
      }
    } catch (e) {
      return Left("Error connecting to server: ${e.toString()}");
    }
  }
}
