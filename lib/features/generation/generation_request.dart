import 'dart:io';
import 'package:app_preference/app_preference.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generation_request.freezed.dart';
part 'generation_request.g.dart';

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

  factory ImageSize.fromJson(Map<String, dynamic> json) =>
      _$ImageSizeFromJson(json);
}

@freezed
class GenerationOptions with _$GenerationOptions {
  static const defaultOptions = GenerationOptions(
    model: FluxModel.schnell,
    seed: null,
    size: ImageSize(1024, 1024),
    steps: 2,
    guidance: null,
    quantize: 8,
  );

  const GenerationOptions._();

  @Assert(
    "quantize == null || quantize == 4 || quantize == 8",
    "quantize must be null, 4, or 8",
  )
  @Assert(
    "guidance == null || guidance >= 0.1 && guidance <= 100",
    "guidance must be null, or between 0.1 and 100",
  )
  const factory GenerationOptions({
    required FluxModel model,
    required int? seed,
    required ImageSize size,
    required int steps,
    required double? guidance,
    required int? quantize,
  }) = _GenerationOptions;

  factory GenerationOptions.fromJson(Map<String, dynamic> json) =>
      _$GenerationOptionsFromJson(json);
}

typedef GenerationOptionsPreference = AppPreference<GenerationOptions>;

@freezed
class GenerationRequest with _$GenerationRequest {
  const GenerationRequest._();

  const factory GenerationRequest({
    required GenerationOptions options,
    required String binaryPath,
    required String output,
    required String prompt,
  }) = _GenerationRequest;

  Future<Process> start() async {
    return Process.start(binaryPath, [
      '--prompt',
      prompt,
      '--model',
      options.model.name,
      '--output',
      output,
      if (options.seed != null) ...[
        '--seed',
        options.seed.toString(),
      ],
      '--width',
      options.size.width.toString(),
      '--height',
      options.size.height.toString(),
      '--steps',
      options.steps.toString(),
      if (options.guidance != null) ...[
        '--guidance',
        options.guidance.toString(),
      ],
      if (options.quantize != null) ...[
        '--quantize',
        options.quantize.toString(),
      ],
    ]);
  }
}
