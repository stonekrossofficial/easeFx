import 'dart:io';
import 'package:equatable/equatable.dart';

abstract class EditorEvent extends Equatable {
  const EditorEvent();

  @override
  List<Object?> get props => [];
}

/// Fired when user picks a photo and taps "Apply Cloth Changer"
class GenerateClothChangeEvent extends EditorEvent {
  final File imageFile;
  final String styleId;

  const GenerateClothChangeEvent({
    required this.imageFile,
    required this.styleId,
  });

  @override
  List<Object?> get props => [imageFile.path, styleId];
}

/// Fired when user taps Save
class SaveResultEvent extends EditorEvent {
  final String imageUrl;
  const SaveResultEvent({required this.imageUrl});

  @override
  List<Object?> get props => [imageUrl];
}

/// Reset editor back to initial
class ResetEditorEvent extends EditorEvent {}
