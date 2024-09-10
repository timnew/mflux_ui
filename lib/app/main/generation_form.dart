import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:mfluxui/features/generation.dart';

import 'generation_store.dart';

class GenerationForm extends StatelessWidget {
  final GenerationStore store;

  const GenerationForm({required this.store});

  @override
  Widget build(BuildContext context) => Form(
        key: store.formKey,
        child: ListView(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Binary Path',
                floatingLabelBehavior: FloatingLabelBehavior.always,
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
                  floatingLabelBehavior: FloatingLabelBehavior.always,
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
                floatingLabelBehavior: FloatingLabelBehavior.always,
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
                  floatingLabelBehavior: FloatingLabelBehavior.always,
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
                  floatingLabelBehavior: FloatingLabelBehavior.always,
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
                floatingLabelBehavior: FloatingLabelBehavior.always,
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
                  floatingLabelBehavior: FloatingLabelBehavior.always,
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
                  floatingLabelBehavior: FloatingLabelBehavior.always,
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
                    onPressed: store.isGenerating || store.oaiSettingsIsNone
                        ? null
                        : store.refinePrompt,
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
