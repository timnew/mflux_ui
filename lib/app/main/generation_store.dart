import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mfluxui/features/generation.dart';
import 'package:mfluxui/features/open_ai.dart';
import 'package:mfluxui/features/output.dart';
import 'package:mobx/mobx.dart';

import 'main_screen_state.dart';

part 'generation_store.g.dart';

class GenerationStore = _GenerationStore with _$GenerationStore;

abstract class _GenerationStore with Store {
  final formKey = GlobalKey<FormState>();
  final binaryPathController = TextEditingController();
  final promptController = TextEditingController();

  final OpenAiSettingsPreference oaiSettingsPreference;
  final OpenAiRepository oaiRepository;
  final GenerationOptionsPreference optionsPreference;
  final OutputRepository outputRepository;

  @observable
  String prompt = "";

  @observable
  String binaryPath = "";

  @observable
  MainScreenState state = const MainScreenState.initializing();

  _GenerationStore(
    this.oaiSettingsPreference,
    this.outputRepository,
    this.oaiRepository,
    this.optionsPreference,
  ) {
    autorun((_) => binaryPathController.text = binaryPath);
    autorun((_) => promptController.text = prompt);

    tryLocateBinary();
  }

  @action
  Future<void> tryLocateBinary() async {
    state = const MainScreenState.initializing();

    if (binaryPathController.text.isNotEmpty) {
      final binaryPath = binaryPathController.text.trim();

      try {
        await BinaryLocator.checkBinary(binaryPath);
        state = const MainScreenState.idle();
        return;
      } catch (e) {
        binaryPathController.text = "";
        state = MainScreenState.initializationFailed(e.toString());
        return;
      }
    }

    try {
      final binaryPath = await BinaryLocator.locateBinary();
      binaryPathController.text = binaryPath;
      state = const MainScreenState.idle();
    } catch (e) {
      state = MainScreenState.initializationFailed(e.toString());
    }
  }

  @computed
  OpenAiSettings get oaiSettings => oaiSettingsPreference.value;
  set oaiSettings(OpenAiSettings value) => oaiSettingsPreference.value = value;

  @computed
  bool get oaiSettingsIsNone => oaiSettings.isNone;

  @computed
  @computed
  GenerationOptions get options => optionsPreference.value;
  set options(GenerationOptions value) => optionsPreference.value = value;

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
  FluxModel get model => options.model;
  set model(FluxModel value) {
    options = options.copyWith(model: value);

    switch (value) {
      case FluxModel.schnell:
        setStepRange(2, 4);
      case FluxModel.dev:
        setStepRange(20, 25);
    }
  }

  @computed
  int? get seed => options.seed;
  set seed(int? value) => options = options.copyWith(seed: value);

  @computed
  ImageSize get size => options.size;
  set size(ImageSize value) => options = options.copyWith(size: value);

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
  int get width => options.size.width;
  set width(int value) =>
      options = options.copyWith(size: options.size.copyWith(width: value));

  @computed
  int get height => options.size.height;
  set height(int value) =>
      options = options.copyWith(size: options.size.copyWith(height: value));

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
  int get steps => options.steps;
  set steps(int value) => options = options.copyWith(steps: value);

  @computed
  double? get guidance => options.guidance;
  set guidance(double? value) => options = options.copyWith(guidance: value);

  @computed
  int? get quantize => options.quantize;
  set quantize(int? value) => options = options.copyWith(quantize: value);

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
  bool get isGenerating => state.isGenerating;

  @action
  Future<void> refinePrompt() async {
    try {
      state = const MainScreenState.generating();

      final expanded = await oaiRepository.promptExpand(prompt);

      prompt = expanded;

      state = const MainScreenState.idle();
    } catch (e) {
      state = MainScreenState.error(e.toString());
    }
  }

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

    final request = GenerationRequest(
      options: options,
      binaryPath: binaryPath,
      output: await outputRepository.ensureOutputFileName(),
      prompt: prompt,
    );

    try {
      final process = await request.start();

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

      await outputRepository.checkOutputFile(request.output);

      state = MainScreenState.success(request.output);
    } catch (e) {
      state = MainScreenState.error(e.toString());
    }
  }
}
