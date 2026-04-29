import 'dart:convert';
import 'dart:typed_data';
import 'package:crypto/crypto.dart';
import 'package:pointycastle/export.dart';

Uint8List aesCfbEncrypt(Uint8List key, Uint8List iv, Uint8List plaintext) {
  final cipher = CFBBlockCipher(AESEngine(), 16);
  cipher.init(
      true,
      ParametersWithIV(
          KeyParameter(key),
          iv
      )
  );

  final out = Uint8List(plaintext.length);
  // CFBBlockCipher processBlock takes exact block sizes? No, wait!
  // CFBBlockCipher has processBlock which does exactly blockSize. 
  // For stream cipher, you need streamCipher or processBytes.
  // Wait, PointyCastle has StreamCipher for CFB? No, CFB can be used byte by byte.
  
  // Actually, we can manually implement CFB if pointycastle is annoying:
  // C_i = P_i XOR E_K(IV or C_{i-1})
  
  return out;
}

void main() {}
