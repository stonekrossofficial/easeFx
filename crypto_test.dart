import 'dart:convert';
import 'dart:typed_data';
import 'dart:math';
import 'package:crypto/crypto.dart';
import 'package:pointycastle/export.dart';

class AiEaseCrypto {
  static const String masterKeyRaw = "Q@D24=oueV%]OBS8i,%eK=5I|7WU\$PeE";

  static Uint8List _generateSecureRandom(int length) {
    final random = Random.secure();
    final bytes = Uint8List(length);
    for (int i = 0; i < length; i++) {
        bytes[i] = random.nextInt(256);
    }
    return bytes;
  }

  static Uint8List _cfb128Encrypt(Uint8List plaintext, Uint8List key, Uint8List iv) {
    final engine = AESEngine()..init(true, KeyParameter(key));
    final ciphertext = Uint8List(plaintext.length);
    Uint8List currentIv = Uint8List.fromList(iv);
    Uint8List outBlock = Uint8List(16);

    int i = 0;
    while (i < plaintext.length) {
      engine.processBlock(currentIv, 0, outBlock, 0);
      int blockLen = (plaintext.length - i) < 16 ? (plaintext.length - i) : 16;
      for (int j = 0; j < blockLen; j++) {
        ciphertext[i + j] = plaintext[i + j] ^ outBlock[j];
        currentIv[j] = ciphertext[i + j];
      }
      i += blockLen;
    }
    return ciphertext;
  }

  static Uint8List _cfb128Decrypt(Uint8List ciphertext, Uint8List key, Uint8List iv) {
    final engine = AESEngine()..init(true, KeyParameter(key)); 
    final plaintext = Uint8List(ciphertext.length);
    Uint8List currentIv = Uint8List.fromList(iv);
    Uint8List outBlock = Uint8List(16);

    int i = 0;
    while (i < ciphertext.length) {
      engine.processBlock(currentIv, 0, outBlock, 0);
      int blockLen = (ciphertext.length - i) < 16 ? (ciphertext.length - i) : 16;
      for (int j = 0; j < blockLen; j++) {
        plaintext[i + j] = ciphertext[i + j] ^ outBlock[j];
        currentIv[j] = ciphertext[i + j];
      }
      i += blockLen;
    }
    return plaintext;
  }

  static String encryptPayload(String plainText) {
    final encodedText = Uint8List.fromList(utf8.encode(Uri.encodeComponent(plainText)));
    final aesKeyBytes = Uint8List.fromList(sha256.convert(utf8.encode(masterKeyRaw)).bytes);
    final iv = _generateSecureRandom(16);

    final ciphertext = _cfb128Encrypt(encodedText, aesKeyBytes, iv);

    final combinedMap = Uint8List(iv.length + ciphertext.length);
    combinedMap.setAll(0, iv);
    combinedMap.setAll(iv.length, ciphertext);

    return base64.encode(combinedMap);
  }

  static String decryptPayload(String encryptedBase64) {
    final decodedBytes = base64.decode(encryptedBase64);
    if (decodedBytes.length < 16) throw Exception("Invalid payload");

    final iv = decodedBytes.sublist(0, 16);
    final cipherBytes = decodedBytes.sublist(16);

    final aesKeyBytes = Uint8List.fromList(sha256.convert(utf8.encode(masterKeyRaw)).bytes);

    final plaintext = _cfb128Decrypt(cipherBytes, aesKeyBytes, iv);

    return Uri.decodeComponent(utf8.decode(plaintext));
  }
}

void main() {
  try {
    final enc = AiEaseCrypto.encryptPayload('{"length": 100}');
    print(enc);
    final dec = AiEaseCrypto.decryptPayload(enc);
    print(dec);
  } catch (e, stack) {
    print(e);
    print(stack);
  }
}
