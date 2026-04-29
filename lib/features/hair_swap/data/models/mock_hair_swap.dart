import 'package:easefx_ai/features/hair_swap/data/models/hair_swap_model.dart';

class MockHairSwap {
  static const Map<String, dynamic> _mockResponse = {
    "code": 200,
    "message": "Success",
  };

  static List<HairSwapModel> get hairStyles {
    final list = _mockResponse['result'] as List;
    return list.map((e) => HairSwapModel.fromJson(e)).toList();
  }

  static List<HairSwapModel> get manStyles {
    return hairStyles.where((element) => element.gender == 'Man').toList();
  }

  static List<HairSwapModel> get womanStyles {
    return hairStyles.where((element) => element.gender == 'Woman').toList();
  }
}
