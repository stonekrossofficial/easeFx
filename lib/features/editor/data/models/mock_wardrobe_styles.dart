import 'wardrobe_style_model.dart';

class MockWardrobeStyles {
  static final List<WardrobeStyleModel> styles = _rawJson
      .map((json) => WardrobeStyleModel.fromJson(json))
      .toList();

  static const List<Map<String, dynamic>> _rawJson = [

  ];
}
