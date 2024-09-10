import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:mfluxui/features/find_service.dart';
import 'package:mfluxui/features/generation.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

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
    _store = GenerationStore(
      findService(),
      findService(),
      findService(),
    );

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
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Observer(
              builder: (context) => _store.state.maybeWhen(
                initializing: () => const _InitializingPanel(),
                initializationFailed: (message) => _InitializationFailedPanel(
                  message: message,
                ),
                orElse: () => Row(
                  children: [
                    _PanelContainer(
                      child: _Form(store: _store),
                    ),
                    Observer(
                      builder: (_) => _store.state.maybeWhen(
                        progress: (output) => _PanelContainer(
                          flex: 2,
                          child: _OutputMessage(message: output),
                        ),
                        success: (fileName) => _PanelContainer(
                          flex: 2,
                          child: _ImagePreview(fileName: fileName),
                        ),
                        error: (message) => _PanelContainer(
                          flex: 2,
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
  final String message;

  const _InitializationFailedPanel({
    required this.message,
  });

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Failed to locate mflux-generate binary"),
            if (message.isNotEmpty) ...[
              const Gap(16),
              Text(message),
            ],
            const Gap(32),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Manual Set mflux-generate Path',
              ),
              controller: context.read<GenerationStore>().binaryPathController,
            ),
            const Gap(32),
            TextButton(
              onPressed: () =>
                  context.read<GenerationStore>().tryLocateBinary(),
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
        child: ListView(
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
            CallbackShortcuts(
              bindings: {
                const SingleActivator(LogicalKeyboardKey.enter, control: true):
                    store.tryGenerate,
                const SingleActivator(LogicalKeyboardKey.enter, shift: true):
                    store.refinePrompt,
              },
              child: TextFormField(
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
            ),
            const Gap(32),
            Row(
              children: [
                Observer(
                  builder: (_) => FilledButton.tonal(
                    onPressed: store.isGenerating ? null : store.refinePrompt,
                    child: const Text('Refine (⇧Enter)'),
                  ),
                ),
                const Gap(16),
                Observer(
                  builder: (_) => FilledButton(
                    onPressed: store.isGenerating ? null : store.tryGenerate,
                    child: const Text('Generate (^Enter)'),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}

class _PanelContainer extends StatelessWidget {
  final Widget child;
  final int flex;

  const _PanelContainer({required this.child, this.flex = 1});

  @override
  Widget build(BuildContext context) => Flexible(
        flex: flex,
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
