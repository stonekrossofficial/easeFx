class AiFilterStyleType {
  final String id;
  final String typeName;
  final int sort;

  AiFilterStyleType({
    required this.id,
    required this.typeName,
    required this.sort,
  });

  factory AiFilterStyleType.fromJson(Map<String, dynamic> json) {
    return AiFilterStyleType(
      id: json['id'] as String,
      typeName: json['typeName'] as String,
      sort: json['sort'] as int,
    );
  }
}

class AiFilterStyle {
  final String id;
  final String styleName;
  final String avatar;
  final String usageCount;
  final String displayImageBefore;
  final String displayImageAfter;
  final bool hot;
  final bool newFeature;
  final String styleTypeId;
  final bool homePage;
  final int minAccessPermissions;
  final String avatarTitle;
  final String typeName;
  final bool collect;

  AiFilterStyle({
    required this.id,
    required this.styleName,
    required this.avatar,
    required this.usageCount,
    required this.displayImageBefore,
    required this.displayImageAfter,
    required this.hot,
    required this.newFeature,
    required this.styleTypeId,
    required this.homePage,
    required this.minAccessPermissions,
    required this.avatarTitle,
    required this.typeName,
    required this.collect,
  });

  factory AiFilterStyle.fromJson(Map<String, dynamic> json) {
    return AiFilterStyle(
      id: json['id'] as String,
      styleName: json['styleName'] as String,
      avatar: json['avatar'] as String,
      usageCount: json['usageCount'] as String,
      displayImageBefore: json['displayImageBefore'] as String,
      displayImageAfter: json['displayImageAfter'] as String,
      hot: json['hot'] as bool,
      newFeature: json['newFeature'] as bool,
      styleTypeId: json['styleTypeId'] as String,
      homePage: json['homePage'] as bool,
      minAccessPermissions: json['minAccessPermissions'] as int,
      avatarTitle: json['avatarTitle'] as String,
      typeName: json['typeName'] as String,
      collect: json['collect'] as bool,
    );
  }
}
