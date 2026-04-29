import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:easefx_ai/core/network/ai_ease_crypto.dart';

class ApiClient {
  final http.Client _client = http.Client();
  final String baseUrl;

  ApiClient({this.baseUrl = "https://mock.aiease.api/v1"}); // TODO: Inject real URL

  Future<Map<String, dynamic>> postEncrypted(String endpoint, Map<String, dynamic> body) async {
    final uri = Uri.parse('$baseUrl$endpoint');
    
    // 1. Prepare JSON
    final jsonString = jsonEncode(body);
    
    // 2. Encrypt Payload
    final encryptedData = AiEaseCrypto.encryptPayload(jsonString);

    // 3. Make HTTP Request
    final response = await _client.post(
      uri,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({"data": encryptedData}),
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      // 4. Decrypt Response
      final responseBody = jsonDecode(response.body);
      if (responseBody['data'] != null) {
        final decryptedString = AiEaseCrypto.decryptPayload(responseBody['data']);
        return jsonDecode(decryptedString);
      }
      return responseBody; // non-encrypted fallback edge case
    } else {
      throw Exception('Failed to connect: \${response.statusCode}');
    }
  }
}
