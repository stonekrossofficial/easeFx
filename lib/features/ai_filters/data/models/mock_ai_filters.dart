import 'package:easefx_ai/features/ai_filters/data/models/ai_filter_model.dart';

class MockAiFilters {
  static const Map<String, dynamic> _mockResponse = {
    "code": 200,
    "message": "Success",
    "result": {
        "styleTypes": [
            {
                "id": "48",
                "typeName": "Trending",
                "sort": 10
            },
            {
                "id": "41",
                "typeName": "Anime",
                "sort": 20
            },
            {
                "id": "42",
                "typeName": "Art",
                "sort": 30
            },
            {
                "id": "47",
                "typeName": "Toy World",
                "sort": 40
            },
            {
                "id": "45",
                "typeName": "Game",
                "sort": 50
            },
            {
                "id": "44",
                "typeName": "Creative",
                "sort": 60
            },
            {
                "id": "46",
                "typeName": "Halloween",
                "sort": 70
            },
            {
                "id": "43",
                "typeName": "Christmas",
                "sort": 80
            }
        ],
    }
  };

  static List<AiFilterStyleType> get styleTypes {
    final types = _mockResponse['result']['styleTypes'] as List;
    return types.map((e) => AiFilterStyleType.fromJson(e)).toList();
  }

  static List<AiFilterStyle> get styles {
    final list = _mockResponse['result']['styles'] as List;
    return list.map((e) => AiFilterStyle.fromJson(e)).toList();
  }

  static List<AiFilterStyle> get homeStyles {
    final list = _mockResponse['result']['homeStyles'] as List;
    return list.map((e) => AiFilterStyle.fromJson(e)).toList();
  }
}
