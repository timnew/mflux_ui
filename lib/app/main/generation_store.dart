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

  final binaryPathController = TextEditingController();
  final promptController = TextEditingController();

  _GenerationStore() {
    config = const GenerationConfig(
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
    binaryPathController.text = config.binaryPath;
    promptController.text = config.prompt;
    locateBinary();
  }

  @observable
  late GenerationConfig config;

  @computed
  String get prompt => config.prompt;
  set prompt(String value) {
    if (value == config.prompt) return;
    config = config.copyWith(prompt: value);
    promptController.text = value;
  }

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
  set binaryPath(String value) {
    if (value == config.binaryPath) return;
    config = config.copyWith(binaryPath: value);
    binaryPathController.text = value;
  }

  @observable
  MainScreenState state = const MainScreenState.initializing();

  @computed
  bool get isGenerating => state.isGenerating;

  @action
  Future<void> tryGenerate() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    var output = "";

    void addOutput(String text) {
      output += text;
      state = MainScreenState.progress(output);
    }

    state = const MainScreenState.generating();

    formKey.currentState!.save();

    config = config.copyWith(output: generateFileName());

    await ensureDirectory(config.output);

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

      state = MainScreenState.success(config.output);
    } catch (e) {
      state = MainScreenState.error(e.toString());
    }
  }

  String generateFileName() {
    final series = DateFormat("yMdHms").format(DateTime.now());

    return "output/$series.png";
  }

  Future<void> ensureDirectory(String path) async {
    final file = File(path);
    final directory = file.parent;
    if (await directory.exists()) {
      return;
    }
    await directory.create();
  }

  @action
  Future<void> locateBinary() async {
    state = const MainScreenState.initializing();

    if (binaryPathController.text.isNotEmpty) {
      final binaryPath = binaryPathController.text.trim();

      if (await verifyBinaryLocation(binaryPath)) {
        return;
      } else {
        binaryPathController.text = "";
        return;
      }
    }

    final process = await Process.run(
      "which",
      ["mflux-generate"],
      runInShell: true,
    );

    if (process.exitCode != 0) {
      state = MainScreenState.initializationFailed(
        "Failed to locate mflux-generate: Code ${process.exitCode}\n${process.stderr}\n${process.stdout}",
      );
      return;
    }

    final binaryPath = process.stdout.toString().trim();
    await verifyBinaryLocation(binaryPath);
  }

  @action
  Future<bool> verifyBinaryLocation(String binaryPath) async {
    final file = File(binaryPath);

    if (!await file.exists()) {
      state = MainScreenState.initializationFailed(
        "Binary $binaryPath not found",
      );
      return false;
    }

    final stat = await file.stat();
    final canReadAndExecute = ((stat.mode >> 6) & 0x7 & 0x5) > 0;

    if (!canReadAndExecute) {
      state = MainScreenState.initializationFailed(
        "$binaryPath is not executable",
      );
      return false;
    }

    this.binaryPath = binaryPath;
    state = const MainScreenState.idle();

    return true;
  }
}
