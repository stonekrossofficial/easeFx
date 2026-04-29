class HairSwapModel {
  final String id;
  final String name;
  final String gender;
  final String url;

  HairSwapModel({
    required this.id,
    required this.name,
    required this.gender,
    required this.url,
  });

  factory HairSwapModel.fromJson(Map<String, dynamic> json) {
    return HairSwapModel(
      id: json['id'] as String,
      name: json['name'] as String,
      gender: json['gender'] as String,
      url: json['url'] as String,
    );
  }
}
