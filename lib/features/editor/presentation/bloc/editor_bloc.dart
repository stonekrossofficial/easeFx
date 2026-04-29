import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easefx_ai/features/editor/data/repositories/ai_ease_repository.dart';
import 'editor_event.dart';
import 'editor_state.dart';

class EditorBloc extends Bloc<EditorEvent, EditorState> {
  final AiEaseRepository _repository;

  EditorBloc({AiEaseRepository? repository})
      : _repository = repository ?? AiEaseRepository(),
        super(EditorInitial()) {
    on<GenerateClothChangeEvent>(_onGenerate);
    on<ResetEditorEvent>(_onReset);
  }

  Future<void> _onGenerate(
    GenerateClothChangeEvent event,
    Emitter<EditorState> emit,
  ) async {
    emit(const EditorLoading(message: "Uploading your image..."));

    try {
      // Runs the full 4-step flow:
      // 1. Get signed upload URL
      // 2. Upload binary
      // 3. Trigger AI generation
      // 4. Poll until result ready
      final resultUrl = await _repository.generateClothChange(
        event.imageFile,
        event.styleId,
      );

      emit(EditorLoaded(resultImageUrl: resultUrl));
    } catch (e) {
      emit(EditorError(message: e.toString()));
    }
  }

  void _onReset(ResetEditorEvent event, Emitter<EditorState> emit) {
    emit(EditorInitial());
  }
}
