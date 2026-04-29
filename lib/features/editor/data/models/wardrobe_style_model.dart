class WardrobeStyleModel {
  final String id;
  final String style;
  final String gender;
  final String displayUrl;
  final String beforeUrl;
  final bool hot;
  final bool showFirst;
  final String usageCount;

  const WardrobeStyleModel({
    required this.id,
    required this.style,
    required this.gender,
    required this.displayUrl,
    required this.beforeUrl,
    required this.hot,
    required this.showFirst,
    required this.usageCount,
  });

  factory WardrobeStyleModel.fromJson(Map<String, dynamic> json) {
    return WardrobeStyleModel(
      id: json['id'] as String,
      style: json['style'] as String,
      gender: json['gender'] as String,
      displayUrl: json['displayUrl'] as String,
      beforeUrl: json['beforeUrl'] as String,
      hot: json['hot'] as bool,
      showFirst: json['showFirst'] as bool,
      usageCount: json['usageCount'] as String,
    );
  }

  factory WardrobeStyleModel.fromApiJson(Map<String, dynamic> json, String gender) {
    final tags = json['tags'] as List<dynamic>? ?? [];
    return WardrobeStyleModel(
      id: json['id']?.toString() ?? '',
      style: json['style'] as String? ?? 'Unknown',
      gender: gender,
      displayUrl: json['displayUrl'] as String? ?? '',
      beforeUrl: '', // Not provided by the API
      hot: tags.contains('Trending'),
      showFirst: false,
      usageCount: '',
    );
  }
}
