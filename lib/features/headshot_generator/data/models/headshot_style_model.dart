import 'package:easefx_ai/features/headshot_generator/domain/entities/headshot_style.dart';

class HeadshotStyleModel {
  final int id;
  final int sort;
  final String style;
  final String gender;
  final String avatar;
  final String usageCount;
  final bool headShow;

  const HeadshotStyleModel({
    required this.id,
    required this.sort,
    required this.style,
    required this.gender,
    required this.avatar,
    required this.usageCount,
    required this.headShow,
  });

  factory HeadshotStyleModel.fromJson(Map<String, dynamic> json) {
    // usageCount can be int or String depending on the API response vs fallback data
    final rawUsage = json['usageCount'];
    final usageStr = rawUsage != null ? rawUsage.toString() : '0';

    return HeadshotStyleModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      sort: (json['sort'] as num?)?.toInt() ?? 0,
      style: json['style'] as String? ?? '',
      gender: json['gender'] as String? ?? '',
      avatar: json['avatar'] as String? ?? '',
      usageCount: usageStr,
      headShow: json['head_show'] as bool? ?? false,
    );
  }

  HeadshotStyle toEntity() {
    return HeadshotStyle(
      id: id,
      sort: sort,
      style: style,
      gender: gender,
      avatar: avatar,
      usageCount: usageCount,
      headShow: headShow,
    );
  }
}
