import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

import 'generation_config.dart';

part 'generation_store.g.dart';

class GenerationStore = _GenerationStore with _$GenerationStore;

abstract class _GenerationStore with Store {
  static const _binaryPath =
      '/Users/timwen/miniconda3/bin/mflux-generate'; // cSpell:disable-line

  final formKey = GlobalKey<FormState>();

  @observable
  GenerationConfig config = const GenerationConfig(
    binaryPath: _binaryPath,
    prompt: "Asian Boy",
    model: FluxModel.schnell,
    output: "image.png",
    seed: null,
    size: ImageSize(1024, 1024),
    steps: 2,
    guidance: null,
    quantize: null,
  );

  @computed
  String get prompt => config.prompt;
  set prompt(String value) => config = config.copyWith(prompt: value);

  final List<DropdownMenuItem<FluxModel>> modelDropdownItems = const [
    DropdownMenuItem<FluxModel>(
      value: FluxModel.schnell,
      child: Text('Schnell'),
    ),
    DropdownMenuItem<FluxModel>(
      value: FluxModel.dev,
      child: Text('Dev'),
    ),
  ];

  @computed
  FluxModel get model => config.model;
  set model(FluxModel value) {
    config = config.copyWith(model: value);

    switch (value) {
      case FluxModel.schnell:
        setStepRange(2, 4);
      case FluxModel.dev:
        setStepRange(20, 25);
    }
  }

  @computed
  int? get seed => config.seed;
  set seed(int? value) => config = config.copyWith(seed: value);

  @computed
  ImageSize get size => config.size;
  set size(ImageSize value) => config = config.copyWith(size: value);

  final List<DropdownMenuItem<ImageSize>> sizeDropdownItems = const [
    DropdownMenuItem<ImageSize>(
      value: ImageSize(1024, 1024),
      child: Text('1:1'),
    ),
    DropdownMenuItem<ImageSize>(
      value: ImageSize(1024, 768),
      child: Text('4:3'),
    ),
    DropdownMenuItem<ImageSize>(
      value: ImageSize(768, 1024),
      child: Text('3:4'),
    ),
    DropdownMenuItem<ImageSize>(
      value: ImageSize(1024, 576),
      child: Text('16:9'),
    ),
    DropdownMenuItem<ImageSize>(
      value: ImageSize(576, 1024),
      child: Text('9:16'),
    ),
  ];

  @computed
  int get width => config.size.width;
  set width(int value) =>
      config = config.copyWith(size: config.size.copyWith(width: value));

  @computed
  int get height => config.size.height;
  set height(int value) =>
      config = config.copyWith(size: config.size.copyWith(height: value));

  @observable
  int minStep = 2;

  @observable
  int maxStep = 4;

  @action
  void setStepRange(int min, int max) {
    minStep = min;
    if (steps < min) steps = min;
    maxStep = max;
    if (steps > max) steps = max;
  }

  @computed
  int get stepDivisions => maxStep - minStep;

  @computed
  int get steps => config.steps;
  set steps(int value) => config = config.copyWith(steps: value);

  @computed
  double? get guidance => config.guidance;
  set guidance(double? value) => config = config.copyWith(guidance: value);

  @computed
  int? get quantize => config.quantize;
  set quantize(int? value) => config = config.copyWith(quantize: value);

  final List<DropdownMenuItem<int?>> quantizeDropdownItems = const [
    DropdownMenuItem<int?>(
      child: Text('None'),
    ),
    DropdownMenuItem<int?>(
      value: 4,
      child: Text('4 bit'),
    ),
    DropdownMenuItem<int?>(
      value: 8,
      child: Text('8 bit'),
    ),
  ];

  @computed
  String get binaryPath => config.binaryPath;
  set binaryPath(String value) => config = config.copyWith(binaryPath: value);

  @observable
  GenerationStatus status = const GenerationStatus.idle();

  @computed
  bool get isGenerating => status.isGenerating;

  @action
  Future<void> tryGenerate() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    var output = "";

    void addOutput(String text) {
      output += text;
      status = GenerationStatus.progress(output);
    }

    status = const GenerationStatus.generating();

    formKey.currentState!.save();

    config = config.copyWith(output: generateFileName());

    try {
      final process = await config.start();

      final stdoutSubscription =
          process.stdout.transform(utf8.decoder).listen(addOutput);

      final stderrSubscription =
          process.stderr.transform(utf8.decoder).listen(addOutput);

      final exitCode = await process.exitCode;

      await stdoutSubscription.cancel();
      await stderrSubscription.cancel();

      if (exitCode != 0) {
        throw Exception('Generate failed: ${process.stderr}');
      }

      if (!await File(config.output).exists()) {
        throw Exception('Could not found output file');
      }

      status = GenerationStatus.success(config.output);
    } catch (e) {
      status = GenerationStatus.error(e.toString());
    }
  }

  String generateFileName() {
    return DateFormat("yMdHms'.png'").format(DateTime.now());
  }
}
