import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_screen_state.freezed.dart';

@freezed
class MainScreenState with _$MainScreenState {
  const MainScreenState._();

  const factory MainScreenState.initializing() = _Initializing;
  const factory MainScreenState.initializationFailed(String message) =
      _InitializationFailed;
  const factory MainScreenState.idle() = _Idle;
  const factory MainScreenState.generating() = _Generating;
  const factory MainScreenState.progress(String output) = _Progress;
  const factory MainScreenState.success(String outputFile) = _Success;
  const factory MainScreenState.error(String message) = _Error;

  bool get isGenerating => this is _Generating || this is _Progress;
}
