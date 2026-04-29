import 'package:equatable/equatable.dart';

abstract class EditorState extends Equatable {
  const EditorState();

  @override
  List<Object?> get props => [];
}

class EditorInitial extends EditorState {}

class EditorLoading extends EditorState {
  final String message;
  const EditorLoading({this.message = "Enhancing with AI..."});

  @override
  List<Object?> get props => [message];
}

class EditorLoaded extends EditorState {
  final String resultImageUrl;

  const EditorLoaded({required this.resultImageUrl});

  @override
  List<Object?> get props => [resultImageUrl];
}

class EditorError extends EditorState {
  final String message;

  const EditorError({required this.message});

  @override
  List<Object?> get props => [message];
}
