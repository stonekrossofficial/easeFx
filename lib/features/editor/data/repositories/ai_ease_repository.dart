import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as p;
import 'package:easefx_ai/core/network/ai_ease_crypto.dart';
import 'package:uuid/uuid.dart';

class AiEaseRepository {
  final String _token =
      "eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE3Nzc3MTQ0MDEsInVzZXJJZCI6NTE5ODQ0MTF9.CAFTkuhNIE331v-slNyxAxCo9Uyjt_e7X9Vtta_iN4Y";

  Map<String, String> get _headers => {
        "Content-Type": "application/json",
        "Authorization": "JWT $_token",
        "Platform": "web",
      };

  Future<String> generateClothChange(File imageFile, String styleId) async {
    print("╔══════════════════════════════════════════╗");
    print("║        AI EASE — CLOTH CHANGE PIPELINE   ║");
    print("╚══════════════════════════════════════════╝");
    final publicUrl = await _uploadImage(imageFile);
    final taskId = await _triggerGeneration(publicUrl, styleId);
    return await _pollForResult(taskId);
  }

  /// AI Filter: applies a style filter to the user's photo.
  Future<String> generateAiFilter(File imageFile, String styleId) async {
    print("╔══════════════════════════════════════════╗");
    print("║        AI EASE — AI FILTER PIPELINE      ║");
    print("╚══════════════════════════════════════════╝");
    final publicUrl = await _uploadImage(imageFile);
    final taskId = await _triggerAiFilter(publicUrl, styleId);
    return await _pollForResult(taskId);
  }

  /// Hair Swap: changes the user's hair style.
  Future<String> generateHairSwap(File imageFile, String styleId) async {
    print("╔══════════════════════════════════════════╗");
    print("║        AI EASE — HAIR SWAP PIPELINE      ║");
    print("╚══════════════════════════════════════════╝");
    final publicUrl = await _uploadImage(imageFile);
    final taskId = await _triggerHairSwap(publicUrl, styleId);
    return await _pollForResult(taskId);
  }

  /// Headshot Generator: generates a professional headshot in a given style.
  Future<String> generateHeadshot(File imageFile, String styleId) async {
    print("╔══════════════════════════════════════════╗");
    print("║      AI EASE — HEADSHOT PIPELINE         ║");
    print("╚══════════════════════════════════════════╝");
    final publicUrl = await _uploadImage(imageFile);
    final taskId = await _triggerHeadshot(publicUrl, styleId);
    return await _pollForResult(taskId);
  }

  // ─── SHARED UPLOAD HELPER ────────────────────────────────────────────────────
  /// Steps 1 + 2 combined: uploads [imageFile] and returns the public CDN URL.
  Future<String> _uploadImage(File imageFile) async {
    final fileName = p.basename(imageFile.path);
    final fileSize = await imageFile.length();
    final mimeType =
        fileName.toLowerCase().endsWith('.png') ? 'image/png' : 'image/jpeg';

    print("📁 Image Path : ${imageFile.path}");
    print("📄 File Name  : $fileName | 📦 $fileSize bytes | 🖼 $mimeType");

    final signedUrl = await _getSignedUploadUrl(fileSize, fileName, mimeType);
    final publicUrl = signedUrl.split('?').first;
    print("🔗 Public URL : $publicUrl");

    await _uploadBinary(signedUrl, imageFile, mimeType);
    return publicUrl;
  }

  // ─── STEP 1 ─────────────────────────────────────────────────────────────────
  Future<String> _getSignedUploadUrl(
      int fileSize, String fileName, String mimeType) async {
    print("┌─ STEP 1: Get Signed Upload URL ───────────");

    final uuid = const Uuid().v4();
    final payload = jsonEncode({
      "length": fileSize,
      "filetype": mimeType,
      "filename": fileName,
    });
    print("   ▸ Payload (plain)  : $payload");

    final encryptedT = AiEaseCrypto.encryptPayload(payload);
    print("   ▸ Encrypted (t)    : $encryptedT");

    final url =
        'https://www.aiease.ai/api/api/id_photo/s?time=$uuid';
    print("   ▸ POST URL         : $url");

    final response = await http.post(
      Uri.parse(url),
      headers: _headers,
      body: jsonEncode({"t": encryptedT}),
    );

    print("   ▸ HTTP Status      : ${response.statusCode}");
    print("   ▸ Raw Response     : ${response.body}");

    final data = jsonDecode(response.body);
    print("   ▸ code             : ${data['code']}");
    print("   ▸ message          : ${data['message']}");

    if (data['code'] != 200) {
      print("   ✗ STEP 1 FAILED");
      print("└────────────────────────────────────────────");
      throw Exception("Upload init failed (${data['code']}): ${data['message'] ?? response.body}");
    }

    final decryptedUrl = AiEaseCrypto.decryptPayload(data['result'] as String);
    print("   ▸ Decrypted URL    : $decryptedUrl");
    print("   ✓ STEP 1 PASSED");
    print("└────────────────────────────────────────────\n");

    return decryptedUrl;
  }

  // ─── STEP 2 ─────────────────────────────────────────────────────────────────
  Future<void> _uploadBinary(
      String signedUrl, File imageFile, String mimeType) async {
    print("┌─ STEP 2: Upload Binary to Cloud ──────────");
    print("   ▸ PUT URL          : $signedUrl");

    final bytes = await imageFile.readAsBytes();
    print("   ▸ Bytes to upload  : ${bytes.length}");

    final response = await http.put(
      Uri.parse(signedUrl),
      headers: {"Content-Type": mimeType},
      body: bytes,
    );

    print("   ▸ HTTP Status      : ${response.statusCode}");
    print("   ▸ Response Body    : ${response.body.isEmpty ? "(empty — expected for S3 PUT)" : response.body}");

    if (response.statusCode != 200 && response.statusCode != 204) {
      print("   ✗ STEP 2 FAILED");
      print("└────────────────────────────────────────────");
      throw Exception("Binary upload failed: HTTP ${response.statusCode}\n${response.body}");
    }

    print("   ✓ STEP 2 PASSED");
    print("└────────────────────────────────────────────\n");
  }

  // ─── STEP 3 ─────────────────────────────────────────────────────────────────
  Future<String> _triggerGeneration(
      String publicImageUrl, String styleId) async {
    print("┌─ STEP 3: Trigger AI Generation ───────────");

    final body = jsonEncode({
      "gen_type": "ai_wardrobe",
      "ai_wardrobe_extra_data": {
        "img_url": publicImageUrl,
        "styleId": styleId,
      },
    });
    print("   ▸ Request Body     : $body");

    const url = 'https://www.aiease.ai/api/api/gen/v2/img2img';
    print("   ▸ POST URL         : $url");

    final response = await http.post(
      Uri.parse(url),
      headers: _headers,
      body: body,
    );

    print("   ▸ HTTP Status      : ${response.statusCode}");
    print("   ▸ Raw Response     : ${response.body}");

    final data = jsonDecode(response.body);
    print("   ▸ code             : ${data['code']}");
    print("   ▸ message          : ${data['message']}");
    print("   ▸ result           : ${data['result']}");

    if (data['code'] != 200) {
      print("   ✗ STEP 3 FAILED");
      print("└────────────────────────────────────────────");
      throw Exception("Generation trigger failed (${data['code']}): ${data['message'] ?? response.body}");
    }

    final taskId = data['result']?['taskId'] as String?;
    if (taskId == null) {
      print("   ✗ No taskId found in result!");
      print("└────────────────────────────────────────────");
      throw Exception("No taskId in generation response: ${data['result']}");
    }

    print("   ▸ Task ID          : $taskId");
    print("   ✓ STEP 3 PASSED");
    print("└────────────────────────────────────────────\n");

    return taskId;
  }

  // ─── TRIGGER: AI Filter ──────────────────────────────────────────────────────
  Future<String> _triggerAiFilter(String publicImageUrl, String styleId) async {
    print("┌─ STEP 3: Trigger AI Filter ───────────────");
    final body = jsonEncode({
      "gen_type": "ai_filter",
      "ai_filter_extra_data": {
        "img_url": publicImageUrl,
        "style_id": styleId,
      },
    });
    print("   ▸ Request Body     : $body");
    const url = 'https://www.aiease.ai/api/api/gen/v2/img2img';
    final response = await http.post(Uri.parse(url), headers: _headers, body: body);
    print("   ▸ HTTP Status      : ${response.statusCode}");
    print("   ▸ Raw Response     : ${response.body}");
    final data = jsonDecode(response.body);
    if (data['code'] != 200) {
      throw Exception("AI Filter trigger failed (${data['code']}): ${data['message'] ?? response.body}");
    }
    final taskId = data['result']?['taskId'] as String?;
    if (taskId == null) throw Exception("No taskId in AI Filter response: ${data['result']}");
    print("   ▸ Task ID          : $taskId  ✓ STEP 3 PASSED");
    print("└────────────────────────────────────────────\n");
    return taskId;
  }

  // ─── TRIGGER: Hair Swap ──────────────────────────────────────────────────────
  Future<String> _triggerHairSwap(String publicImageUrl, String styleId) async {
    print("┌─ STEP 3: Trigger Hair Swap ───────────────");
    final body = jsonEncode({
      "gen_type": "hair_swap",
      "hair_swap_extra_data": {
        "img_url": publicImageUrl,
        "style_id": styleId,
      },
    });
    print("   ▸ Request Body     : $body");
    const url = 'https://www.aiease.ai/api/api/gen/v2/img2img';
    final response = await http.post(Uri.parse(url), headers: _headers, body: body);
    print("   ▸ HTTP Status      : ${response.statusCode}");
    print("   ▸ Raw Response     : ${response.body}");
    final data = jsonDecode(response.body);
    if (data['code'] != 200) {
      throw Exception("Hair Swap trigger failed (${data['code']}): ${data['message'] ?? response.body}");
    }
    final taskId = data['result']?['taskId'] as String?;
    if (taskId == null) throw Exception("No taskId in Hair Swap response: ${data['result']}");
    print("   ▸ Task ID          : $taskId  ✓ STEP 3 PASSED");
    print("└────────────────────────────────────────────\n");
    return taskId;
  }

  // ─── TRIGGER: Headshot ───────────────────────────────────────────────────────
  Future<String> _triggerHeadshot(String publicImageUrl, String styleId) async {
    print("┌─ STEP 3: Trigger Headshot ────────────────");
    final body = jsonEncode({
      "gen_type": "headshot",
      "headshot_extra_data": {
        "img_url": publicImageUrl,
        "style_id": styleId,
      },
    });
    print("   ▸ Request Body     : $body");
    const url = 'https://www.aiease.ai/api/api/gen/v2/img2img';
    final response = await http.post(Uri.parse(url), headers: _headers, body: body);
    print("   ▸ HTTP Status      : ${response.statusCode}");
    print("   ▸ Raw Response     : ${response.body}");
    final data = jsonDecode(response.body);
    if (data['code'] != 200) {
      throw Exception("Headshot trigger failed (${data['code']}): ${data['message'] ?? response.body}");
    }
    final taskId = data['result']?['taskId'] as String?;
    if (taskId == null) throw Exception("No taskId in Headshot response: ${data['result']}");
    print("   ▸ Task ID          : $taskId  ✓ STEP 3 PASSED");
    print("└────────────────────────────────────────────\n");
    return taskId;
  }

  // ─── STEP 4 ─────────────────────────────────────────────────────────────────
  Future<String> _pollForResult(String taskId) async {
    print("┌─ STEP 4: Polling for Result ───────────────");
    print("   ▸ Task ID          : $taskId");
    print("   ▸ Max 30 attempts × 3s = 90s timeout");

    for (int attempt = 1; attempt <= 30; attempt++) {
      print("   ⏳ Attempt $attempt/30 ...");

      final response = await http.get(
        Uri.parse(
            'https://www.aiease.ai/api/api/id_photo/task-info?task_id=$taskId'),
        headers: {
          "Authorization": "JWT $_token",
          "Platform": "web",
        },
      );

      print("      HTTP Status  : ${response.statusCode}");
      print("      Raw Body     : ${response.body}");

      final data = jsonDecode(response.body);
      final code = data['code'];
      final results = data['result']?['data']?['results'];
      final status = data['result']?['data']?['queue_info']?['status']?.toString() ?? 'unknown';

      print("      code         : $code");
      print("      status       : $status");
      print("      results      : $results");

      if (code == 200 && results != null && (results as List).isNotEmpty) {
        final imageUrl = results[0]['origin'] as String?;
        if (imageUrl != null && imageUrl.isNotEmpty) {
          print("   ✓ STEP 4 PASSED — Got image URL:");
          print("   🎉 $imageUrl");
          print("└────────────────────────────────────────────\n");
          return imageUrl;
        }
      }

      if (code == 450 ||
          status.toLowerCase().contains('fail') ||
          status.toLowerCase().contains('error')) {
        print("   ✗ Server returned failure at attempt $attempt");
        print("└────────────────────────────────────────────");
        throw Exception("Generation failed: ${data['message'] ?? status}");
      }

      print("      Still processing — waiting 3 seconds...\n");
      await Future.delayed(const Duration(seconds: 3));
    }

    print("   ✗ TIMED OUT after 30 attempts");
    print("└────────────────────────────────────────────");
    throw Exception("AI generation timed out after 90 seconds.");
  }
}
