import 'dart:io';
import 'package:equatable/equatable.dart';

abstract class HeadshotGeneratorEvent extends Equatable {
  const HeadshotGeneratorEvent();
  @override
  List<Object?> get props => [];
}

class FetchStylesEvent extends HeadshotGeneratorEvent {
  const FetchStylesEvent();
}

class SelectGenderEvent extends HeadshotGeneratorEvent {
  final String gender;
  const SelectGenderEvent(this.gender);
  @override
  List<Object?> get props => [gender];
}

class SelectStyleEvent extends HeadshotGeneratorEvent {
  final int styleId;
  const SelectStyleEvent(this.styleId);
  @override
  List<Object?> get props => [styleId];
}

class GenerateHeadshotEvent extends HeadshotGeneratorEvent {
  final File imageFile;
  const GenerateHeadshotEvent(this.imageFile);
  @override
  List<Object?> get props => [imageFile];
}
