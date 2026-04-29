import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easefx_ai/features/headshot_generator/domain/usecases/get_headshot_styles.dart';
import 'headshot_generator_event.dart';
import 'headshot_generator_state.dart';

class HeadshotGeneratorBloc extends Bloc<HeadshotGeneratorEvent, HeadshotGeneratorState> {
  final GetHeadshotStyles getHeadshotStyles;

  HeadshotGeneratorBloc(this.getHeadshotStyles):

        super(const HeadshotGeneratorState()) {
    on<FetchStylesEvent>(_onFetchStyles);
    on<SelectGenderEvent>(_onSelectGender);
    on<SelectStyleEvent>(_onSelectStyle);
    on<GenerateHeadshotEvent>(_onGenerateHeadshot);
  }

  Future<void> _onFetchStyles(FetchStylesEvent event, Emitter<HeadshotGeneratorState> emit) async {
    emit(state.copyWith(status: HeadshotGeneratorStatus.loading));
    final result = await getHeadshotStyles();
    result.fold(
      (failure) => emit(state.copyWith(
        status: HeadshotGeneratorStatus.error,
        failure: failure,
      )),
      (styles) => emit(state.copyWith(
        status: HeadshotGeneratorStatus.loaded,
        styles: styles,
        selectedGender: 'Man',
      )),
    );
  }

  void _onSelectGender(SelectGenderEvent event, Emitter<HeadshotGeneratorState> emit) {
    if (state.status == HeadshotGeneratorStatus.loaded || state.status == HeadshotGeneratorStatus.success) {
      emit(state.copyWith(selectedGender: event.gender));
    }
  }

  void _onSelectStyle(SelectStyleEvent event, Emitter<HeadshotGeneratorState> emit) {
    if (state.status == HeadshotGeneratorStatus.loaded || state.status == HeadshotGeneratorStatus.success) {
      emit(state.copyWith(selectedStyleId: event.styleId));
    }
  }

  Future<void> _onGenerateHeadshot(GenerateHeadshotEvent event, Emitter<HeadshotGeneratorState> emit) async {
    if (state.selectedStyleId == null) return;

    emit(state.copyWith(status: HeadshotGeneratorStatus.generating));

    try {
      final resultUrl = '';
      emit(state.copyWith(
        status: HeadshotGeneratorStatus.success,
        resultUrl: resultUrl,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: HeadshotGeneratorStatus.loaded, // revert so user can retry
        failure: null,
      ));
      // Re-emit an error state with the message so listener can show snackbar
      emit(state.copyWith(
        status: HeadshotGeneratorStatus.error,
      ));
    }
  }
}
