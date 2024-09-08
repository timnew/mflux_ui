import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generation_config.freezed.dart';

enum FluxModel {
  schnell,
  dev;
}

typedef ImageSize = (int, int);

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
    final (width, height) = size;

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
      width.toString(),
      '--height',
      height.toString(),
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
class GenerationStatus with _$GenerationStatus {
  const GenerationStatus._();

  const factory GenerationStatus.idle() = _Idle;
  const factory GenerationStatus.generating() = _Generating;
  const factory GenerationStatus.progress(String output) = _Progress;
  const factory GenerationStatus.success(String outputFile) = _Success;
  const factory GenerationStatus.error(String message) = _Error;

  bool get isGenerating => this is _Generating || this is _Progress;
}
