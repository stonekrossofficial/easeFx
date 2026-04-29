import 'package:equatable/equatable.dart';
import 'package:easefx_ai/core/error/failures.dart';
import 'package:easefx_ai/features/headshot_generator/domain/entities/headshot_style.dart';

enum HeadshotGeneratorStatus { initial, loading, loaded, generating, success, error }

class HeadshotGeneratorState extends Equatable {
  final HeadshotGeneratorStatus status;
  final List<HeadshotStyle> styles;
  final String selectedGender;
  final int? selectedStyleId;
  final AppFailure? failure;
  final String? resultUrl; // Set when generation succeeds

  const HeadshotGeneratorState({
    this.status = HeadshotGeneratorStatus.initial,
    this.styles = const [],
    this.selectedGender = 'Man',
    this.selectedStyleId,
    this.failure,
    this.resultUrl,
  });

  HeadshotGeneratorState copyWith({
    HeadshotGeneratorStatus? status,
    List<HeadshotStyle>? styles,
    String? selectedGender,
    int? selectedStyleId,
    AppFailure? failure,
    String? resultUrl,
  }) {
    return HeadshotGeneratorState(
      status: status ?? this.status,
      styles: styles ?? this.styles,
      selectedGender: selectedGender ?? this.selectedGender,
      selectedStyleId: selectedStyleId ?? this.selectedStyleId,
      failure: failure ?? this.failure,
      resultUrl: resultUrl ?? this.resultUrl,
    );
  }

  @override
  List<Object?> get props => [
        status,
        styles,
        selectedGender,
        selectedStyleId,
        failure,
        resultUrl,
      ];
}
