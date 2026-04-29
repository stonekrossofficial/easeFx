import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../../../../features/onboarding/data/repositories/auth_repository.dart';
import '../models/wardrobe_style_model.dart';

class ClothChangerRepository {
  final String _stylesUrl = 'http://my-worker.scratched.workers.dev/api/styles';
  final String _generateUrl = 'http://my-worker.scratched.workers.dev/api/wardrobe';

  Future<List<WardrobeStyleModel>> fetchStyles() async {
    try {
      final String token = AuthRepository().accessToken ?? '';
      
      final response = await http.get(
        Uri.parse(_stylesUrl),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<WardrobeStyleModel> styles = [];

        if (data.containsKey('female')) {
          for (var item in data['female']) {
            styles.add(WardrobeStyleModel.fromApiJson(item, 'female'));
          }
        }
        
        if (data.containsKey('male')) {
          for (var item in data['male']) {
            styles.add(WardrobeStyleModel.fromApiJson(item, 'male'));
          }
        }
        
        return styles;
      } else {
        throw Exception("Failed to load styles");
      }
    } catch (e) {
      throw Exception("Error fetching styles: $e");
    }
  }

  Future<String> generateClothChange(File imageFile, String styleId) async {
    try {
      final String token = AuthRepository().accessToken ?? '';
      
      var request = http.MultipartRequest('POST', Uri.parse(_generateUrl));
      
      request.headers.addAll({
        'Authorization': 'Bearer $token',
      });
      
      request.fields['styleId'] = styleId;
      
      request.files.add(await http.MultipartFile.fromPath(
        'image',
        imageFile.path,
      ));

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map<String, dynamic> data = json.decode(response.body);
        
        String? imageUrl;
        if (data['finalImageUrl'] != null) {
          imageUrl = data['finalImageUrl'];
        } else if (data['data'] != null && data['data']['result'] != null && data['data']['result']['images'] != null) {
          imageUrl = data['data']['result']['images'][0]['url'];
        }
        
        if (imageUrl != null) {
          return imageUrl;
        } else {
          throw Exception("Could not parse image URL from response.");
        }
      } else {
        throw Exception("Failed to generate image. Status: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error connecting to server: ${e.toString()}");
    }
  }
}
