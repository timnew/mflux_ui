// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generation_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GenerationStore on _GenerationStore, Store {
  Computed<String>? _$promptComputed;

  @override
  String get prompt => (_$promptComputed ??=
          Computed<String>(() => super.prompt, name: '_GenerationStore.prompt'))
      .value;
  Computed<FluxModel>? _$modelComputed;

  @override
  FluxModel get model =>
      (_$modelComputed ??= Computed<FluxModel>(() => super.model,
              name: '_GenerationStore.model'))
          .value;
  Computed<int?>? _$seedComputed;

  @override
  int? get seed => (_$seedComputed ??=
          Computed<int?>(() => super.seed, name: '_GenerationStore.seed'))
      .value;
  Computed<ImageSize>? _$sizeComputed;

  @override
  ImageSize get size => (_$sizeComputed ??=
          Computed<ImageSize>(() => super.size, name: '_GenerationStore.size'))
      .value;
  Computed<int>? _$widthComputed;

  @override
  int get width => (_$widthComputed ??=
          Computed<int>(() => super.width, name: '_GenerationStore.width'))
      .value;
  Computed<int>? _$heightComputed;

  @override
  int get height => (_$heightComputed ??=
          Computed<int>(() => super.height, name: '_GenerationStore.height'))
      .value;
  Computed<int>? _$stepDivisionsComputed;

  @override
  int get stepDivisions =>
      (_$stepDivisionsComputed ??= Computed<int>(() => super.stepDivisions,
              name: '_GenerationStore.stepDivisions'))
          .value;
  Computed<int>? _$stepsComputed;

  @override
  int get steps => (_$stepsComputed ??=
          Computed<int>(() => super.steps, name: '_GenerationStore.steps'))
      .value;
  Computed<double?>? _$guidanceComputed;

  @override
  double? get guidance =>
      (_$guidanceComputed ??= Computed<double?>(() => super.guidance,
              name: '_GenerationStore.guidance'))
          .value;
  Computed<int?>? _$quantizeComputed;

  @override
  int? get quantize =>
      (_$quantizeComputed ??= Computed<int?>(() => super.quantize,
              name: '_GenerationStore.quantize'))
          .value;
  Computed<String>? _$binaryPathComputed;

  @override
  String get binaryPath =>
      (_$binaryPathComputed ??= Computed<String>(() => super.binaryPath,
              name: '_GenerationStore.binaryPath'))
          .value;
  Computed<bool>? _$isGeneratingComputed;

  @override
  bool get isGenerating =>
      (_$isGeneratingComputed ??= Computed<bool>(() => super.isGenerating,
              name: '_GenerationStore.isGenerating'))
          .value;

  late final _$configAtom =
      Atom(name: '_GenerationStore.config', context: context);

  @override
  GenerationConfig get config {
    _$configAtom.reportRead();
    return super.config;
  }

  @override
  set config(GenerationConfig value) {
    _$configAtom.reportWrite(value, super.config, () {
      super.config = value;
    });
  }

  late final _$minStepAtom =
      Atom(name: '_GenerationStore.minStep', context: context);

  @override
  int get minStep {
    _$minStepAtom.reportRead();
    return super.minStep;
  }

  @override
  set minStep(int value) {
    _$minStepAtom.reportWrite(value, super.minStep, () {
      super.minStep = value;
    });
  }

  late final _$maxStepAtom =
      Atom(name: '_GenerationStore.maxStep', context: context);

  @override
  int get maxStep {
    _$maxStepAtom.reportRead();
    return super.maxStep;
  }

  @override
  set maxStep(int value) {
    _$maxStepAtom.reportWrite(value, super.maxStep, () {
      super.maxStep = value;
    });
  }

  late final _$statusAtom =
      Atom(name: '_GenerationStore.status', context: context);

  @override
  GenerationStatus get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(GenerationStatus value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  late final _$tryGenerateAsyncAction =
      AsyncAction('_GenerationStore.tryGenerate', context: context);

  @override
  Future<void> tryGenerate() {
    return _$tryGenerateAsyncAction.run(() => super.tryGenerate());
  }

  late final _$_GenerationStoreActionController =
      ActionController(name: '_GenerationStore', context: context);

  @override
  void setStepRange(int min, int max) {
    final _$actionInfo = _$_GenerationStoreActionController.startAction(
        name: '_GenerationStore.setStepRange');
    try {
      return super.setStepRange(min, max);
    } finally {
      _$_GenerationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
config: ${config},
minStep: ${minStep},
maxStep: ${maxStep},
status: ${status},
prompt: ${prompt},
model: ${model},
seed: ${seed},
size: ${size},
width: ${width},
height: ${height},
stepDivisions: ${stepDivisions},
steps: ${steps},
guidance: ${guidance},
quantize: ${quantize},
binaryPath: ${binaryPath},
isGenerating: ${isGenerating}
    ''';
  }
}
