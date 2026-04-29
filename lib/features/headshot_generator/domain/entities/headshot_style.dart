import 'package:equatable/equatable.dart';

class HeadshotStyle extends Equatable {
  final int id;
  final int sort;
  final String style;
  final String gender;
  final String avatar;
  final String usageCount;
  final bool headShow;

  const HeadshotStyle({
    required this.id,
    required this.sort,
    required this.style,
    required this.gender,
    required this.avatar,
    required this.usageCount,
    required this.headShow,
  });

  @override
  List<Object?> get props => [
        id,
        sort,
        style,
        gender,
        avatar,
        usageCount,
        headShow,
      ];
}
