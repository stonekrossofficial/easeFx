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
  /// Sourced directly from https://www.aiease.ai/api/api/common/style
  static final List<Map<String, dynamic>> fallbackData = [
        {
            "id": 13,
            "sort": 13,
            "style": "Professional",
            "gender": "Man",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_13_face_Face_man_0009_batch_1.webp",
            "usageCount": "5925",
            "head_show": false
        },
        {
            "id": 5,
            "sort": 5,
            "style": "Professional",
            "gender": "Man",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_5_face_Face_man_0001_batch_0.webp",
            "usageCount": "2259",
            "head_show": false
        },
        {
            "id": 14,
            "sort": 14,
            "style": "Professional",
            "gender": "Man",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_14_face_Face_man_0005_batch_0.webp",
            "usageCount": "13445",
            "head_show": false
        },
        {
            "id": 11,
            "sort": 11,
            "style": "Professional",
            "gender": "Man",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_11_face_Face_man_0009_batch_0.webp",
            "usageCount": "1114",
            "head_show": false
        },
        {
            "id": 7,
            "sort": 7,
            "style": "Professional",
            "gender": "Man",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_7_face_Face_man_0002_batch_1.webp",
            "usageCount": "4174",
            "head_show": false
        },
        {
            "id": 1,
            "sort": 1,
            "style": "Professional",
            "gender": "Man",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_1_face_Face_man_0009_batch_0.webp",
            "usageCount": "15096",
            "head_show": true
        },
        {
            "id": 21,
            "sort": 21,
            "style": "Professional",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_21_face_Face_woman_0005_batch_0.webp",
            "usageCount": "1734",
            "head_show": false
        },
        {
            "id": 25,
            "sort": 25,
            "style": "Professional",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_25_face_Face_woman_0004_batch_0.webp",
            "usageCount": "992",
            "head_show": false
        },
        {
            "id": 10,
            "sort": 10,
            "style": "Professional",
            "gender": "Man",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_10_face_Face_man_0008_batch_0.webp",
            "usageCount": "1890",
            "head_show": false
        },
        {
            "id": 8,
            "sort": 8,
            "style": "Professional",
            "gender": "Man",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_8_face_Face_man_0001_batch_1.webp",
            "usageCount": "6892",
            "head_show": false
        },
        {
            "id": 19,
            "sort": 19,
            "style": "Professional",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_19_face_Face_woman_0003_batch_0.webp",
            "usageCount": "1706",
            "head_show": false
        },
        {
            "id": 12,
            "sort": 12,
            "style": "Professional",
            "gender": "Man",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_12_face_Face_man_0006_batch_1.webp",
            "usageCount": "7321",
            "head_show": false
        },
        {
            "id": 18,
            "sort": 18,
            "style": "Professional",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_18_face_Face_woman_0004_batch_0.webp",
            "usageCount": "13083",
            "head_show": true
        },
        {
            "id": 24,
            "sort": 24,
            "style": "Professional",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_24_face_Face_woman_0001_batch_0.webp",
            "usageCount": "1599",
            "head_show": false
        },
        {
            "id": 23,
            "sort": 23,
            "style": "Professional",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_23_face_Face_woman_0005_batch_0.webp",
            "usageCount": "2685",
            "head_show": false
        },
        {
            "id": 146,
            "sort": 170,
            "style": "Professional",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2F170.webp",
            "usageCount": "1839",
            "head_show": false
        },
        {
            "id": 6,
            "sort": 6,
            "style": "Professional",
            "gender": "Man",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_6_face_Face_man_0008_batch_0.webp",
            "usageCount": "5013",
            "head_show": false
        },
        {
            "id": 22,
            "sort": 22,
            "style": "Professional",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_22_face_Face_woman_0000_batch_1.webp",
            "usageCount": "2432",
            "head_show": false
        },
        {
            "id": 26,
            "sort": 26,
            "style": "Professional",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_26_face_Face_woman_0006_batch_0.webp",
            "usageCount": "1580",
            "head_show": false
        },
        {
            "id": 2,
            "sort": 2,
            "style": "Professional",
            "gender": "Man",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_2_face_Face_man_0005_batch_1.webp",
            "usageCount": "18454",
            "head_show": true
        },
        {
            "id": 3,
            "sort": 3,
            "style": "Professional",
            "gender": "Man",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_3_face_Face_man_0009_batch_1.webp",
            "usageCount": "16340",
            "head_show": false
        },
        {
            "id": 9,
            "sort": 9,
            "style": "Professional",
            "gender": "Man",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_9_face_Face_man_0005_batch_0.webp",
            "usageCount": "13458",
            "head_show": false
        },
        {
            "id": 27,
            "sort": 27,
            "style": "Professional",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_27_face_Face_woman_0007_batch_0.webp",
            "usageCount": "1645",
            "head_show": false
        },
        {
            "id": 144,
            "sort": 168,
            "style": "Professional",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2F168.webp",
            "usageCount": "2237",
            "head_show": false
        },
        {
            "id": 20,
            "sort": 20,
            "style": "Professional",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_20_face_Face_woman_0007_batch_0.webp",
            "usageCount": "1197",
            "head_show": false
        },
        {
            "id": 17,
            "sort": 17,
            "style": "Professional",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_17_face_Face_woman_0005_batch_1.webp",
            "usageCount": "48734",
            "head_show": true
        },
        {
            "id": 28,
            "sort": 28,
            "style": "Professional",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_28_face_Face_woman_0005_batch_0.webp",
            "usageCount": "2855",
            "head_show": false
        },
        {
            "id": 4,
            "sort": 4,
            "style": "Professional",
            "gender": "Man",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_4_face_Face_man_0006_batch_1.webp",
            "usageCount": "4198",
            "head_show": false
        },
        {
            "id": 136,
            "sort": 160,
            "style": "Professional",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2F160.webp",
            "usageCount": "522",
            "head_show": false
        },
        {
            "id": 192,
            "sort": 90,
            "style": "Graduation",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/aiease-sys/common/8610945487dd4020a03fc0e3b086c10d.webp",
            "usageCount": "387",
            "head_show": false
        },
        {
            "id": 190,
            "sort": 90,
            "style": "Graduation",
            "gender": "Man",
            "avatar": "https://pub-static.aiease.ai/aiease-sys/common/a3808fdabb204a379ca5f6b22d1e0f1b.webp",
            "usageCount": "388",
            "head_show": false
        },
        {
            "id": 186,
            "sort": 90,
            "style": "Graduation",
            "gender": "Man",
            "avatar": "https://pub-static.aiease.ai/aiease-sys/common/a48389a3ab244f419722d15c5d27a7ac.webp",
            "usageCount": "487",
            "head_show": false
        },
        {
            "id": 191,
            "sort": 90,
            "style": "Graduation",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/aiease-sys/common/61e99080a0b5408e9d3fe319e37ef172.webp",
            "usageCount": "350",
            "head_show": false
        },
        {
            "id": 189,
            "sort": 90,
            "style": "Graduation",
            "gender": "Man",
            "avatar": "https://pub-static.aiease.ai/aiease-sys/common/be9326d4bd81448b803aece982d93621.webp",
            "usageCount": "226",
            "head_show": false
        },
        {
            "id": 188,
            "sort": 90,
            "style": "Graduation",
            "gender": "Man",
            "avatar": "https://pub-static.aiease.ai/aiease-sys/common/3474e046bf574f50a576b5f920031bdd.webp",
            "usageCount": "666",
            "head_show": false
        },
        {
            "id": 187,
            "sort": 90,
            "style": "Graduation",
            "gender": "Man",
            "avatar": "https://pub-static.aiease.ai/aiease-sys/common/4742bf0f27a549d38a09659b145170b2.webp",
            "usageCount": "389",
            "head_show": false
        },
        {
            "id": 195,
            "sort": 90,
            "style": "Graduation",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/aiease-sys/common/7904e14bdb184bed994cefadb05e720d.webp",
            "usageCount": "859",
            "head_show": false
        },
        {
            "id": 194,
            "sort": 90,
            "style": "Graduation",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/aiease-sys/common/6a689066dc2847bab6bf2916122b7169.webp",
            "usageCount": "280",
            "head_show": false
        },
        {
            "id": 193,
            "sort": 90,
            "style": "Graduation",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/aiease-sys/common/505ac6b827d54994b13323a1f4f5c5e9.webp",
            "usageCount": "255",
            "head_show": false
        },
        {
            "id": 177,
            "sort": 201,
            "style": "Creative",
            "gender": "Man",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2F201.webp",
            "usageCount": "931",
            "head_show": false
        },
        {
            "id": 84,
            "sort": 104,
            "style": "Creative",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_104_face_Face_woman_0004_batch_0.webp",
            "usageCount": "678",
            "head_show": false
        },
        {
            "id": 88,
            "sort": 108,
            "style": "Creative",
            "gender": "Man",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_108_face_Face_man_0008_batch_1.webp",
            "usageCount": "731",
            "head_show": false
        },
        {
            "id": 96,
            "sort": 117,
            "style": "Creative",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_117_face_Face_woman_0007_batch_0.webp",
            "usageCount": "461",
            "head_show": false
        },
        {
            "id": 142,
            "sort": 166,
            "style": "Creative",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2F166.webp",
            "usageCount": "361",
            "head_show": false
        },
        {
            "id": 85,
            "sort": 105,
            "style": "Creative",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_105_face_Face_woman_0005_batch_1.webp",
            "usageCount": "557",
            "head_show": false
        },
        {
            "id": 156,
            "sort": 180,
            "style": "Creative",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2F180.webp",
            "usageCount": "367",
            "head_show": false
        },
        {
            "id": 150,
            "sort": 174,
            "style": "Creative",
            "gender": "Man",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2F174.webp",
            "usageCount": "1109",
            "head_show": false
        },
        {
            "id": 179,
            "sort": 203,
            "style": "Creative",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2F203.webp",
            "usageCount": "294",
            "head_show": false
        },
        {
            "id": 153,
            "sort": 177,
            "style": "Creative",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2F177.webp",
            "usageCount": "544",
            "head_show": false
        },
        {
            "id": 178,
            "sort": 202,
            "style": "Creative",
            "gender": "Man",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2F202.webp",
            "usageCount": "3226",
            "head_show": false
        },
        {
            "id": 159,
            "sort": 183,
            "style": "Creative",
            "gender": "Man",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2F183.webp",
            "usageCount": "1708",
            "head_show": false
        },
        {
            "id": 139,
            "sort": 163,
            "style": "Creative",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2F163.webp",
            "usageCount": "379",
            "head_show": false
        },
        {
            "id": 157,
            "sort": 181,
            "style": "Creative",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2F181.webp",
            "usageCount": "882",
            "head_show": false
        },
        {
            "id": 147,
            "sort": 171,
            "style": "Creative",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2F171.webp",
            "usageCount": "621",
            "head_show": false
        },
        {
            "id": 168,
            "sort": 192,
            "style": "Creative",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2F192.webp",
            "usageCount": "737",
            "head_show": false
        },
        {
            "id": 169,
            "sort": 193,
            "style": "Creative",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2F193.webp",
            "usageCount": "1535",
            "head_show": false
        },
        {
            "id": 140,
            "sort": 164,
            "style": "Creative",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2F164.webp",
            "usageCount": "153",
            "head_show": false
        },
        {
            "id": 161,
            "sort": 185,
            "style": "Creative",
            "gender": "Man",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2F185.webp",
            "usageCount": "1026",
            "head_show": false
        },
        {
            "id": 95,
            "sort": 116,
            "style": "Creative",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_116_face_Face_woman_0007_batch_0.webp",
            "usageCount": "399",
            "head_show": false
        },
        {
            "id": 160,
            "sort": 184,
            "style": "Creative",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2F184.webp",
            "usageCount": "610",
            "head_show": false
        },
        {
            "id": 162,
            "sort": 186,
            "style": "Creative",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2F186.webp",
            "usageCount": "484",
            "head_show": false
        },
        {
            "id": 138,
            "sort": 162,
            "style": "Creative",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2F162.webp",
            "usageCount": "224",
            "head_show": false
        },
        {
            "id": 91,
            "sort": 112,
            "style": "Creative",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_112_face_Face_woman_0005_batch_1.webp",
            "usageCount": "1333",
            "head_show": false
        },
        {
            "id": 164,
            "sort": 188,
            "style": "Creative",
            "gender": "Man",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2F188.webp",
            "usageCount": "615",
            "head_show": false
        },
        {
            "id": 167,
            "sort": 191,
            "style": "Creative",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2F191.webp",
            "usageCount": "263",
            "head_show": false
        },
        {
            "id": 141,
            "sort": 165,
            "style": "Creative",
            "gender": "Man",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2F165.webp",
            "usageCount": "291",
            "head_show": false
        },
        {
            "id": 93,
            "sort": 114,
            "style": "Creative",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_114_face_Face_woman_0004_batch_1.webp",
            "usageCount": "402",
            "head_show": false
        },
        {
            "id": 165,
            "sort": 189,
            "style": "Creative",
            "gender": "Man",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2F189.webp",
            "usageCount": "376",
            "head_show": false
        },
        {
            "id": 92,
            "sort": 113,
            "style": "Creative",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_113_face_Face_woman_0004_batch_1.webp",
            "usageCount": "365",
            "head_show": false
        },
        {
            "id": 166,
            "sort": 190,
            "style": "Creative",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2F190.webp",
            "usageCount": "640",
            "head_show": false
        },
        {
            "id": 172,
            "sort": 196,
            "style": "Creative",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2F196.webp",
            "usageCount": "412",
            "head_show": false
        },
        {
            "id": 94,
            "sort": 115,
            "style": "Art",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_115_face_Face_woman_0007_batch_0.webp",
            "usageCount": "1671",
            "head_show": false
        },
        {
            "id": 43,
            "sort": 44,
            "style": "Art",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_44_face_Face_woman_0003_batch_0.webp",
            "usageCount": "1280",
            "head_show": false
        },
        {
            "id": 35,
            "sort": 36,
            "style": "Art",
            "gender": "Man",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_36_face_Face_man_0009_batch_0.webp",
            "usageCount": "931",
            "head_show": false
        },
        {
            "id": 98,
            "sort": 119,
            "style": "Art",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_119_face_Face_woman_0009_batch_0.webp",
            "usageCount": "1008",
            "head_show": false
        },
        {
            "id": 149,
            "sort": 173,
            "style": "Art",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2F173.webp",
            "usageCount": "372",
            "head_show": false
        },
        {
            "id": 40,
            "sort": 41,
            "style": "Art",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_41_face_Face_woman_0003_batch_0.webp",
            "usageCount": "8776",
            "head_show": false
        },
        {
            "id": 42,
            "sort": 43,
            "style": "Art",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_43_face_Face_woman_0009_batch_1.webp",
            "usageCount": "1428",
            "head_show": false
        },
        {
            "id": 41,
            "sort": 42,
            "style": "Art",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_42_face_Face_woman_0009_batch_0.webp",
            "usageCount": "683",
            "head_show": false
        },
        {
            "id": 44,
            "sort": 45,
            "style": "Art",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_45_face_Face_woman_0004_batch_1.webp",
            "usageCount": "484",
            "head_show": false
        },
        {
            "id": 45,
            "sort": 46,
            "style": "Art",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_46_face_Face_woman_0007_batch_1.webp",
            "usageCount": "963",
            "head_show": false
        },
        {
            "id": 33,
            "sort": 33,
            "style": "Art",
            "gender": "Man",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_33_face_Face_man_0001_batch_1.webp",
            "usageCount": "1503",
            "head_show": false
        },
        {
            "id": 99,
            "sort": 120,
            "style": "Art",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_120_face_Face_woman_0002_batch_0.webp",
            "usageCount": "430",
            "head_show": false
        },
        {
            "id": 143,
            "sort": 167,
            "style": "Art",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2F167.webp",
            "usageCount": "2625",
            "head_show": false
        },
        {
            "id": 97,
            "sort": 118,
            "style": "Art",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_118_face_Face_woman_0007_batch_1.webp",
            "usageCount": "651",
            "head_show": false
        },
        {
            "id": 32,
            "sort": 32,
            "style": "Art",
            "gender": "Man",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_32_face_Face_man_0003_batch_0.webp",
            "usageCount": "6109",
            "head_show": false
        },
        {
            "id": 36,
            "sort": 37,
            "style": "Art",
            "gender": "Man",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_37_face_Face_man_0005_batch_1.webp",
            "usageCount": "1276",
            "head_show": false
        },
        {
            "id": 48,
            "sort": 49,
            "style": "Art",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_49_face_Face_woman_0009_batch_1.webp",
            "usageCount": "7736",
            "head_show": false
        },
        {
            "id": 158,
            "sort": 182,
            "style": "Art",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2F182.webp",
            "usageCount": "879",
            "head_show": false
        },
        {
            "id": 87,
            "sort": 107,
            "style": "Art",
            "gender": "Man",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_107_face_Face_man_0008_batch_0.webp",
            "usageCount": "662",
            "head_show": false
        },
        {
            "id": 39,
            "sort": 40,
            "style": "Art",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_40_face_Face_woman_0007_batch_1.webp",
            "usageCount": "136",
            "head_show": false
        },
        {
            "id": 145,
            "sort": 169,
            "style": "Art",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2F169.webp",
            "usageCount": "628",
            "head_show": false
        },
        {
            "id": 34,
            "sort": 34,
            "style": "Art",
            "gender": "Man",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_34_face_Face_man_0006_batch_0.webp",
            "usageCount": "2329",
            "head_show": false
        },
        {
            "id": 31,
            "sort": 31,
            "style": "Art",
            "gender": "Man",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_31_face_Face_man_0006_batch_1.webp",
            "usageCount": "175",
            "head_show": false
        },
        {
            "id": 133,
            "sort": 157,
            "style": "Casual",
            "gender": "Man",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2F157.webp",
            "usageCount": "713",
            "head_show": false
        },
        {
            "id": 29,
            "sort": 30,
            "style": "Casual",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_30_face_Face_woman_0001_batch_1.webp",
            "usageCount": "979",
            "head_show": false
        },
        {
            "id": 113,
            "sort": 137,
            "style": "Casual",
            "gender": "Man",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2F137.webp",
            "usageCount": "1086",
            "head_show": false
        },
        {
            "id": 111,
            "sort": 135,
            "style": "Casual",
            "gender": "Man",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2F135.webp",
            "usageCount": "2587",
            "head_show": false
        },
        {
            "id": 115,
            "sort": 139,
            "style": "Casual",
            "gender": "Man",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2F139.webp",
            "usageCount": "1181",
            "head_show": false
        },
        {
            "id": 110,
            "sort": 134,
            "style": "Casual",
            "gender": "Man",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2F134.webp",
            "usageCount": "1913",
            "head_show": false
        },
        {
            "id": 114,
            "sort": 138,
            "style": "Casual",
            "gender": "Man",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2F138.webp",
            "usageCount": "1768",
            "head_show": false
        },
        {
            "id": 130,
            "sort": 154,
            "style": "Casual",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2F154.webp",
            "usageCount": "321",
            "head_show": false
        },
        {
            "id": 15,
            "sort": 15,
            "style": "Casual",
            "gender": "Man",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_15_face_Face_man_0001_batch_0.webp",
            "usageCount": "1665",
            "head_show": false
        },
        {
            "id": 137,
            "sort": 161,
            "style": "Casual",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2F161.webp",
            "usageCount": "1522",
            "head_show": false
        },
        {
            "id": 30,
            "sort": 29,
            "style": "Casual",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_29_face_Face_woman_0003_batch_1.webp",
            "usageCount": "562",
            "head_show": false
        },
        {
            "id": 163,
            "sort": 187,
            "style": "Casual",
            "gender": "Man",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2F187.webp",
            "usageCount": "1028",
            "head_show": false
        },
        {
            "id": 117,
            "sort": 141,
            "style": "Casual",
            "gender": "Man",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2F141.webp",
            "usageCount": "960",
            "head_show": false
        },
        {
            "id": 16,
            "sort": 16,
            "style": "Casual",
            "gender": "Man",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_16_face_Face_man_0005_batch_1.webp",
            "usageCount": "2039",
            "head_show": false
        },
        {
            "id": 116,
            "sort": 140,
            "style": "Casual",
            "gender": "Man",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2F140.webp",
            "usageCount": "1619",
            "head_show": false
        },
        {
            "id": 112,
            "sort": 136,
            "style": "Casual",
            "gender": "Man",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2F136.webp",
            "usageCount": "1729",
            "head_show": false
        },
        {
            "id": 103,
            "sort": 125,
            "style": "OldMoney",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_125_face_Face_woman_0009_batch_1.webp",
            "usageCount": "3557",
            "head_show": false
        },
        {
            "id": 106,
            "sort": 128,
            "style": "OldMoney",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_128_face_Face_woman_0001_batch_1.webp",
            "usageCount": "441",
            "head_show": false
        },
        {
            "id": 64,
            "sort": 65,
            "style": "OldMoney",
            "gender": "Man",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_65_face_Face_man_0002_batch_0.webp",
            "usageCount": "255",
            "head_show": false
        },
        {
            "id": 104,
            "sort": 126,
            "style": "OldMoney",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_126_face_Face_woman_0007_batch_1.webp",
            "usageCount": "705",
            "head_show": false
        },
        {
            "id": 63,
            "sort": 64,
            "style": "OldMoney",
            "gender": "Man",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_64_face_Face_man_0009_batch_0.webp",
            "usageCount": "5925",
            "head_show": false
        },
        {
            "id": 61,
            "sort": 62,
            "style": "OldMoney",
            "gender": "Man",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_62_face_Face_man_0009_batch_0.webp",
            "usageCount": "422",
            "head_show": false
        },
        {
            "id": 59,
            "sort": 60,
            "style": "OldMoney",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_60_face_Face_woman_0003_batch_0.webp",
            "usageCount": "4798",
            "head_show": false
        },
        {
            "id": 58,
            "sort": 59,
            "style": "OldMoney",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_59_face_Face_woman_0006_batch_0.webp",
            "usageCount": "4274",
            "head_show": false
        },
        {
            "id": 62,
            "sort": 63,
            "style": "OldMoney",
            "gender": "Man",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_63_face_Face_man_0005_batch_1.webp",
            "usageCount": "2682",
            "head_show": false
        },
        {
            "id": 60,
            "sort": 61,
            "style": "OldMoney",
            "gender": "Man",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_61_face_Face_man_0006_batch_1.webp",
            "usageCount": "411",
            "head_show": false
        },
        {
            "id": 105,
            "sort": 127,
            "style": "OldMoney",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_127_face_Face_woman_0004_batch_0.webp",
            "usageCount": "607",
            "head_show": false
        },
        {
            "id": 102,
            "sort": 124,
            "style": "Yearbook",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_124_face_Face_woman_0004_batch_0.webp",
            "usageCount": "1839",
            "head_show": false
        },
        {
            "id": 57,
            "sort": 58,
            "style": "Yearbook",
            "gender": "Man",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_58_face_Face_man_0005_batch_0.webp",
            "usageCount": "3094",
            "head_show": false
        },
        {
            "id": 101,
            "sort": 123,
            "style": "Yearbook",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_123_face_Face_woman_0003_batch_1.webp",
            "usageCount": "1506",
            "head_show": false
        },
        {
            "id": 51,
            "sort": 52,
            "style": "Yearbook",
            "gender": "Man",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_52_face_Face_man_0005_batch_1.webp",
            "usageCount": "511",
            "head_show": false
        },
        {
            "id": 52,
            "sort": 53,
            "style": "Yearbook",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_53_face_Face_woman_0009_batch_1.webp",
            "usageCount": "1309",
            "head_show": false
        },
        {
            "id": 53,
            "sort": 54,
            "style": "Yearbook",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_54_face_Face_woman_0003_batch_1.webp",
            "usageCount": "831",
            "head_show": false
        },
        {
            "id": 54,
            "sort": 55,
            "style": "Yearbook",
            "gender": "Man",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_55_face_Face_man_0004_batch_1.webp",
            "usageCount": "251",
            "head_show": false
        },
        {
            "id": 50,
            "sort": 51,
            "style": "Yearbook",
            "gender": "Man",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_51_face_Face_man_0002_batch_1.webp",
            "usageCount": "340",
            "head_show": false
        },
        {
            "id": 56,
            "sort": 57,
            "style": "Yearbook",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_57_face_Face_woman_0004_batch_0.webp",
            "usageCount": "798",
            "head_show": false
        },
        {
            "id": 55,
            "sort": 56,
            "style": "Yearbook",
            "gender": "Man",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_56_face_Face_man_0004_batch_0.webp",
            "usageCount": "470",
            "head_show": false
        },
        {
            "id": 49,
            "sort": 50,
            "style": "Yearbook",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_50_face_Face_woman_0003_batch_1.webp",
            "usageCount": "2058",
            "head_show": false
        },
        {
            "id": 174,
            "sort": 198,
            "style": "Christmas",
            "gender": "Man",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2F198.webp",
            "usageCount": "189",
            "head_show": false
        },
        {
            "id": 82,
            "sort": 95,
            "style": "Christmas",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_95_face_Face_woman_0002_batch_0.webp",
            "usageCount": "280",
            "head_show": false
        },
        {
            "id": 135,
            "sort": 159,
            "style": "Christmas",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2F159.webp",
            "usageCount": "258",
            "head_show": false
        },
        {
            "id": 154,
            "sort": 178,
            "style": "Christmas",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2F178.webp",
            "usageCount": "254",
            "head_show": false
        },
        {
            "id": 107,
            "sort": 130,
            "style": "Christmas",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_130_face_Face_woman_0007_batch_0.webp",
            "usageCount": "468",
            "head_show": false
        },
        {
            "id": 171,
            "sort": 195,
            "style": "Christmas",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2F195.webp",
            "usageCount": "149",
            "head_show": false
        },
        {
            "id": 155,
            "sort": 179,
            "style": "Christmas",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2F179.webp",
            "usageCount": "140",
            "head_show": false
        },
        {
            "id": 151,
            "sort": 175,
            "style": "Christmas",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2F175.webp",
            "usageCount": "149",
            "head_show": false
        },
        {
            "id": 108,
            "sort": 132,
            "style": "Christmas",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_132_face_Face_woman_0009_batch_1.webp",
            "usageCount": "807",
            "head_show": false
        },
        {
            "id": 131,
            "sort": 155,
            "style": "Christmas",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2F155.webp",
            "usageCount": "170",
            "head_show": false
        },
        {
            "id": 173,
            "sort": 197,
            "style": "Christmas",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2F197.webp",
            "usageCount": "128",
            "head_show": false
        },
        {
            "id": 78,
            "sort": 85,
            "style": "Christmas",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_85_face_Face_woman_0004_batch_1.webp",
            "usageCount": "442",
            "head_show": false
        },
        {
            "id": 134,
            "sort": 158,
            "style": "Christmas",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2F158.webp",
            "usageCount": "152",
            "head_show": false
        },
        {
            "id": 176,
            "sort": 200,
            "style": "Christmas",
            "gender": "Man",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2F200.webp",
            "usageCount": "277",
            "head_show": false
        },
        {
            "id": 81,
            "sort": 91,
            "style": "Christmas",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_91_face_Face_woman_0005_batch_0.webp",
            "usageCount": "309",
            "head_show": false
        },
        {
            "id": 83,
            "sort": 97,
            "style": "Christmas",
            "gender": "Man",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_97_face_Face_man_0001_batch_1.webp",
            "usageCount": "624",
            "head_show": false
        },
        {
            "id": 175,
            "sort": 199,
            "style": "Christmas",
            "gender": "Man",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2F199.webp",
            "usageCount": "1541",
            "head_show": false
        },
        {
            "id": 170,
            "sort": 194,
            "style": "Christmas",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2F194.webp",
            "usageCount": "392",
            "head_show": false
        },
        {
            "id": 132,
            "sort": 156,
            "style": "Christmas",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2F156.webp",
            "usageCount": "160",
            "head_show": false
        },
        {
            "id": 152,
            "sort": 176,
            "style": "Christmas",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2F176.webp",
            "usageCount": "120",
            "head_show": false
        },
        {
            "id": 75,
            "sort": 79,
            "style": "Halloween",
            "gender": "Man",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_79_face_Face_man_0008_batch_1.webp",
            "usageCount": "321",
            "head_show": false
        },
        {
            "id": 119,
            "sort": 143,
            "style": "Halloween",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2F143.webp",
            "usageCount": "526",
            "head_show": false
        },
        {
            "id": 128,
            "sort": 152,
            "style": "Halloween",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2F152.webp",
            "usageCount": "150",
            "head_show": false
        },
        {
            "id": 90,
            "sort": 110,
            "style": "Halloween",
            "gender": "Man",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_110_face_Face_man_0001_batch_1.webp",
            "usageCount": "345",
            "head_show": false
        },
        {
            "id": 86,
            "sort": 106,
            "style": "Halloween",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_106_face_Face_woman_0005_batch_1.webp",
            "usageCount": "259",
            "head_show": false
        },
        {
            "id": 74,
            "sort": 78,
            "style": "Halloween",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_78_face_Face_woman_0009_batch_0.webp",
            "usageCount": "261",
            "head_show": false
        },
        {
            "id": 126,
            "sort": 150,
            "style": "Halloween",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2F150.webp",
            "usageCount": "243",
            "head_show": false
        },
        {
            "id": 120,
            "sort": 144,
            "style": "Halloween",
            "gender": "Man",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2F144.webp",
            "usageCount": "199",
            "head_show": false
        },
        {
            "id": 118,
            "sort": 142,
            "style": "Halloween",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2F142.webp",
            "usageCount": "103",
            "head_show": false
        },
        {
            "id": 69,
            "sort": 73,
            "style": "Halloween",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_73_face_Face_woman_0001_batch_0.webp",
            "usageCount": "389",
            "head_show": false
        },
        {
            "id": 73,
            "sort": 77,
            "style": "Halloween",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_77_face_Face_woman_0005_batch_0.webp",
            "usageCount": "1095",
            "head_show": false
        },
        {
            "id": 121,
            "sort": 145,
            "style": "Halloween",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2F145.webp",
            "usageCount": "460",
            "head_show": false
        },
        {
            "id": 65,
            "sort": 66,
            "style": "Halloween",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_66_face_Face_woman_0007_batch_1.webp",
            "usageCount": "227",
            "head_show": false
        },
        {
            "id": 125,
            "sort": 149,
            "style": "Halloween",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2F149.webp",
            "usageCount": "166",
            "head_show": false
        },
        {
            "id": 123,
            "sort": 147,
            "style": "Halloween",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2F147.webp",
            "usageCount": "371",
            "head_show": false
        },
        {
            "id": 89,
            "sort": 109,
            "style": "Halloween",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_109_face_Face_woman_0003_batch_1.webp",
            "usageCount": "938",
            "head_show": false
        },
        {
            "id": 70,
            "sort": 74,
            "style": "Halloween",
            "gender": "Man",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_74_face_Face_man_0005_batch_0.webp",
            "usageCount": "678",
            "head_show": false
        },
        {
            "id": 66,
            "sort": 68,
            "style": "Halloween",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_68_face_Face_woman_0007_batch_1.webp",
            "usageCount": "223",
            "head_show": false
        },
        {
            "id": 71,
            "sort": 75,
            "style": "Halloween",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_75_face_Face_woman_0004_batch_1.webp",
            "usageCount": "193",
            "head_show": false
        },
        {
            "id": 76,
            "sort": 80,
            "style": "Halloween",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_80_face_Face_woman_0009_batch_0.webp",
            "usageCount": "218",
            "head_show": false
        },
        {
            "id": 129,
            "sort": 153,
            "style": "Halloween",
            "gender": "Man",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2F153.webp",
            "usageCount": "270",
            "head_show": false
        },
        {
            "id": 127,
            "sort": 151,
            "style": "Halloween",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2F151.webp",
            "usageCount": "510",
            "head_show": false
        },
        {
            "id": 77,
            "sort": 81,
            "style": "Halloween",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_81_face_Face_woman_0009_batch_0.webp",
            "usageCount": "283",
            "head_show": false
        },
        {
            "id": 67,
            "sort": 70,
            "style": "Halloween",
            "gender": "Man",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_70_face_Face_man_0005_batch_1.webp",
            "usageCount": "1211",
            "head_show": false
        },
        {
            "id": 124,
            "sort": 148,
            "style": "Halloween",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2F148.webp",
            "usageCount": "379",
            "head_show": false
        },
        {
            "id": 72,
            "sort": 76,
            "style": "Halloween",
            "gender": "Man",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_76_face_Face_man_0004_batch_1.webp",
            "usageCount": "259",
            "head_show": false
        },
        {
            "id": 68,
            "sort": 72,
            "style": "Halloween",
            "gender": "Man",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_72_face_Face_man_0008_batch_0.webp",
            "usageCount": "574",
            "head_show": false
        },
        {
            "id": 100,
            "sort": 121,
            "style": "Halloween",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_121_face_Face_woman_0006_batch_0.webp",
            "usageCount": "9356",
            "head_show": false
        },
        {
            "id": 122,
            "sort": 146,
            "style": "Halloween",
            "gender": "Man",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2F146.webp",
            "usageCount": "172",
            "head_show": false
        },
        {
            "id": 46,
            "sort": 47,
            "style": "Anime",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_47_face_Face_woman_0009_batch_1.webp",
            "usageCount": "3282",
            "head_show": false
        },
        {
            "id": 47,
            "sort": 48,
            "style": "Anime",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_48_face_Face_woman_0004_batch_1.webp",
            "usageCount": "641",
            "head_show": false
        },
        {
            "id": 38,
            "sort": 39,
            "style": "Anime",
            "gender": "Man",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_39_face_Face_man_0004_batch_1.webp",
            "usageCount": "2328",
            "head_show": false
        },
        {
            "id": 37,
            "sort": 38,
            "style": "Anime",
            "gender": "Man",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_38_face_Face_man_0008_batch_1.webp",
            "usageCount": "1197",
            "head_show": false
        },
        {
            "id": 184,
            "sort": 87,
            "style": "Easter",
            "gender": "Man",
            "avatar": "https://pub-static.aiease.ai/aieaseExample%2Fheadshot%2F103.webp",
            "usageCount": "60",
            "head_show": false
        },
        {
            "id": 182,
            "sort": 87,
            "style": "Easter",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/aieaseExample%2Fheadshot%2F101.webp",
            "usageCount": "168",
            "head_show": false
        },
        {
            "id": 79,
            "sort": 88,
            "style": "Easter",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_88_face_Face_woman_0005_batch_1.webp",
            "usageCount": "359",
            "head_show": false
        },
        {
            "id": 183,
            "sort": 87,
            "style": "Easter",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/aieaseExample%2Fheadshot%2F102.webp",
            "usageCount": "60",
            "head_show": false
        },
        {
            "id": 180,
            "sort": 87,
            "style": "Easter",
            "gender": "Man",
            "avatar": "https://pub-static.aiease.ai/aieaseExample%2Fheadshot%2F99.webp",
            "usageCount": "92",
            "head_show": false
        },
        {
            "id": 185,
            "sort": 87,
            "style": "Easter",
            "gender": "Man",
            "avatar": "https://pub-static.aiease.ai/aieaseExample%2Fheadshot%2F104.webp",
            "usageCount": "58",
            "head_show": false
        },
        {
            "id": 181,
            "sort": 87,
            "style": "Easter",
            "gender": "Man",
            "avatar": "https://pub-static.aiease.ai/aieaseExample%2Fheadshot%2F100.webp",
            "usageCount": "138",
            "head_show": false
        },
        {
            "id": 80,
            "sort": 89,
            "style": "Easter",
            "gender": "Woman",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_89_face_Face_woman_0006_batch_0.webp",
            "usageCount": "94",
            "head_show": false
        },
        {
            "id": 109,
            "sort": 133,
            "style": "Easter",
            "gender": "Man",
            "avatar": "https://pub-static.aiease.ai/headshotAvatar%2Fstyle_133_face_Face_man_0009_batch_1.webp",
            "usageCount": "91",
            "head_show": false
        }
    ];

  @override
  Future<List<HeadshotStyleModel>> getStyles() async {
    // Try live API first; fall back to embedded data if API is unavailable or returns empty
    try {
      final response = await dioClient.dio.get(
        'https://www.aiease.ai/api/api/common/style',
        queryParameters: {'gender': 'null', 'style': 'null'},
        options: Options(
          headers: {
            'User-Agent': 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.0 Mobile/15E148 Safari/604.1',
            'Accept': 'application/json',
          },
        ),
      );

      if (response.data != null && response.data['code'] == 200) {
        final List<dynamic> results = response.data['result'] ?? [];
        if (results.isNotEmpty) {
          return results
              .map((json) => HeadshotStyleModel.fromJson(json as Map<String, dynamic>))
              .toList();
        }
      }
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
