import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

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
      (_) => _store.status,
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
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("MFlux Generate"),
        ),
        body: Row(
          children: [
            Flexible(
              child: Form(
                key: _store.formKey,
                child: ListView(
                  padding: const EdgeInsets.all(16.0),
                  children: [
                    TextFormField(
                      initialValue: _store.prompt,
                      decoration: const InputDecoration(labelText: 'Prompt'),
                      validator: (value) => (value?.isEmpty ?? true)
                          ? 'Please enter a prompt'
                          : null,
                      onSaved: (value) => _store.prompt = value!,
                    ),
                    Observer(
                      builder: (_) => DropdownButtonFormField<FluxModel>(
                        value: _store.model,
                        decoration: const InputDecoration(labelText: 'Model'),
                        items: _store.modelDropdownItems,
                        onChanged: (value) => _store.model = value!,
                      ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Seed',
                        hintText: "Random seed used for generation",
                      ),
                      initialValue: _store.seed?.toString(),
                      keyboardType: TextInputType.number,
                      onSaved: (value) => _store.seed =
                          value?.isNotEmpty == true ? int.parse(value!) : null,
                    ),
                    Observer(
                      builder: (_) => DropdownButtonFormField<ImageSize>(
                        value: _store.size,
                        decoration: const InputDecoration(labelText: 'Size'),
                        items: _store.sizeDropdownItems,
                        onChanged: (value) => _store.size = value!,
                      ),
                    ),
                    Observer(
                      builder: (_) => InputDecorator(
                        decoration: const InputDecoration(labelText: 'Steps'),
                        child: Row(
                          children: [
                            Expanded(
                              child: Slider(
                                value: _store.steps.toDouble(),
                                min: _store.minStep.toDouble(),
                                max: _store.maxStep.toDouble(),
                                divisions: _store.stepDivisions,
                                label: _store.steps.toString(),
                                onChanged: (value) =>
                                    _store.steps = value.toInt(),
                              ),
                            ),
                            Text(_store.steps.toString()),
                          ],
                        ),
                      ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Guidance',
                        hintText: "Only used by Dev, default to 3.5",
                      ),
                      initialValue: _store.guidance?.toString(),
                      keyboardType: TextInputType.number,
                      onSaved: (value) =>
                          _store.guidance = double.tryParse(value ?? ""),
                    ),
                    Observer(
                      builder: (_) => DropdownButtonFormField<int?>(
                        value: _store.quantize,
                        decoration:
                            const InputDecoration(labelText: 'Quantize'),
                        items: _store.quantizeDropdownItems,
                        onChanged: (value) => _store.quantize = value,
                      ),
                    ),
                    TextFormField(
                      decoration:
                          const InputDecoration(labelText: 'Binary Path'),
                      initialValue: _store.binaryPath,
                      validator: (value) => (value?.isEmpty ?? true)
                          ? 'Please enter a binary path'
                          : null,
                      onSaved: (value) => _store.binaryPath = value!,
                    ),
                    Observer(
                      builder: (_) => ElevatedButton(
                        onPressed:
                            _store.isGenerating ? null : _store.tryGenerate,
                        child: _store.isGenerating
                            ? const CircularProgressIndicator()
                            : const Text('Generate Image'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              child: Observer(
                builder: (_) => _store.status.maybeWhen(
                  progress: (output) => Text(output),
                  success: (fileName) => Image.file(File(fileName)),
                  orElse: () => const SizedBox.shrink(),
                ),
              ),
            ),
          ],
        ),
      );
}
