import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generation_config.freezed.dart';

enum FluxModel {
  schnell,
  dev;
}

@freezed
class ImageSize with _$ImageSize {
  const ImageSize._();

  const factory ImageSize(
    int width,
    int height,
  ) = _ImageSize;
}

@freezed
class GenerationConfig with _$GenerationConfig {
  const GenerationConfig._();

  @Assert(
    "quantize == null || quantize == 4 || quantize == 8",
    "quantize must be null, 4, or 8",
  )
  @Assert(
    "guidance == null || guidance >= 0.1 && guidance <= 100",
    "guidance must be null, or between 0.1 and 100",
  )
  const factory GenerationConfig({
    required String binaryPath,
    required String prompt,
    required FluxModel model,
    required String output,
    required int? seed,
    required ImageSize size,
    required int steps,
    required double? guidance,
    required int? quantize,
  }) = _GenerationConfig;

  Future<Process> start() async {
    return Process.start(binaryPath, [
      '--prompt',
      prompt,
      '--model',
      model.name,
      '--output',
      output,
      if (seed != null) ...[
        '--seed',
        seed.toString(),
      ],
      '--width',
      size.width.toString(),
      '--height',
      size.height.toString(),
      '--steps',
      steps.toString(),
      if (guidance != null) ...[
        '--guidance',
        guidance.toString(),
      ],
      if (quantize != null) ...[
        '--quantize',
        quantize.toString(),
      ],
    ]);
  }
}

@freezed
class MainScreenState with _$MainScreenState {
  const MainScreenState._();

  const factory MainScreenState.initializing() = _Initializing;
  const factory MainScreenState.initializationFailed({
    required int exitCode,
    required String stdout,
    required String stderr,
  }) = _InitializationFailed;
  const factory MainScreenState.idle() = _Idle;
  const factory MainScreenState.generating() = _Generating;
  const factory MainScreenState.progress(String output) = _Progress;
  const factory MainScreenState.success(String outputFile) = _Success;
  const factory MainScreenState.error(String message) = _Error;

  bool get isGenerating => this is _Generating || this is _Progress;
}
