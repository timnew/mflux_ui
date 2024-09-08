import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import 'generation_config.dart';
import 'generation_store.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late final GenerationStore _store;

  @override
  void initState() {
    super.initState();
    _store = GenerationStore();

    reaction(
      (_) => _store.state,
      (status) {
        status.whenOrNull(
          error: (e) => ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error generating image: $e'),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) => Provider.value(
        value: _store,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("MFlux UI"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Observer(
              builder: (context) => _store.state.maybeWhen(
                initializing: () => const _InitializingPanel(),
                initializationFailed: (exitCode, stdout, stderr) =>
                    _InitializationFailedPanel(
                  exitCode: exitCode,
                  stdout: stdout,
                  stderr: stderr,
                ),
                orElse: () => Row(
                  children: [
                    _PanelContainer(
                      child: _Form(store: _store),
                    ),
                    Observer(
                      builder: (_) => _store.state.maybeWhen(
                        progress: (output) => _PanelContainer(
                          child: _OutputMessage(message: output),
                        ),
                        success: (fileName) => _PanelContainer(
                          child: _ImagePreview(fileName: fileName),
                        ),
                        error: (message) => _PanelContainer(
                          child: _OutputMessage(message: message),
                        ),
                        orElse: () => const SizedBox.shrink(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}

class _InitializingPanel extends StatelessWidget {
  const _InitializingPanel();

  @override
  Widget build(BuildContext context) => const Center(
        child: Text("Initializing..."),
      );
}

class _InitializationFailedPanel extends StatelessWidget {
  final int exitCode;
  final String stdout;
  final String stderr;

  const _InitializationFailedPanel({
    required this.exitCode,
    required this.stdout,
    required this.stderr,
  });

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Initialization failed"),
            if (exitCode != 0) ...[
              const Gap(16),
              Text("Error code: $exitCode"),
            ],
            if (stderr.isNotEmpty) ...[
              const Gap(16),
              Text(stderr),
            ],
            if (stdout.isNotEmpty) ...[
              const Gap(16),
              Text(stdout),
            ],
            const Gap(32),
            TextButton(
              onPressed: () => context.read<GenerationStore>().locateBinary(),
              child: const Text("Try again"),
            ),
          ],
        ),
      );
}

class _Form extends StatelessWidget {
  final GenerationStore store;

  const _Form({required this.store});

  @override
  Widget build(BuildContext context) => Form(
        key: store.formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Binary Path',
              ),
              controller: store.binaryPathController,
              validator: (value) => (value?.isEmpty ?? true)
                  ? 'Please enter a binary path'
                  : null,
              onSaved: (value) => store.binaryPath = value!,
            ),
            const Gap(16),
            Observer(
              builder: (_) => DropdownButtonFormField<FluxModel>(
                value: store.model,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Model',
                ),
                items: store.modelDropdownItems,
                onChanged: (value) => store.model = value!,
              ),
            ),
            const Gap(16),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Seed',
                hintText: "Random seed used for generation",
              ),
              initialValue: store.seed?.toString(),
              validator: (value) =>
                  (value?.isNotEmpty ?? false) && int.tryParse(value!) == null
                      ? 'Please enter a valid seed'
                      : null,
              keyboardType: TextInputType.number,
              onSaved: (value) => store.seed =
                  value?.isNotEmpty == true ? int.parse(value!) : null,
            ),
            const Gap(16),
            Observer(
              builder: (_) => DropdownButtonFormField<ImageSize>(
                value: store.size,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Size',
                ),
                items: store.sizeDropdownItems,
                onChanged: (value) => store.size = value!,
              ),
            ),
            const Gap(16),
            Observer(
              builder: (_) => InputDecorator(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Steps',
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Slider(
                        value: store.steps.toDouble(),
                        min: store.minStep.toDouble(),
                        max: store.maxStep.toDouble(),
                        divisions: store.stepDivisions,
                        label: store.steps.toString(),
                        onChanged: (value) => store.steps = value.toInt(),
                      ),
                    ),
                    Text(store.steps.toString()),
                  ],
                ),
              ),
            ),
            const Gap(16),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Guidance',
                hintText: "Only used by Dev, default to 3.5",
              ),
              enabled: store.model == FluxModel.dev,
              initialValue: store.guidance?.toString(),
              keyboardType: TextInputType.number,
              onSaved: (value) => store.guidance = double.tryParse(value ?? ""),
            ),
            const Gap(16),
            Observer(
              builder: (_) => DropdownButtonFormField<int?>(
                value: store.quantize,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Quantize',
                ),
                items: store.quantizeDropdownItems,
                onChanged: (value) => store.quantize = value,
              ),
            ),
            const Gap(16),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Prompt',
              ),
              minLines: 5,
              maxLines: 10,
              controller: store.promptController,
              validator: (value) =>
                  (value?.isEmpty ?? true) ? 'Please enter a prompt' : null,
              onSaved: (value) => store.prompt = value!,
            ),
            const Gap(32),
            Observer(
              builder: (_) => FilledButton.tonal(
                onPressed: store.isGenerating ? null : store.tryGenerate,
                child: store.isGenerating
                    ? const CircularProgressIndicator()
                    : const Text('Generate Image'),
              ),
            ),
          ],
        ),
      );
}

class _PanelContainer extends StatelessWidget {
  final Widget child;

  const _PanelContainer({required this.child});

  @override
  Widget build(BuildContext context) => Flexible(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: child,
        ),
      );
}

class _ImagePreview extends StatelessWidget {
  final String fileName;

  const _ImagePreview({required this.fileName});

  @override
  Widget build(BuildContext context) => Image.file(File(fileName));
}

class _OutputMessage extends StatelessWidget {
  final String message;

  const _OutputMessage({required this.message});

  @override
  Widget build(BuildContext context) => Text(message);
}
